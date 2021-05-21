package Archive::Libarchive::Lib::DiskRead;

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

package Archive::Libarchive::DiskRead;

use Archive::Libarchive::Lib;

my $ffi = Archive::Libarchive::Lib->ffi;

$ffi->attach( can_descend => ['archive_read_disk'] => 'int' );
$ffi->attach( current_filesystem => ['archive_read_disk'] => 'int' );
$ffi->attach( current_filesystem_is_remote => ['archive_read_disk'] => 'int' );
$ffi->attach( current_filesystem_is_synthetic => ['archive_read_disk'] => 'int' );
$ffi->attach( descend => ['archive_read_disk'] => 'int' );
#$ffi->attach( entry_from_file => ['archive_read_disk', 'archive_entry', 'int', undef] => 'int' );
$ffi->attach( gname => ['archive_read_disk', 'sint64'] => 'string' );
$ffi->attach( open => ['archive_read_disk', 'string'] => 'int' );
$ffi->attach( open_w => ['archive_read_disk', 'wstring'] => 'int' );
$ffi->attach( set_atime_restored => ['archive_read_disk'] => 'int' );
$ffi->attach( set_behavior => ['archive_read_disk', 'int'] => 'int' );
#$ffi->attach( set_gname_lookup => ['archive_read_disk', 'opaque', undef, undef] => 'int' );
#$ffi->attach( set_matching => ['archive_read_disk', 'archive', undef, 'opaque'] => 'int' );
#$ffi->attach( set_metadata_filter_callback => ['archive_read_disk', undef, 'opaque'] => 'int' );
$ffi->attach( set_standard_lookup => ['archive_read_disk'] => 'int' );
$ffi->attach( set_symlink_hybrid => ['archive_read_disk'] => 'int' );
$ffi->attach( set_symlink_logical => ['archive_read_disk'] => 'int' );
$ffi->attach( set_symlink_physical => ['archive_read_disk'] => 'int' );
#$ffi->attach( set_uname_lookup => ['archive_read_disk', 'opaque', undef, undef] => 'int' );
$ffi->attach( uname => ['archive_read_disk', 'sint64'] => 'string' );

1;
