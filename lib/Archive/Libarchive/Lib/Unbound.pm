package Archive::Libarchive::Lib::Unbound;

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

package Archive::Libarchive::Unbound;

use Archive::Libarchive::Lib;

my $ffi = Archive::Libarchive::Lib->ffi;

$ffi->attach( archive_clear_error => ['archive'] );
$ffi->attach( archive_compression => ['archive'] => 'int' );
$ffi->attach( archive_compression_name => ['archive'] => 'string' );
$ffi->attach( archive_copy_error => ['archive', 'archive'] );
$ffi->attach( archive_errno => ['archive'] => 'int' );
$ffi->attach( archive_error_string => ['archive'] => 'string' );
$ffi->attach( archive_file_count => ['archive'] => 'int' );
$ffi->attach( archive_filter_bytes => ['archive', 'int'] => 'sint64' );
$ffi->attach( archive_filter_code => ['archive', 'int'] => 'int' );
$ffi->attach( archive_filter_count => ['archive'] => 'int' );
$ffi->attach( archive_filter_name => ['archive', 'int'] => 'string' );
$ffi->attach( archive_format => ['archive'] => 'int' );
$ffi->attach( archive_format_name => ['archive'] => 'string' );
$ffi->attach( archive_position_compressed => ['archive'] => 'sint64' );
$ffi->attach( archive_position_uncompressed => ['archive'] => 'sint64' );
#$ffi->attach( archive_set_error => ['archive', 'int', 'string', undef] );
$ffi->attach( archive_version_number => [] => 'int' );
$ffi->attach( archive_version_string => [] => 'string' );
$ffi->attach( archive_entry_linkify => ['archive_entry_linkresolver', 'archive_entry', 'archive_entry'] );
$ffi->attach( archive_entry_partial_links => ['archive_entry_linkresolver', 'uint*'] => 'archive_entry' );

$ffi->ignore_not_found(1);

$ffi->attach( archive_bzlib_version => [] => 'string' );
$ffi->attach( archive_free => ['archive'] => 'int' );
$ffi->attach( archive_liblz4_version => [] => 'string' );
$ffi->attach( archive_liblzma_version => [] => 'string' );
$ffi->attach( archive_libzstd_version => [] => 'string' );
$ffi->attach( archive_match_exclude_entry => ['archive', 'int', 'archive_entry'] => 'int' );
$ffi->attach( archive_match_exclude_pattern => ['archive', 'string'] => 'int' );
$ffi->attach( archive_match_exclude_pattern_from_file => ['archive', 'string', 'int'] => 'int' );
$ffi->attach( archive_match_exclude_pattern_from_file_w => ['archive', 'wstring', 'int'] => 'int' );
$ffi->attach( archive_match_exclude_pattern_w => ['archive', 'wstring'] => 'int' );
$ffi->attach( archive_match_excluded => ['archive', 'archive_entry'] => 'int' );
$ffi->attach( archive_match_free => ['archive'] => 'int' );
$ffi->attach( archive_match_include_date => ['archive', 'int', 'string'] => 'int' );
$ffi->attach( archive_match_include_date_w => ['archive', 'int', 'wstring'] => 'int' );
$ffi->attach( archive_match_include_file_time => ['archive', 'int', 'string'] => 'int' );
$ffi->attach( archive_match_include_file_time_w => ['archive', 'int', 'wstring'] => 'int' );
$ffi->attach( archive_match_include_gid => ['archive', 'sint64'] => 'int' );
$ffi->attach( archive_match_include_gname => ['archive', 'string'] => 'int' );
$ffi->attach( archive_match_include_gname_w => ['archive', 'wstring'] => 'int' );
$ffi->attach( archive_match_include_pattern => ['archive', 'string'] => 'int' );
$ffi->attach( archive_match_include_pattern_from_file => ['archive', 'string', 'int'] => 'int' );
$ffi->attach( archive_match_include_pattern_from_file_w => ['archive', 'wstring', 'int'] => 'int' );
$ffi->attach( archive_match_include_pattern_w => ['archive', 'wstring'] => 'int' );
$ffi->attach( archive_match_include_time => ['archive', 'int', 'time_t', 'long'] => 'int' );
$ffi->attach( archive_match_include_uid => ['archive', 'sint64'] => 'int' );
$ffi->attach( archive_match_include_uname => ['archive', 'string'] => 'int' );
$ffi->attach( archive_match_include_uname_w => ['archive', 'wstring'] => 'int' );
$ffi->attach( archive_match_new => [] => 'archive' );
$ffi->attach( archive_match_owner_excluded => ['archive', 'archive_entry'] => 'int' );
$ffi->attach( archive_match_path_excluded => ['archive', 'archive_entry'] => 'int' );
$ffi->attach( archive_match_path_unmatched_inclusions => ['archive'] => 'int' );
$ffi->attach( archive_match_path_unmatched_inclusions_next => ['archive', 'string*'] => 'int' );
#$ffi->attach( archive_match_path_unmatched_inclusions_next_w => ['archive', undef] => 'int' );
$ffi->attach( archive_match_set_inclusion_recursion => ['archive', 'int'] => 'int' );
$ffi->attach( archive_match_time_excluded => ['archive', 'archive_entry'] => 'int' );
$ffi->attach( archive_seek_data => ['archive', 'sint64', 'int'] => 'sint64' );
$ffi->attach( archive_utility_string_sort => ['string*'] => 'int' );
$ffi->attach( archive_version_details => [] => 'string' );
$ffi->attach( archive_zlib_version => [] => 'string' );

$ffi->ignore_not_found(0);

1;
