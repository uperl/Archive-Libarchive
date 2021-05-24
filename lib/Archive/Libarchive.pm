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

# EXAMPLE: examples/synopsis/synopsis.pl

=head1 DESCRIPTION

This module provides a Perl object-oriented interface to the C<libarchive> library.  The C<libarchive>
library is the API used to implemnt C<bsdtar>, the default tar implementation on a number of operating systems,
including FreeBSD, macOS and Windows.  It can also be installed on most Linux distributions.  But wait, there
is more, C<libarchive> supports a number of formats, compressors and filters transparently, so it can be a useful
when used as a universal archiver/extractor.  Supported formats include:

=over 4

=item various tar formats, including the oldest forms and the newest extensions

=item zip

=item ISO 9660 (CD-ROM image format)

=item gzip

=item bzip2

=item uuencoded files

=item shell archive (shar)

=item ... and many many more

=back

This distribution is split up into several classes, that correspond to C<libarchive> classes.  Probably the best
place to start when learning how to use this module is to look at the C</EXAMPLES> section below, but you
can also take a look at the main class documentation for the operation that you are interested in as well:

=over 4

=item L<Archive|Archive::Libarchive::Archive> =E<gt> L<Archive::Libarchive::ArchiveRead>

Class for reading from archives.

=item L<Archive|Archive::Libarchive::Archive> =E<gt> L<Archive::Libarchive::ArchiveWrite>

Class for creating new archives.

=item L<Archive|Archive::Libarchive::Archive> =E<gt> L<ArchiveRead|Archive::Libarchive::ArchiveRead> =E<gt> L<Archive::Libarchive::DiskRead>

Class for reading file entries from a local filesystem.

=item L<Archive|Archive::Libarchive::Archive> =E<gt> L<ArchiveWrite|Archive::Libarchive::ArchiveWrite> =E<gt> L<Archive::Libarchive::DiskWrite>

Class for writing file entries to a local filesystem.

=item L<Archive::Libarchive::Entry>

Class representing file meta data of a file inside an archive, or in the local filesystem.

=item L<Archive::Libarchive::EntryLinkResolver>

This is the C<libarchive> link resolver API.

=item L<Archive|Archive::Libarchive::Archive> =E<gt>  L<Archive::Libarchive::Match>

This is the C<libarchive> match API.

=back

This module attempts to provide comprehensive bindings to the C<libarchive> library.  For more details on
the history and alternatives to this project see the L</HISTORY> section below.  All recent versions of
C<libarchive> should be supported, although some methods are only available when you have the most recent
version of C<libarchive> installed.  For methods not available on older versions please consult
L<Archive::Libarchive::API>, which will list these methods as C<(optional)>.  If you need to support both
older versions of C<libarchive> and exploit the newer methods on newer versions of C<libarchive> you can use
the C<can> method to check if they are available.  If you need the latest version of C<libarchive>, and
your system provides an older version, then you can force a C<share> install of L<Alien::Libarchive3>:

 env ALIEN_INSTALL_TYPE=share cpanm Alien::Libarchive3

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

# EXAMPLE: examples/custom.pl

=head2 A universal decompressor / defilter-er

# EXAMPLE: examples/defilter.pl

=head2 A basic write example

# EXAMPLE: examples/write.pl

=head2 Constructing objects on disk

# EXAMPLE: examples/disk.pl

=head2 A complete extractor

# EXAMPLE: examples/extract.pl

=head1 CONSTANTS

This module provides all of the constants used by C<libarchive>.  These typically
are prefixed either C<ARCHIVE_> or C<AE_> and can be imported into your code
individually, or I<en masse> using the C<:const> export tag.  The will also be imported
if you use the C<:all> export tag to import everything.]

The complete list of available constants is listed in
L<Archive::Libarchive::API>.

The most common constants are the return of status codes from most functions:

=over 4

=item C<ARCHIVE_EOF>

is returned only from
L<read_data|Archive::Libarchive::ArchiveRead/read_data> and
L<read_data_block|Archive::Libarchive::ArchiveRead/read_data_block> from the
L<Archive::Libarchive::ArchiveRead> class when you reach the end of a structure.

=item C<ARCHIVE_OK>

The operation completed successfully.

=item C<ARCHIVE_WARN>

If the operation completed with some surprises. You may want to report the issue to your user.
The L<error_string|Archive::Libarchive::Archive/error_string> method on most classes will return
a suitable text message; the
L<errno|Archive::Libarchive::Archive/errno> method on most classes returns an associated system
C<errno> value. (Since not all errors are caused by failing system calls, this is not always
meaningful).

=item C<ARCHIVE_FAILED>

If this operation failed. In particular, this means that further operations on this entry are
impossible. This is returned, for example, if you try to write an entry type that's not supported
by this archive format. Recovery usually consists of simply going on to the next entry.

=item C<ARCHIVE_FATAL>

If the archive object itself is no longer usable, typically because of an I/O failure or memory
allocation failure.

=back

=head1 HISTORY

TODO

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

=item L<Alien::Libarchive3>

If a suitable system C<libarchive> can't be found, then this
L<Alien> will be installed to provide it.

=item L<libarchive.org|http://libarchive.org/>

The C<libarchive> project home page.

=item L<https://github.com/libarchive/libarchive/wiki>

The C<libarchive> project wiki.

=item L<https://github.com/libarchive/libarchive/wiki/ManualPages>

Some of the C<libarchive> man pages are listed here.

=back

=cut
