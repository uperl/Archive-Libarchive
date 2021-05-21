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

our @EXPORT = qw( la_ok );

my %code;

foreach my $name (qw( EOF OK RETRY WARN FAILED FATAL ))
{
  my $code = Archive::Libarchive->can("ARCHIVE_$name");
  $code{lc $name} = $code->();
}

sub la_ok ($archive, $method, $arguments=[], $test_name=undef)
{
  $test_name //= do {
    my $name = "\$archive->$method";
    $name .= "(@$arguments)" if @$arguments;
    $name .= " == ARCHIVE_OK";
    $name;
  };

  my $context = context();
  my $ret = is(
    $archive,
    object {
      call([ isa => 'Archive::Libarchive::Archive' ] => T());
      if(@$arguments)
      {
        call([ $method => @$arguments ] => $code{ok});
      }
      else
      {
        call($method => $code{ok});
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

  $context->release;

  return $ret;
}

1;
