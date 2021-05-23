package Archive::Libarchive::Lib::Entry;

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

package Archive::Libarchive::Entry;

use Archive::Libarchive::Lib;

my $ffi = Archive::Libarchive::Lib->ffi;

$ffi->attach( acl_add_entry => ['archive_entry', 'int', 'int', 'int', 'int', 'string'] => 'int' );
$ffi->attach( acl_add_entry_w => ['archive_entry', 'int', 'int', 'int', 'int', 'wstring'] => 'int' );
$ffi->attach( acl_clear => ['archive_entry'] );
$ffi->attach( acl_count => ['archive_entry', 'int'] => 'int' );
$ffi->attach( acl_next => ['archive_entry', 'int', 'int*', 'int*', 'int*', 'int*', 'string*'] => 'int' );
$ffi->attach( acl_reset => ['archive_entry', 'int'] => 'int' );
$ffi->attach( acl_text => ['archive_entry', 'int'] => 'string' );
$ffi->attach( acl_text_w => ['archive_entry', 'int'] => 'wstring' );
$ffi->attach( atime => ['archive_entry'] => 'time_t' );
$ffi->attach( atime_is_set => ['archive_entry'] => 'int' );
$ffi->attach( atime_nsec => ['archive_entry'] => 'long' );
$ffi->attach( birthtime => ['archive_entry'] => 'time_t' );
$ffi->attach( birthtime_is_set => ['archive_entry'] => 'int' );
$ffi->attach( birthtime_nsec => ['archive_entry'] => 'long' );
$ffi->attach( clear => ['archive_entry'] => 'archive_entry' );
$ffi->attach( clone => ['archive_entry'] => 'archive_entry' );
$ffi->attach( copy_fflags_text => ['archive_entry', 'string'] => 'string' );
$ffi->attach( copy_fflags_text_w => ['archive_entry', 'wstring'] => 'wstring' );
$ffi->attach( copy_gname => ['archive_entry', 'string'] );
$ffi->attach( copy_gname_w => ['archive_entry', 'wstring'] );
$ffi->attach( copy_hardlink => ['archive_entry', 'string'] );
$ffi->attach( copy_hardlink_w => ['archive_entry', 'wstring'] );
$ffi->attach( copy_link => ['archive_entry', 'string'] );
$ffi->attach( copy_link_w => ['archive_entry', 'wstring'] );
$ffi->attach( copy_mac_metadata => ['archive_entry', 'opaque', 'size_t'] );
$ffi->attach( copy_pathname => ['archive_entry', 'string'] );
$ffi->attach( copy_pathname_w => ['archive_entry', 'wstring'] );
$ffi->attach( copy_sourcepath => ['archive_entry', 'string'] );
$ffi->attach( copy_sourcepath_w => ['archive_entry', 'wstring'] );
#$ffi->attach( copy_stat => ['archive_entry', undef] );
$ffi->attach( copy_symlink => ['archive_entry', 'string'] );
$ffi->attach( copy_symlink_w => ['archive_entry', 'wstring'] );
$ffi->attach( copy_uname => ['archive_entry', 'string'] );
$ffi->attach( copy_uname_w => ['archive_entry', 'wstring'] );
$ffi->attach( ctime => ['archive_entry'] => 'time_t' );
$ffi->attach( ctime_is_set => ['archive_entry'] => 'int' );
$ffi->attach( ctime_nsec => ['archive_entry'] => 'long' );
$ffi->attach( dev => ['archive_entry'] => 'dev_t' );
$ffi->attach( dev_is_set => ['archive_entry'] => 'int' );
$ffi->attach( devmajor => ['archive_entry'] => 'dev_t' );
$ffi->attach( devminor => ['archive_entry'] => 'dev_t' );
$ffi->attach( fflags => ['archive_entry', 'ulong*', 'ulong*'] );
$ffi->attach( fflags_text => ['archive_entry'] => 'string' );
$ffi->attach( filetype => ['archive_entry'] => 'mode_t' );
$ffi->attach( gid => ['archive_entry'] => 'sint64' );
$ffi->attach( gname => ['archive_entry'] => 'string' );
$ffi->attach( gname_utf8 => ['archive_entry'] => 'string_utf8' );
$ffi->attach( hardlink => ['archive_entry'] => 'string' );
$ffi->attach( hardlink_utf8 => ['archive_entry'] => 'string_utf8' );
$ffi->attach( ino => ['archive_entry'] => 'sint64' );
$ffi->attach( ino64 => ['archive_entry'] => 'sint64' );
$ffi->attach( ino_is_set => ['archive_entry'] => 'int' );
$ffi->attach( is_data_encrypted => ['archive_entry'] => 'int' );
$ffi->attach( is_encrypted => ['archive_entry'] => 'int' );
$ffi->attach( is_metadata_encrypted => ['archive_entry'] => 'int' );
$ffi->attach( mac_metadata => ['archive_entry', 'size_t*'] => 'opaque' );
$ffi->attach( mode => ['archive_entry'] => 'mode_t' );
$ffi->attach( mtime => ['archive_entry'] => 'time_t' );
$ffi->attach( mtime_is_set => ['archive_entry'] => 'int' );
$ffi->attach( mtime_nsec => ['archive_entry'] => 'long' );
$ffi->attach( nlink => ['archive_entry'] => 'uint' );
$ffi->attach( pathname => ['archive_entry'] => 'string' );
$ffi->attach( pathname_utf8 => ['archive_entry'] => 'string_utf8' );
$ffi->attach( perm => ['archive_entry'] => 'mode_t' );
$ffi->attach( rdev => ['archive_entry'] => 'dev_t' );
$ffi->attach( rdevmajor => ['archive_entry'] => 'dev_t' );
$ffi->attach( rdevminor => ['archive_entry'] => 'dev_t' );
$ffi->attach( set_atime => ['archive_entry', 'time_t', 'long'] );
$ffi->attach( set_birthtime => ['archive_entry', 'time_t', 'long'] );
$ffi->attach( set_ctime => ['archive_entry', 'time_t', 'long'] );
$ffi->attach( set_dev => ['archive_entry', 'dev_t'] );
$ffi->attach( set_devmajor => ['archive_entry', 'dev_t'] );
$ffi->attach( set_devminor => ['archive_entry', 'dev_t'] );
$ffi->attach( set_fflags => ['archive_entry', 'ulong', 'ulong'] );
$ffi->attach( set_filetype => ['archive_entry', 'uint'] );
$ffi->attach( set_gid => ['archive_entry', 'sint64'] );
$ffi->attach( set_gname => ['archive_entry', 'string'] );
$ffi->attach( set_gname_utf8 => ['archive_entry', 'string'] );
$ffi->attach( set_hardlink => ['archive_entry', 'string'] );
$ffi->attach( set_hardlink_utf8 => ['archive_entry', 'string'] );
$ffi->attach( set_ino => ['archive_entry', 'sint64'] );
$ffi->attach( set_ino64 => ['archive_entry', 'sint64'] );
$ffi->attach( set_is_data_encrypted => ['archive_entry', 'char'] );
$ffi->attach( set_is_metadata_encrypted => ['archive_entry', 'char'] );
$ffi->attach( set_link => ['archive_entry', 'string'] );
$ffi->attach( set_link_utf8 => ['archive_entry', 'string'] );
$ffi->attach( set_mode => ['archive_entry', 'mode_t'] );
$ffi->attach( set_mtime => ['archive_entry', 'time_t', 'long'] );
$ffi->attach( set_nlink => ['archive_entry', 'uint'] );
$ffi->attach( set_pathname => ['archive_entry', 'string'] );
$ffi->attach( set_pathname_utf8 => ['archive_entry', 'string'] );
$ffi->attach( set_perm => ['archive_entry', 'mode_t'] );
$ffi->attach( set_rdev => ['archive_entry', 'dev_t'] );
$ffi->attach( set_rdevmajor => ['archive_entry', 'dev_t'] );
$ffi->attach( set_rdevminor => ['archive_entry', 'dev_t'] );
$ffi->attach( set_size => ['archive_entry', 'sint64'] );
$ffi->attach( set_symlink => ['archive_entry', 'string'] );
$ffi->attach( set_symlink_utf8 => ['archive_entry', 'string'] );
$ffi->attach( set_uid => ['archive_entry', 'sint64'] );
$ffi->attach( set_uname => ['archive_entry', 'string'] );
$ffi->attach( set_uname_utf8 => ['archive_entry', 'string'] );
$ffi->attach( size => ['archive_entry'] => 'sint64' );
$ffi->attach( size_is_set => ['archive_entry'] => 'int' );
$ffi->attach( sourcepath => ['archive_entry'] => 'string' );
$ffi->attach( sourcepath_w => ['archive_entry'] => 'wstring' );
$ffi->attach( sparse_add_entry => ['archive_entry', 'sint64', 'sint64'] );
$ffi->attach( sparse_clear => ['archive_entry'] );
$ffi->attach( sparse_count => ['archive_entry'] => 'int' );
$ffi->attach( sparse_next => ['archive_entry', 'sint64*', 'sint64*'] => 'int' );
$ffi->attach( sparse_reset => ['archive_entry'] => 'int' );
#$ffi->attach( stat => ['archive_entry'] => undef );
$ffi->attach( strmode => ['archive_entry'] => 'string' );
$ffi->attach( symlink => ['archive_entry'] => 'string' );
$ffi->attach( symlink_utf8 => ['archive_entry'] => 'string_utf8' );
$ffi->attach( uid => ['archive_entry'] => 'sint64' );
$ffi->attach( uname => ['archive_entry'] => 'string' );
$ffi->attach( uname_utf8 => ['archive_entry'] => 'string_utf8' );
$ffi->attach( unset_atime => ['archive_entry'] );
$ffi->attach( unset_birthtime => ['archive_entry'] );
$ffi->attach( unset_ctime => ['archive_entry'] );
$ffi->attach( unset_mtime => ['archive_entry'] );
$ffi->attach( unset_size => ['archive_entry'] );
$ffi->attach( update_gname_utf8 => ['archive_entry', 'string'] => 'int' );
$ffi->attach( update_hardlink_utf8 => ['archive_entry', 'string'] => 'int' );
$ffi->attach( update_link_utf8 => ['archive_entry', 'string'] => 'int' );
$ffi->attach( update_pathname_utf8 => ['archive_entry', 'string'] => 'int' );
$ffi->attach( update_symlink_utf8 => ['archive_entry', 'string'] => 'int' );
$ffi->attach( update_uname_utf8 => ['archive_entry', 'string'] => 'int' );
$ffi->attach( xattr_add_entry => ['archive_entry', 'string', 'opaque', 'size_t'] );
$ffi->attach( xattr_clear => ['archive_entry'] );
$ffi->attach( xattr_count => ['archive_entry'] => 'int' );
#$ffi->attach( xattr_next => ['archive_entry', 'string*', undef, 'size_t*'] => 'int' );
$ffi->attach( xattr_reset => ['archive_entry'] => 'int' );

$ffi->ignore_not_found(1);

$ffi->attach( acl_from_text => ['archive_entry', 'string', 'int'] => 'int' );
$ffi->attach( acl_from_text_w => ['archive_entry', 'wstring', 'int'] => 'int' );
$ffi->attach( acl_to_text => ['archive_entry', 'ssize_t*', 'int'] => 'string' );
$ffi->attach( acl_to_text_w => ['archive_entry', 'ssize_t*', 'int'] => 'wstring' );
$ffi->attach( acl_types => ['archive_entry'] => 'int' );
#$ffi->attach( digest => ['archive_entry', 'int'] => undef );
$ffi->attach( set_symlink_type => ['archive_entry', 'int'] );
$ffi->attach( symlink_type => ['archive_entry'] => 'int' );

$ffi->ignore_not_found(0);

1;