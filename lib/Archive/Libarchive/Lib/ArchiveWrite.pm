package Archive::Libarchive::Lib::ArchiveWrite;

use strict;
use warnings;
use 5.020;

# ABSTRACT: Private class for Arcive::Libarchive
# VERSION

=head1 SYNOPSIS

 % perldoc Archive::Libarchive

=head1 DESCRIPTION

This is a private class for L<Archive::Libarchive> see the main documentation for the public interface.

=head1 SEE ALSO

=over 4

=item L<Archive::Libarchive>

=back

=cut

package Archive::Libarchive::ArchiveWrite;

use Archive::Libarchive::Lib;

my $ffi = Archive::Libarchive::Lib->ffi;

$ffi->attach( add_filter => ['archive_write', 'int'] => 'int' );
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
$ffi->attach( header => ['archive_write', 'archive_entry'] => 'int' );
$ffi->attach( open_fd => ['archive_write', 'int'] => 'int' );
$ffi->attach( open_filename => ['archive_write', 'string'] => 'int' );
$ffi->attach( open_filename_w => ['archive_write', 'wstring'] => 'int' );
$ffi->attach( set_bytes_in_last_block => ['archive_write', 'int'] => 'int' );
$ffi->attach( set_bytes_per_block => ['archive_write', 'int'] => 'int' );
$ffi->attach( set_filter_option => ['archive_write', 'string', 'string', 'string'] => 'int' );
$ffi->attach( set_format => ['archive_write', 'int'] => 'int' );
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
