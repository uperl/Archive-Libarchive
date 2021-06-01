package Archive::Libarchive::Lib::ArchiveRead;

use strict;
use warnings;
use 5.020;

# ABSTRACT: Private class for Arcive::Libarchive
# VERSION

# NOTE: This document is autogenerated from the template
# maint/tt/Code.pm.tt
# Please see maint/README.md for details on updating.

=head1 SYNOPSIS

 % perldoc Archive::Libarchive

=head1 DESCRIPTION

This is a private class for L<Archive::Libarchive> see the main documentation for the public interface.

=cut

package
  Archive::Libarchive::ArchiveRead;

use Archive::Libarchive::Lib;

my $ffi = Archive::Libarchive::Lib->ffi;

$ffi->attach( add_passphrase => ['archive_read', 'string'] => 'int' );
$ffi->attach( append_filter_program => ['archive_read', 'string'] => 'int' );
$ffi->attach( append_filter_program_signature => ['archive_read', 'string', 'opaque', 'size_t'] => 'int' );
$ffi->attach( close => ['archive_read'] => 'int' );
$ffi->attach( [data_into_fd => 'read_data_into_fd'] => ['archive_read', 'int'] => 'int' );
$ffi->attach( [data_skip => 'read_data_skip'] => ['archive_read'] => 'int' );
$ffi->attach( extract => ['archive_read', 'archive_entry', 'int'] => 'int' );
$ffi->attach( extract2 => ['archive_read', 'archive_entry', 'archive'] => 'int' );
#$ffi->attach( extract_set_progress_callback => ['archive_read', undef, 'opaque'] );
$ffi->attach( extract_set_skip_file => ['archive_read', 'sint64', 'sint64'] );
$ffi->attach( format_capabilities => ['archive_read'] => 'int' );
$ffi->attach( has_encrypted_entries => ['archive_read'] => 'int' );
$ffi->attach( header_position => ['archive_read'] => 'sint64' );
$ffi->attach( open_fd => ['archive_read', 'int', 'size_t'] => 'int' );
$ffi->attach( open_filename => ['archive_read', 'string', 'size_t'] => 'int' );
$ffi->attach( open_filename_w => ['archive_read', 'wstring', 'size_t'] => 'int' );
$ffi->attach( set_filter_option => ['archive_read', 'string', 'string', 'string'] => 'int' );
$ffi->attach( set_format_option => ['archive_read', 'string', 'string', 'string'] => 'int' );
$ffi->attach( set_option => ['archive_read', 'string', 'string', 'string'] => 'int' );
$ffi->attach( set_options => ['archive_read', 'string'] => 'int' );
#$ffi->attach( set_switch_callback => ['archive_read', undef] => 'int' );
$ffi->attach( support_filter_all => ['archive_read'] => 'int' );
$ffi->attach( support_filter_bzip2 => ['archive_read'] => 'int' );
$ffi->attach( support_filter_compress => ['archive_read'] => 'int' );
$ffi->attach( support_filter_grzip => ['archive_read'] => 'int' );
$ffi->attach( support_filter_gzip => ['archive_read'] => 'int' );
$ffi->attach( support_filter_lrzip => ['archive_read'] => 'int' );
$ffi->attach( support_filter_lz4 => ['archive_read'] => 'int' );
$ffi->attach( support_filter_lzip => ['archive_read'] => 'int' );
$ffi->attach( support_filter_lzma => ['archive_read'] => 'int' );
$ffi->attach( support_filter_lzop => ['archive_read'] => 'int' );
$ffi->attach( support_filter_none => ['archive_read'] => 'int' );
$ffi->attach( support_filter_program => ['archive_read', 'string'] => 'int' );
$ffi->attach( support_filter_program_signature => ['archive_read', 'string', 'opaque', 'size_t'] => 'int' );
$ffi->attach( support_filter_rpm => ['archive_read'] => 'int' );
$ffi->attach( support_filter_uu => ['archive_read'] => 'int' );
$ffi->attach( support_filter_xz => ['archive_read'] => 'int' );
$ffi->attach( support_format_7zip => ['archive_read'] => 'int' );
$ffi->attach( support_format_all => ['archive_read'] => 'int' );
$ffi->attach( support_format_ar => ['archive_read'] => 'int' );
$ffi->attach( support_format_by_code => ['archive_read', 'int'] => 'int' );
$ffi->attach( support_format_cab => ['archive_read'] => 'int' );
$ffi->attach( support_format_cpio => ['archive_read'] => 'int' );
$ffi->attach( support_format_empty => ['archive_read'] => 'int' );
$ffi->attach( support_format_gnutar => ['archive_read'] => 'int' );
$ffi->attach( support_format_iso9660 => ['archive_read'] => 'int' );
$ffi->attach( support_format_lha => ['archive_read'] => 'int' );
$ffi->attach( support_format_mtree => ['archive_read'] => 'int' );
$ffi->attach( support_format_rar => ['archive_read'] => 'int' );
$ffi->attach( support_format_raw => ['archive_read'] => 'int' );
$ffi->attach( support_format_tar => ['archive_read'] => 'int' );
$ffi->attach( support_format_warc => ['archive_read'] => 'int' );
$ffi->attach( support_format_xar => ['archive_read'] => 'int' );
$ffi->attach( support_format_zip => ['archive_read'] => 'int' );
$ffi->attach( support_format_zip_seekable => ['archive_read'] => 'int' );
$ffi->attach( support_format_zip_streamable => ['archive_read'] => 'int' );

$ffi->ignore_not_found(1);

$ffi->attach( support_filter_by_code => ['archive_read', 'int'] => 'int' );
$ffi->attach( support_filter_zstd => ['archive_read'] => 'int' );
$ffi->attach( support_format_rar5 => ['archive_read'] => 'int' );

$ffi->ignore_not_found(0);

1;

__END__

=head1 SEE ALSO

=over 4

=item L<Archive::Libarchive::Peek>

Provides an interface for listing and retrieving entries from an archive without extracting them to the local filesystem.

=item L<Archive::Libarchive::Extract>

Provides an interface for extracting arbitrary archives of any format/filter supported by C<libarchive>.

=item L<Archive::Libarchive::Unwrap>

Decompresses / unwraps files that have been compressed or wrapped in any of the filter formats supported by C<libarchive>

=item L<Archive::Libarchive>

This is the main top-level module for using C<libarchive> from
Perl.  It is the best place to start reading the documentation.
It pulls in the other classes and C<libarchive> constants so
that you only need one C<use> statement to effectively use
C<libarchive>.

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
