package Archive::Libarchive;

use strict;
use warnings;
use 5.020;
use experimental qw( signatures );
use Archive::Libarchive::ArchiveRead;
use Archive::Libarchive::ArchiveWrite;
use Archive::Libarchive::Match;
use Archive::Libarchive::DiskRead;
use Archive::Libarchive::DiskWrite;
use Archive::Libarchive::Entry;
use Archive::Libarchive::EntryLinkResolver;
use parent qw( Exporter );

# ABSTRACT: Modern Perl bindings to libarchive
# VERSION

require Archive::Libarchive::Lib::Constants unless $Archive::Libarchive::no_gen;

our @EXPORT_OK = grep /^ARCHIVE_/, keys %Archive::Libarchive::;
our %EXPORT_TAGS = (
  all => \@EXPORT_OK,
  const => \@EXPORT_OK,
);

1;
