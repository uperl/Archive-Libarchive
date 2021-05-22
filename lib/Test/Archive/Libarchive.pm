package Test::Archive::Libarchive;

use strict;
use warnings;
use 5.020;
use Test2::Tools::Basic qw( diag );
use Test2::Tools::Compare qw( is object call T );
use Test2::API qw( context );
use experimental qw( signatures );
use Archive::Libarchive::Lib::Constants;
use parent qw( Exporter );

# ABSTRACT: Testing tools for Archive::Libarchive
# VERSION

our @EXPORT = qw( la_ok la_eof la_warn la_failed la_fatal );

my %code;

foreach my $name (qw( EOF OK RETRY WARN FAILED FATAL ))
{
  my $code = Archive::Libarchive->can("ARCHIVE_$name");
  $code{lc $name} = $code->();
}

sub _ok
{
  my($code, $archive, $method, $arguments, $test_name) = @_;

  $test_name //= do {
    my $name = "\$archive->$method";
    if(@$arguments)
    {
      my $first = 1;
      $name .= '(';
      foreach my $arg (@$arguments)
      {
        $name .= ", " unless $first;
        $first = 0;

        my $ref = ref $arg;
        if($ref eq '')
        {
          if(length $arg > 34)
          {
            $name .= "'@{[ substr($arg, 0, 30) =~ s/\n/\\n/rg ]}...'";
          }
          else
          {
            $name .= "'@{[ $arg =~ s/\n/\\n/rg ]}'";
          }
        }
        elsif($ref eq 'HASH')
        {
          $name .= "{...}";
        }
        elsif($ref eq 'ARRAY')
        {
          $name .= "[...]";
        }
        elsif($ref eq 'CODE')
        {
          $name .= "sub {...}";
        }
      }
      $name .= ')';
    }
    $name .= " == ARCHIVE_@{[ uc $code ]}";
    $name;
  };

  my $ret = is(
    $archive,
    object {
      call([ isa => 'Archive::Libarchive::Archive' ] => T());
      if(@$arguments)
      {
        call([ $method => @$arguments ] => $code{$code});
      }
      else
      {
        call($method => $code{$code});
      }
    },
    $test_name,
  );

  unless($ret)
  {
    if(defined $archive)
    {
      if($archive->can('errno'))
      {
        diag("error: @{[ $archive->errno ]}");
      }
      if($archive->can('error_string'))
      {
        diag("error: @{[ $archive->error_string ]}");
      }
    }
    else
    {
      diag("archive is not defined");
    }
  }

  return $ret;
}

=head1 FUNCTIONS

=head2 la_ok

 la_ok $a, $method;
 la_ok $a, $method, \@arguments;
 la_ok $a, $method, \@arguments, $test_name;

Tests that calling the method C<$method> on the archive object C<$a> returns ARCHIVE_OK.

=head2 la_warn

 la_eof $a, $method;
 la_eof $a, $method, \@arguments;
 la_eof $a, $method, \@arguments, $test_name;

Tests that calling the method C<$method> on the archive object C<$a> returns ARCHIVE_WARN.

=head2 la_eof

 la_eof $a, $method;
 la_eof $a, $method, \@arguments;
 la_eof $a, $method, \@arguments, $test_name;

Tests that calling the method C<$method> on the archive object C<$a> returns ARCHIVE_EOF.

=cut

foreach my $code (qw( ok eof retry warn failed fatal )) {

  my $sub = sub ($archive, $method, $arguments=[], $test_name=undef)
  {
    my $ctx = context();
    my $ret = _ok($code, $archive, $method, $arguments, $test_name=undef);
    $ctx->release;
    return $ret;
  };

  no strict 'refs';
  *{"la_$code"} = $sub;
}

1;
