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

our @EXPORT = qw( la_ok la_eof );

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
    $name .= "(@$arguments)" if @$arguments;
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
    if($archive->can('errno'))
    {
      diag("error: @{[ $archive->errno ]}");
    }
    if($archive->can('error_string'))
    {
      diag("error: @{[ $archive->error_string ]}");
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

=cut

sub la_ok ($archive, $method, $arguments=[], $test_name=undef)
{
  my $ctx = context();
  my $ret = _ok('ok', $archive, $method, $arguments, $test_name=undef);
  $ctx->release;
  return $ret;
}

=head2 la_eof

 la_eof $a, $method;
 la_eof $a, $method, \@arguments;
 la_eof $a, $method, \@arguments, $test_name;

Tests that calling the method C<$method> on the archive object C<$a> returns ARCHIVE_EOF.

=cut

sub la_eof ($archive, $method, $arguments=[], $test_name=undef)
{
  my $ctx = context();
  my $ret = _ok('eof', $archive, $method, $arguments, $test_name=undef);
  $ctx->release;
  return $ret;
}

1;
