#!/usr/bin/env perl

use strict;
use warnings;
use LibarchiveRef;
use File::chdir;
use FFI::ExtractSymbols;
use 5.020;
use experimental qw( signatures );

my %all;

foreach my $version ('2.8.5','3.0.2',ref_config->{LATEST})
{
  local $CWD = "/opt/libarchive/$version/lib";
  my $so = "libarchive.so";
  $so = readlink $so if -l $so;
  say "libarchive $version, so=$so";

  my @symbols;
  
  extract_symbols($so,
    code => sub ($symbol, $) {
      return unless $symbol =~ /^archive_/;
      return if $all{$symbol};
      push @symbols, $symbol;
      $all{$symbol} = 1;
    },
  );

  say "  $_" for sort @symbols;
}
