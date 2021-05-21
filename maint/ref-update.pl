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
use 5.020;
use experimental qw( signatures );

my %optional;
my %manual;
my $ffi;
my $archive_h;
my $entry_h;
my $const;

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
    $ffi = FFI::Platypus->new( apu => 1 );
    $ffi->lib(path($CWD)->child($so)->stringify);
    
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
    $const = Const::Introspect::C->new(
      headers => ['archive.h'],
    );
  }

  {
    my $original = \&FFI::Platypus::DL::dlsym;
    no warnings 'redefine';
    local *FFI::Platypus::DL::dlsym = sub ($handle, $symbol) {
      $manual{$symbol} = 1;
      return $original->($handle, $symbol);
    };
    require Archive::Libarchive;
  }
}

#process_functions($archive_h);
process_functions($entry_h);

sub process_functions ($href)
{
  my %id;

  foreach my $item ($href->{inner}->@*)
  {
    $id{$item->{id}} = $item if exists $item->{id} && defined $item->{id};
  }

  my %function;

  foreach my $function (grep { $_->{_class} eq 'Function' && $_->{name} =~ /^archive_/ } $href->{inner}->@*)
  {
    $function{$function->{name}} = $function;
  }

  delete $function->{$_} keys %manual;

  say $_ for sort keys %function;
}
