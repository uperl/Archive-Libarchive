package Archive::Libarchive::Lib::ArchiveRead;

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

package Archive::Libarchive::ArchiveRead;

use Archive::Libarchive::Lib;

my $ffi = Archive::Libarchive::Lib->ffi;

$ffi->attach( close => ['archive_read'] => 'int' );
$ffi->attach( data => ['archive_read', 'opaque', 'size_t'] => 'ssize_t' );
#$ffi->attach( data_block => ['archive_read', undef, 'size_t*', 'sint64*'] => 'int' );
$ffi->attach( data_into_fd => ['archive_read', 'int'] => 'int' );
$ffi->attach( data_skip => ['archive_read'] => 'int' );
$ffi->attach( extract => ['archive_read', 'archive_entry', 'int'] => 'int' );
$ffi->attach( extract2 => ['archive_read', 'archive_entry', 'archive'] => 'int' );
#$ffi->attach( extract_set_progress_callback => ['archive_read', undef, 'opaque'] );
$ffi->attach( extract_set_skip_file => ['archive_read', 'sint64', 'sint64'] );
$ffi->attach( finish => ['archive_read'] => 'int' );
$ffi->attach( header_position => ['archive_read'] => 'sint64' );
#$ffi->attach( open => ['archive_read', 'opaque', undef, undef, undef] => 'int' );
$ffi->attach( open1 => ['archive_read'] => 'int' );
#$ffi->attach( open2 => ['archive_read', 'opaque', undef, undef, undef, undef] => 'int' );
#$ffi->attach( open_FILE => ['archive_read', undef] => 'int' );
$ffi->attach( open_fd => ['archive_read', 'int', 'size_t'] => 'int' );
$ffi->attach( open_file => ['archive_read', 'string', 'size_t'] => 'int' );
$ffi->attach( open_filename => ['archive_read', 'string', 'size_t'] => 'int' );
$ffi->attach( open_filename_w => ['archive_read', 'wstring', 'size_t'] => 'int' );
$ffi->attach( open_memory => ['archive_read', 'opaque', 'size_t'] => 'int' );
$ffi->attach( open_memory2 => ['archive_read', 'opaque', 'size_t', 'size_t'] => 'int' );
$ffi->attach( set_callback_data => ['archive_read', 'opaque'] => 'int' );
#$ffi->attach( set_close_callback => ['archive_read', undef] => 'int' );
$ffi->attach( set_filter_option => ['archive_read', 'string', 'string', 'string'] => 'int' );
$ffi->attach( set_format_option => ['archive_read', 'string', 'string', 'string'] => 'int' );
#$ffi->attach( set_open_callback => ['archive_read', undef] => 'int' );
$ffi->attach( set_option => ['archive_read', 'string', 'string', 'string'] => 'int' );
$ffi->attach( set_options => ['archive_read', 'string'] => 'int' );
#$ffi->attach( set_read_callback => ['archive_read', undef] => 'int' );
#$ffi->attach( set_seek_callback => ['archive_read', undef] => 'int' );
#$ffi->attach( set_skip_callback => ['archive_read', undef] => 'int' );
$ffi->attach( support_compression_all => ['archive_read'] => 'int' );
$ffi->attach( support_compression_bzip2 => ['archive_read'] => 'int' );
$ffi->attach( support_compression_compress => ['archive_read'] => 'int' );
$ffi->attach( support_compression_gzip => ['archive_read'] => 'int' );
$ffi->attach( support_compression_lzip => ['archive_read'] => 'int' );
$ffi->attach( support_compression_lzma => ['archive_read'] => 'int' );
$ffi->attach( support_compression_none => ['archive_read'] => 'int' );
$ffi->attach( support_compression_program => ['archive_read', 'string'] => 'int' );
$ffi->attach( support_compression_program_signature => ['archive_read', 'string', 'opaque', 'size_t'] => 'int' );
$ffi->attach( support_compression_rpm => ['archive_read'] => 'int' );
$ffi->attach( support_compression_uu => ['archive_read'] => 'int' );
$ffi->attach( support_compression_xz => ['archive_read'] => 'int' );
$ffi->attach( support_filter_all => ['archive_read'] => 'int' );
$ffi->attach( support_filter_bzip2 => ['archive_read'] => 'int' );
$ffi->attach( support_filter_compress => ['archive_read'] => 'int' );
$ffi->attach( support_filter_gzip => ['archive_read'] => 'int' );
$ffi->attach( support_filter_lzip => ['archive_read'] => 'int' );
$ffi->attach( support_filter_lzma => ['archive_read'] => 'int' );
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
$ffi->attach( support_format_xar => ['archive_read'] => 'int' );
$ffi->attach( support_format_zip => ['archive_read'] => 'int' );
$ffi->attach( support_format_zip_seekable => ['archive_read'] => 'int' );
$ffi->attach( support_format_zip_streamable => ['archive_read'] => 'int' );

$ffi->ignore_not_found(1);

$ffi->attach( add_callback_data => ['archive_read', 'opaque', 'uint'] => 'int' );
$ffi->attach( add_passphrase => ['archive_read', 'string'] => 'int' );
$ffi->attach( append_callback_data => ['archive_read', 'opaque'] => 'int' );
$ffi->attach( append_filter => ['archive_read', 'int'] => 'int' );
$ffi->attach( append_filter_program => ['archive_read', 'string'] => 'int' );
$ffi->attach( append_filter_program_signature => ['archive_read', 'string', 'opaque', 'size_t'] => 'int' );
$ffi->attach( format_capabilities => ['archive_read'] => 'int' );
$ffi->attach( has_encrypted_entries => ['archive_read'] => 'int' );
$ffi->attach( open_filenames => ['archive_read', 'string*', 'size_t'] => 'int' );
$ffi->attach( prepend_callback_data => ['archive_read', 'opaque'] => 'int' );
$ffi->attach( set_callback_data2 => ['archive_read', 'opaque', 'uint'] => 'int' );
$ffi->attach( set_format => ['archive_read', 'int'] => 'int' );
#$ffi->attach( set_passphrase_callback => ['archive_read', 'opaque', undef] => 'int' );
#$ffi->attach( set_switch_callback => ['archive_read', undef] => 'int' );
$ffi->attach( support_filter_by_code => ['archive_read', 'int'] => 'int' );
$ffi->attach( support_filter_grzip => ['archive_read'] => 'int' );
$ffi->attach( support_filter_lrzip => ['archive_read'] => 'int' );
$ffi->attach( support_filter_lz4 => ['archive_read'] => 'int' );
$ffi->attach( support_filter_lzop => ['archive_read'] => 'int' );
$ffi->attach( support_filter_zstd => ['archive_read'] => 'int' );
$ffi->attach( support_format_rar5 => ['archive_read'] => 'int' );
$ffi->attach( support_format_warc => ['archive_read'] => 'int' );

$ffi->ignore_not_found(0);

1;
