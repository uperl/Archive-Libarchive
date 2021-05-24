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

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 CONSTANTS

=head1 EXAMPLES

These examples are translated from the C<libarchive> C examples, which can be found here:

=over 4

=item L<https://github.com/libarchive/libarchive/wiki/Examples#List_contents_of_Archive_stored_in_File>

=back

=head2 List contents of archive stored in file

# EXAMPLE: examples/list.pl

=head2 List contents of archive stored in memory

# EXAMPLE: examples/list_memory.pl

=head2 List contents of archive with custom read functions

 # TODO

=head2 A universal decompressor / defilter-er

# EXAMPLE: examples/defilter.pl

=head2 A basic write example

# EXAMPLE: examples/write.pl

=head2 Constructing objects on disk

# EXAMPLE: examples/disk.pl

=head2 A complete extractor

# EXAMPLE: examples/extract.pl

=cut

require Archive::Libarchive::Lib::Constants unless $Archive::Libarchive::no_gen;

use constant {
  AE_IFMT   => oct('170000'),
  AE_IFREG  => oct('100000'),
  AE_IFLNK  => oct('120000'),
  AE_IFSOCK => oct('140000'),
  AE_IFCHR  => oct('020000'),
  AE_IFBLK  => oct('060000'),
  AE_IFDIR  => oct('040000'),
  AE_IFIFO  => oct('010000'),
};

our @EXPORT_OK = grep /^(ARCHIVE|AE)_/, keys %Archive::Libarchive::;
our %EXPORT_TAGS = (
  all => \@EXPORT_OK,
  const => \@EXPORT_OK,
);

1;

__END__

=head1 SEE ALSO

=over 4

=item L<Archive::Libarchive::API>

This contains the full and complete API for all of the L<Archive::Libarchive>
classes.  Because C<libarchive> has hundreds of methods, the main documentation
pages elsewhere only contain enough to be useful, and not to overwhelm.

=item L<Archive::Libarchive::Archive>

The base class of all archive classes.  This includes some common error
reporting functionality among other things.

=item L<Archive::Libarchive::ArchiveRead>

This class is used for reading from archives.

=item L<Archive::Libarchive::ArchiveWrite>

This class is for creating new archives.

=item L<Archive::Libarchive::DiskRead>

This class is for reading L<Archive::Libarchive::Entry> objects from disk
so that they can be written to L<Archive::Libarchive::ArchiveWrite> objects.

=item L<Archive::Libarchive::DiskWrite>

This class is for writing L<Archive::Libarchive::Entry> objects to disk
that have been written from L<Archive::Libarchive::ArchiveRead> objects.

=item L<Archive::Libarchive::Entry>

This class represents a file in an archive, or on disk.

=item L<Archive::Libarchive::EntryLinkResolver>

This class exposes the C<libarchive> link resolver API.

=item L<Archive::Libarchive::Match>

This class exposes the C<libarchive> match API.

=back

=cut
