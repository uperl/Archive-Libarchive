#!/usr/bin/env perl

use strict;
use warnings;
use LibarchiveRef;
use File::chdir;
use FFI::Platypus 1.00;
use FFI::ExtractSymbols;
use Path::Tiny qw( path );
use Clang::CastXML;
use Const::Introspect::C;
use YAML qw( Dump );
use List::Util 1.33 qw( all sum0 );
use PerlX::Maybe;
use Template;
use 5.020;
use experimental qw( signatures );

my %optional;
my %manual;
my $ffi;
my $archive_h;
my $entry_h;
my %count = (
  manual     => 0,
  generated  => 0,
  incomplete => 0,
  removed    => 0,
);

{
  my %in_oldest;

  {
    my $version = '3.0.2';
    local $CWD = "/opt/libarchive/$version/lib";
    my $so = "libarchive.so";
    $so = readlink $so if -l $so;
    say "# libarchive $version, so=$so";

    extract_symbols($so,
      code => sub ($symbol, $) {
        return unless $symbol =~ /^archive_/;
        $in_oldest{$symbol} = 1;
      },
    );
  }

  {
    my $version = ref_config->{LATEST};
    local $CWD = "/opt/libarchive/$version/lib";
    my $so = "libarchive.so";
    $so = readlink $so if -l $so;
    say "# libarchive $version, so=$so";

    extract_symbols($so,
      code => sub ($symbol, $) {
        return unless $symbol =~ /^archive_/;
        return if $in_oldest{$symbol};
        $optional{$symbol} = 1;
      },
    );
  }

  {
    my $castxml = Clang::CastXML->new;

    $archive_h = $castxml->introspect( path('/usr/include/archive.h') )->to_href;
    $entry_h   = $castxml->introspect( path('/usr/include/archive_entry.h') )->to_href;
  }

  {
    my $original = \&FFI::Platypus::DL::dlsym;
    no warnings 'redefine';
    local *FFI::Platypus::DL::dlsym = sub ($handle, $symbol) {
      $manual{$symbol} = 1;
      return $original->($handle, $symbol);
    };
    no warnings 'once';
    $Archive::Libarchive::no_gen = 1;
    require Archive::Libarchive;
  }

  $count{manual} = scalar keys %manual;
  $ffi = Archive::Libarchive::Lib->ffi;
}

my $tt = Template->new({
  INCLUDE_PATH => [path(__FILE__)->parent->child('tt')->stringify],
  FILTERS => {
    type => sub ($name) {
      $name ne '' ? "'$name'" : 'undef';
    },
  },
});

{
  my %bindings;
  my %functions;
  process_functions($archive_h, \%functions, \%bindings);
  process_functions($entry_h,   \%functions, \%bindings);
  generate(\%functions, \%bindings);
}

{
  my $c = Const::Introspect::C->new(
    headers => ['archive.h','archive_entry.h'],
  );

  my @const;

  foreach my $const ($c->get_macro_constants)
  {
    next unless $const->name =~ /^ARCHIVE_/;
    next if $const->name eq 'ARCHIVE_VERSION_NUMBER';
    next unless $const->type eq 'int';
    push @const, $const;
  }

  my $path = 'lib/Archive/Libarchive/Lib/Constants.pm';

  $tt->process('Const.pm.tt', {
    class => 'Constants',
    constants => [sort { $a->name cmp $b->name } @const],
  }, $path) or do {
    say "Error generating $path @{[ $tt->error ]}";
    exit 2;
  };


}

sub process_functions ($href, $global, $bindings)
{
  my %id;

  my $get_type = sub ($name, $id)
  {
    my $type = $id{$id};
    return $type->{platypus_type} if defined $type->{platypus_type};

    if($type->{_class} =~ /^(FundamentalType|Typedef|Struct)$/)
    {
      my $ctype = $type->{name};
      $ctype = 'long' if $ctype eq 'long int';
      $ctype = 'sint64' if $ctype eq 'la_int64_t';
      $ctype = 'ulong' if $ctype eq 'long unsigned int';
      $ctype = 'uint' if $ctype eq 'unsigned int';
      $ctype = 'ssize_t' if $ctype eq 'la_ssize_t';
      if(eval { $ffi->type($ctype) })
      {
        return $type->{platypus_type} = $ctype;
      }
    }

    if($type->{_class} =~  /^(CvQualifiedType|ElaboratedType)$/ )
    {
      return $type->{platypus_type} = __SUB__->($name, $type->{type});
    }

    if($type->{_class} eq 'PointerType')
    {
      my $target_type = __SUB__->($name, $type->{type});
      if(defined $target_type)
      {
        if($target_type eq 'char')
        {
          return $type->{platypus_type} = 'string';
        }
        elsif($target_type eq 'wchar_t')
        {
          return $type->{platypus_type} = 'wstring'
        }
        elsif($target_type eq 'void')
        {
          return $type->{platypus_type} = 'opaque'
        }
        elsif($target_type =~ /^(archive|archive_entry|archive_entry_linkresolver)$/)
        {
          return $type->{platypus_type} = $target_type;
        }
        elsif($target_type =~ /^(int|string|size_t|ssize_t|ulong|uint|sint64)$/)
        {
          return $type->{platypus_type} = "$target_type*";
        }
      }

      $type->{target_type} = $target_type;
    }

    say "unhandled type:";
    say Dump({ $name => $type });
    return undef;
  };

  foreach my $item ($href->{inner}->@*)
  {
    $id{$item->{id}} = $item if exists $item->{id} && defined $item->{id};
  }

  my %functions;

  foreach my $f (grep { $_->{_class} eq 'Function' && $_->{name} =~ /^archive_/ } $href->{inner}->@*)
  {
    $functions{$f->{name}} = $f;
  }

  {
    my @prune;

    foreach my $name (keys %functions)
    {
      # if there is a _utf8 variant we don't really want
      # to muck with the ASCII or wchar_t variant since
      # Perl uses UTF-8 internally.
      if($name =~ /^(.*)_utf8$/)
      {
        push @prune, $1, "${1}_w";
      }

      # Some methods need to be implemented manually with
      # wrappers or if they have unusual name changes,
      # so we remove them here.
      push @prune, $name if $manual{$name};

      # From the header file:
      # Return an opaque ACL object.
      # There's not yet anything clients can actually do with this...
      push @prune, $name if $name eq 'archive_entry_acl';

      # we use the newer next_header2 method
      push @prune, $name if $name eq 'archive_read_next_header';
    }

    foreach my $name (@prune)
    {
      if(delete $functions{$name})
      {
        $count{removed}++;
      }
    }
  }

  foreach my $name (sort keys %functions)
  {
    my $f = $functions{$name};
    my $ret_type = $get_type->($name, $f->{returns});
    my @arg_types = map { $get_type->($name, $_->{type} ) } $f->{inner}->@*;

    my $class;
    my $orig = $name;
    my $opt = $optional{$orig} ? 1 : undef;
    my $perl_name;

    if($ret_type =~ /^archive/)
    {
      say "warning: $name returns $ret_type (check ownership)";
    }

    if(defined $arg_types[0])
    {
      if($arg_types[0] eq 'archive_entry' && $name =~ /^archive_entry_(.*)$/)
      {
        $class = 'Entry';
        $name = $1;
      }

      if($arg_types[0] eq 'archive_entry_linkresolver' && $name =~ /^archive_entry_linkresolver_(.*)$/)
      {
        $class = 'Entry::LinkResolver';
        $name = $1;
      }

      if($arg_types[0] eq 'archive')
      {
        if($name =~ /^archive_write_disk_(.*)$/)
        {
          $arg_types[0] = 'archive_write_disk';
          $class = 'DiskWrite';
          $name = $1;
        }

        if($name =~ /^archive_read_disk_(.*)$/)
        {
          $arg_types[0] = 'archive_read_disk';
          $class = 'DiskRead';
          $name = $1;
        }

        if($name =~ /^archive_read_(.*)$/)
        {
          $arg_types[0] = 'archive_read';
          $class = 'ArchiveRead';
          $name = $1;
        }

        if($name =~ /^archive_write_(.*)$/)
        {
          $arg_types[0] = 'archive_write';
          $class = 'ArchiveWrite';
          $name = $1;
        }

      }
    }

    if($name =~ /^(.*)_utf8$/)
    {
      $ret_type = 'string_utf8' if $ret_type eq 'string';
      $perl_name = $1;
    }

    $class //= "Unbound";

    my $incomplete = (defined $ret_type && all { defined $_ } @arg_types) ? undef : 1;
    $count{$incomplete ? 'incomplete' : 'generated'}++;

    push $bindings->{$class}->@*, {
            symbol_name => $orig,
      maybe optional    => $opt,
            name        => $name,
      maybe perl_name   => $perl_name,
            arg_types   => \@arg_types,
            ret_type    => $ret_type,
      maybe incomplete  => $incomplete,
    };
  }

  %$global = (%$global, %functions);
}

sub generate ($function, $bindings)
{
  foreach my $class (sort keys %$bindings)
  {
    my $path = path(qw( lib Archive Libarchive Lib ), do {
      my @name = split /::/, $class;
      $name[-1] .= ".pm";
      @name
    });
    $path->parent->mkpath;
    $tt->process('Code.pm.tt', {
      class => $class,
      bindings => {
        required => [grep { !$_->{optional} } $bindings->{$class}->@*],
        optional => [grep { $_->{optional} } $bindings->{$class}->@*],
      }
    }, "$path") or do {
      say "Error generating $path @{[ $tt->error ]}";
      exit 2;
    };
  }

}

foreach my $key (sort keys %count)
{
  printf "%10s | %3s\n", $key, $count{$key};
}
printf "%10s | %3s\n", 'total', sum0 values %count;
