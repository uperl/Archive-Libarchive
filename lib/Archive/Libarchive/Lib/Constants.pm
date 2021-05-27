package Archive::Libarchive::Lib::Constants;

use strict;
use warnings;
use 5.020;
use experimental qw( signatures );

# ABSTRACT: Private class for Arcive::Libarchive
# VERSION

# NOTE: This document is autogenerated from the template
# maint/tt/Const.pm.tt
# Please see maint/README.md for details on updating.

=head1 SYNOPSIS

 % perldoc Archive::Libarchive

=head1 DESCRIPTION

This is a private class for L<Archive::Libarchive> see the main documentation for the public interface.

=cut

sub _enums ($class, $ffi)
{
  $ffi->load_custom_type('::Enum', 'archive_enum_entry_acl',
    { prefix => 'ARCHIVE_ENTRY_ACL_', rev => 'str', type => 'int', package => 'Archive::Libarchive' },
    ['add_file', 16],
    ['add_subdirectory', 32],
    ['append_data', 32],
    ['delete', 2048],
    ['delete_child', 256],
    ['entry_directory_inherit', 67108864],
    ['entry_failed_access', 1073741824],
    ['entry_file_inherit', 33554432],
    ['entry_inherited', 16777216],
    ['entry_inherit_only', 268435456],
    ['entry_no_propagate_inherit', 134217728],
    ['entry_successful_access', 536870912],
    ['everyone', 10107],
    ['execute', 1],
    ['group', 10003],
    ['group_obj', 10004],
    ['inheritance_nfs4', 2130706432],
    ['list_directory', 8],
    ['mask', 10005],
    ['other', 10006],
    ['perms_nfs4', 65529],
    ['perms_posix1e', 7],
    ['read', 4],
    ['read_acl', 4096],
    ['read_attributes', 512],
    ['read_data', 8],
    ['read_named_attrs', 64],
    ['style_compact', 16],
    ['style_extra_id', 1],
    ['style_mark_default', 2],
    ['style_separator_comma', 8],
    ['style_solaris', 4],
    ['synchronize', 32768],
    ['type_access', 256],
    ['type_alarm', 8192],
    ['type_allow', 1024],
    ['type_audit', 4096],
    ['type_default', 512],
    ['type_deny', 2048],
    ['type_nfs4', 15360],
    ['type_posix1e', 768],
    ['user', 10001],
    ['user_obj', 10002],
    ['write', 2],
    ['write_acl', 8192],
    ['write_attributes', 1024],
    ['write_data', 16],
    ['write_named_attrs', 128],
    ['write_owner', 16384],
  );
  $ffi->load_custom_type('::Enum', 'archive_enum_entry_digest',
    { prefix => 'ARCHIVE_ENTRY_DIGEST_', rev => 'str', type => 'int', package => 'Archive::Libarchive' },
    ['md5', 1],
    ['rmd160', 2],
    ['sha1', 3],
    ['sha256', 4],
    ['sha384', 5],
    ['sha512', 6],
  );
  $ffi->load_custom_type('::Enum', 'archive_enum_extract',
    { prefix => 'ARCHIVE_EXTRACT_', rev => 'str', type => 'int', package => 'Archive::Libarchive' },
    ['acl', 32],
    ['clear_nochange_fflags', 131072],
    ['fflags', 64],
    ['hfs_compression_forced', 32768],
    ['mac_metadata', 8192],
    ['no_autodir', 1024],
    ['no_hfs_compression', 16384],
    ['no_overwrite', 8],
    ['no_overwrite_newer', 2048],
    ['owner', 1],
    ['perm', 2],
    ['safe_writes', 262144],
    ['secure_noabsolutepaths', 65536],
    ['secure_nodotdot', 512],
    ['secure_symlinks', 256],
    ['sparse', 4096],
    ['time', 4],
    ['unlink', 16],
    ['xattr', 128],
  );
  $ffi->load_custom_type('::Enum', 'archive_enum_filter',
    { prefix => 'ARCHIVE_FILTER_', rev => 'str', type => 'int', package => 'Archive::Libarchive' },
    ['bzip2', 2],
    ['compress', 3],
    ['grzip', 12],
    ['gzip', 1],
    ['lrzip', 10],
    ['lz4', 13],
    ['lzip', 9],
    ['lzma', 5],
    ['lzop', 11],
    ['none', 0],
    ['program', 4],
    ['rpm', 8],
    ['uu', 7],
    ['xz', 6],
    ['zstd', 14],
  );
  $ffi->load_custom_type('::Enum', 'archive_enum_format',
    { prefix => 'ARCHIVE_FORMAT_', rev => 'str', type => 'int', package => 'Archive::Libarchive' },
    ['7zip', 917504],
    ['ar', 458752],
    ['ar_bsd', 458754],
    ['ar_gnu', 458753],
    ['base_mask', 16711680],
    ['cab', 786432],
    ['cpio', 65536],
    ['cpio_afio_large', 65542],
    ['cpio_bin_be', 65539],
    ['cpio_bin_le', 65538],
    ['cpio_posix', 65537],
    ['cpio_svr4_crc', 65541],
    ['cpio_svr4_nocrc', 65540],
    ['empty', 393216],
    ['iso9660', 262144],
    ['iso9660_rockridge', 262145],
    ['lha', 720896],
    ['mtree', 524288],
    ['rar', 851968],
    ['rar_v5', 1048576],
    ['raw', 589824],
    ['shar', 131072],
    ['shar_base', 131073],
    ['shar_dump', 131074],
    ['tar', 196608],
    ['tar_gnutar', 196612],
    ['tar_pax_interchange', 196610],
    ['tar_pax_restricted', 196611],
    ['tar_ustar', 196609],
    ['warc', 983040],
    ['xar', 655360],
    ['zip', 327680],
  );
  $ffi->load_custom_type('::Enum', 'archive_enum_match',
    { prefix => 'ARCHIVE_MATCH_', rev => 'str', type => 'int', package => 'Archive::Libarchive' },
    ['ctime', 512],
    ['equal', 16],
    ['mtime', 256],
    ['newer', 1],
    ['older', 2],
  );
  $ffi->load_custom_type('::Enum', 'archive_enum_read_format',
    { prefix => 'ARCHIVE_READ_FORMAT_', rev => 'str', type => 'int', package => 'Archive::Libarchive' },
    ['caps_encrypt_data', 1],
    ['caps_encrypt_metadata', 2],
    ['caps_none', 0],
    ['encryption_dont_know', -1],
    ['encryption_unsupported', -2],
  );
  $ffi->load_custom_type('::Enum', 'archive_enum_readdisk',
    { prefix => 'ARCHIVE_READDISK_', rev => 'str', type => 'int', package => 'Archive::Libarchive' },
    ['honor_nodump', 2],
    ['mac_copyfile', 4],
    ['no_acl', 32],
    ['no_fflags', 64],
    ['no_traverse_mounts', 8],
    ['no_xattr', 16],
    ['restore_atime', 1],
  );
}

package Archive::Libarchive;

use constant {
  ARCHIVE_EOF => 1,
  ARCHIVE_FAILED => -25,
  ARCHIVE_FATAL => -30,
  ARCHIVE_OK => 0,
  ARCHIVE_RETRY => -10,
  ARCHIVE_WARN => -20,
};

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
