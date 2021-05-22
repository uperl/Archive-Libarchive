package Archive::Libarchive::Lib::Match;

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

package Archive::Libarchive::Match;

use Archive::Libarchive::Lib;

my $ffi = Archive::Libarchive::Lib->ffi;

$ffi->attach( exclude_entry => ['archive_match', 'int', 'archive_entry'] => 'int' );
$ffi->attach( exclude_pattern => ['archive_match', 'string'] => 'int' );
$ffi->attach( exclude_pattern_from_file => ['archive_match', 'string', 'int'] => 'int' );
$ffi->attach( exclude_pattern_from_file_w => ['archive_match', 'wstring', 'int'] => 'int' );
$ffi->attach( exclude_pattern_w => ['archive_match', 'wstring'] => 'int' );
$ffi->attach( excluded => ['archive_match', 'archive_entry'] => 'int' );
$ffi->attach( include_date => ['archive_match', 'int', 'string'] => 'int' );
$ffi->attach( include_date_w => ['archive_match', 'int', 'wstring'] => 'int' );
$ffi->attach( include_file_time => ['archive_match', 'int', 'string'] => 'int' );
$ffi->attach( include_file_time_w => ['archive_match', 'int', 'wstring'] => 'int' );
$ffi->attach( include_gid => ['archive_match', 'sint64'] => 'int' );
$ffi->attach( include_gname => ['archive_match', 'string'] => 'int' );
$ffi->attach( include_gname_w => ['archive_match', 'wstring'] => 'int' );
$ffi->attach( include_pattern => ['archive_match', 'string'] => 'int' );
$ffi->attach( include_pattern_from_file => ['archive_match', 'string', 'int'] => 'int' );
$ffi->attach( include_pattern_from_file_w => ['archive_match', 'wstring', 'int'] => 'int' );
$ffi->attach( include_pattern_w => ['archive_match', 'wstring'] => 'int' );
$ffi->attach( include_time => ['archive_match', 'int', 'time_t', 'long'] => 'int' );
$ffi->attach( include_uid => ['archive_match', 'sint64'] => 'int' );
$ffi->attach( include_uname => ['archive_match', 'string'] => 'int' );
$ffi->attach( include_uname_w => ['archive_match', 'wstring'] => 'int' );
$ffi->attach( owner_excluded => ['archive_match', 'archive_entry'] => 'int' );
$ffi->attach( path_excluded => ['archive_match', 'archive_entry'] => 'int' );
$ffi->attach( path_unmatched_inclusions => ['archive_match'] => 'int' );
$ffi->attach( path_unmatched_inclusions_next => ['archive_match', 'string*'] => 'int' );
#$ffi->attach( path_unmatched_inclusions_next_w => ['archive_match', undef] => 'int' );
$ffi->attach( time_excluded => ['archive_match', 'archive_entry'] => 'int' );

$ffi->ignore_not_found(1);

$ffi->attach( set_inclusion_recursion => ['archive_match', 'int'] => 'int' );

$ffi->ignore_not_found(0);

1;