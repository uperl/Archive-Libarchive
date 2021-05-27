package Archive::Libarchive::Lib::ArchiveWrite;

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

package Archive::Libarchive::ArchiveWrite;

use Archive::Libarchive::Lib;

my $ffi = Archive::Libarchive::Lib->ffi;

$ffi->attach( add_filter_b64encode => ['archive_write'] => 'int' );
$ffi->attach( add_filter_by_name => ['archive_write', 'string'] => 'int' );
$ffi->attach( add_filter_bzip2 => ['archive_write'] => 'int' );
$ffi->attach( add_filter_compress => ['archive_write'] => 'int' );
$ffi->attach( add_filter_grzip => ['archive_write'] => 'int' );
$ffi->attach( add_filter_gzip => ['archive_write'] => 'int' );
$ffi->attach( add_filter_lrzip => ['archive_write'] => 'int' );
$ffi->attach( add_filter_lz4 => ['archive_write'] => 'int' );
$ffi->attach( add_filter_lzip => ['archive_write'] => 'int' );
$ffi->attach( add_filter_lzma => ['archive_write'] => 'int' );
$ffi->attach( add_filter_lzop => ['archive_write'] => 'int' );
$ffi->attach( add_filter_none => ['archive_write'] => 'int' );
$ffi->attach( add_filter_program => ['archive_write', 'string'] => 'int' );
$ffi->attach( add_filter_uuencode => ['archive_write'] => 'int' );
$ffi->attach( add_filter_xz => ['archive_write'] => 'int' );
$ffi->attach( close => ['archive_write'] => 'int' );
$ffi->attach( data_block => ['archive_write', 'opaque', 'size_t', 'sint64'] => 'ssize_t' );
$ffi->attach( fail => ['archive_write'] => 'int' );
$ffi->attach( finish_entry => ['archive_write'] => 'int' );
$ffi->attach( get_bytes_in_last_block => ['archive_write'] => 'int' );
$ffi->attach( get_bytes_per_block => ['archive_write'] => 'int' );
$ffi->attach( [header => 'write_header'] => ['archive_write', 'archive_entry'] => 'int' );
$ffi->attach( open_fd => ['archive_write', 'int'] => 'int' );
$ffi->attach( open_filename => ['archive_write', 'string'] => 'int' );
$ffi->attach( open_filename_w => ['archive_write', 'wstring'] => 'int' );
$ffi->attach( set_bytes_in_last_block => ['archive_write', 'int'] => 'int' );
$ffi->attach( set_bytes_per_block => ['archive_write', 'int'] => 'int' );
$ffi->attach( set_filter_option => ['archive_write', 'string', 'string', 'string'] => 'int' );
$ffi->attach( set_format_7zip => ['archive_write'] => 'int' );
$ffi->attach( set_format_ar_bsd => ['archive_write'] => 'int' );
$ffi->attach( set_format_ar_svr4 => ['archive_write'] => 'int' );
$ffi->attach( set_format_by_name => ['archive_write', 'string'] => 'int' );
$ffi->attach( set_format_cpio => ['archive_write'] => 'int' );
$ffi->attach( set_format_cpio_newc => ['archive_write'] => 'int' );
$ffi->attach( set_format_filter_by_ext => ['archive_write', 'string'] => 'int' );
$ffi->attach( set_format_filter_by_ext_def => ['archive_write', 'string', 'string'] => 'int' );
$ffi->attach( set_format_gnutar => ['archive_write'] => 'int' );
$ffi->attach( set_format_iso9660 => ['archive_write'] => 'int' );
$ffi->attach( set_format_mtree => ['archive_write'] => 'int' );
$ffi->attach( set_format_mtree_classic => ['archive_write'] => 'int' );
$ffi->attach( set_format_option => ['archive_write', 'string', 'string', 'string'] => 'int' );
$ffi->attach( set_format_pax => ['archive_write'] => 'int' );
$ffi->attach( set_format_pax_restricted => ['archive_write'] => 'int' );
$ffi->attach( set_format_raw => ['archive_write'] => 'int' );
$ffi->attach( set_format_shar => ['archive_write'] => 'int' );
$ffi->attach( set_format_shar_dump => ['archive_write'] => 'int' );
$ffi->attach( set_format_ustar => ['archive_write'] => 'int' );
$ffi->attach( set_format_v7tar => ['archive_write'] => 'int' );
$ffi->attach( set_format_warc => ['archive_write'] => 'int' );
$ffi->attach( set_format_xar => ['archive_write'] => 'int' );
$ffi->attach( set_format_zip => ['archive_write'] => 'int' );
$ffi->attach( set_option => ['archive_write', 'string', 'string', 'string'] => 'int' );
$ffi->attach( set_options => ['archive_write', 'string'] => 'int' );
$ffi->attach( set_passphrase => ['archive_write', 'string'] => 'int' );
#$ffi->attach( set_passphrase_callback => ['archive_write', 'opaque', undef] => 'int' );
$ffi->attach( set_skip_file => ['archive_write', 'sint64', 'sint64'] => 'int' );
$ffi->attach( zip_set_compression_deflate => ['archive_write'] => 'int' );
$ffi->attach( zip_set_compression_store => ['archive_write'] => 'int' );

$ffi->ignore_not_found(1);

$ffi->attach( add_filter_zstd => ['archive_write'] => 'int' );
#$ffi->attach( open2 => ['archive_write', 'opaque', undef, undef, undef, undef] => 'int' );

$ffi->ignore_not_found(0);

1;

__END__

=head1 SEE ALSO

=over 4

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
