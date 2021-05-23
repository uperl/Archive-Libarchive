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

=head1 SYNOPSIS

 use Test2::V0;
 use Archive::Libarchive;
 use Test::Archive::Libarchive;
 use Path::Tiny qw( path );

 my $w = Archive::Libarchive->new;
 la_ok $w, 'add_filter_gzip';
 la_ok $w, 'set_format_pax_restricted';
 la_ok $w, 'open_filename' => ['foo.tar.gz'];

 my $e = Archive::Libarchive::Entry->new;
 $e->set_pathname(__FILE__);
 $e->set_size(-s __FILE__);
 $e->set_filetype(oct('0644'));

 la_ok $w, 'write_header' => [$e];
 is($w->write_data(path(__FILE__)->slurp_raw), -s __FILE__);

 la_ok $w, 'close';

 done_testing;

=head1 DESCRIPTION

Error handling for C<libarchive> and L<Archive::Libarchive> is fairly
primitive.  Most methods return an C<int> which correspond to
C<ARCHIVE_EOF>, C<ARCHIVE_OK>, C<ARCHIVE_RETRY>, C<ARCHIVE_WARN>,
C<ARCHIVE_FAILED> or C<ARCHIVE_FATAL>.  Some methods will also
return the number of actual bytes written on success and one of
these codes on failure.  It can be tedious doing the necessary
checks for each method call in a test, so this module provides tools
for testing L<Archive::Libarchive> method calls that follow this
pattern.

=cut

our @EXPORT = qw( la_ok la_eof la_warn la_failed la_fatal );

my %code = (
  eof    =>   1,
  ok     =>   0,
  retry  => -10,
  warn   => -20,
  failed => -25,
  fatal  => -30,
);

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
This indicates a successful method call.

=head2 la_eof

 la_eof $a, $method;
 la_eof $a, $method, \@arguments;
 la_eof $a, $method, \@arguments, $test_name;

Tests that calling the method C<$method> on the archive object C<$a> returns ARCHIVE_EOF.
This is for when you reach the end of the archive or a file.

=head2 la_warn

 la_warn $a, $method;
 la_warn $a, $method, \@arguments;
 la_warn $a, $method, \@arguments, $test_name;

Tests that calling the method C<$method> on the archive object C<$a> returns ARCHIVE_WARN.
This indicates a possible problem, but things are still working.

=head2 la_retry

 la_retry $a, $method;
 la_retry $a, $method, \@arguments;
 la_retry $a, $method, \@arguments, $test_name;

Tests that calling the method C<$method> on the archive object C<$a> returns ARCHIVE_RETRY.
This indicates that a retry might succeed.

=head2 la_failed

 la_failed $a, $method;
 la_failed $a, $method, \@arguments;
 la_failed $a, $method, \@arguments, $test_name;

Tests that calling the method C<$method> on the archive object C<$a> returns ARCHIVE_RETRY.
Operation failed.

=head2 la_fatal

 la_failed $a, $method;
 la_failed $a, $method, \@arguments;
 la_failed $a, $method, \@arguments, $test_name;

Tests that calling the method C<$method> on the archive object C<$a> returns ARCHIVE_RETRY.
Operation failed so badly that the archive object is no longer usable.

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

=head1 CAVEATS

Not all methods in L<Archive::Libarchive> return a result code like this.  Some
like C<write_data> return the number of bytes on success.

=head1 SEE ALSO

=over 4

=item L<Archive::Libarchive>

=back

=cut
