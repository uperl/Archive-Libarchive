package Archive::Libarchive::Lib::DiskWrite;

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

package Archive::Libarchive::DiskWrite;

use Archive::Libarchive::Lib;

my $ffi = Archive::Libarchive::Lib->ffi;

$ffi->attach( disk_gid => ['archive_write_disk', 'string', 'sint64'] => 'sint64' );
#$ffi->attach( disk_set_group_lookup => ['archive_write_disk', 'opaque', undef, undef] => 'int' );
$ffi->attach( disk_set_options => ['archive_write_disk', 'int'] => 'int' );
$ffi->attach( disk_set_skip_file => ['archive_write_disk', 'sint64', 'sint64'] => 'int' );
$ffi->attach( disk_set_standard_lookup => ['archive_write_disk'] => 'int' );
#$ffi->attach( disk_set_user_lookup => ['archive_write_disk', 'opaque', undef, undef] => 'int' );
$ffi->attach( disk_uid => ['archive_write_disk', 'string', 'sint64'] => 'sint64' );

1;

__END__

=head1 SEE ALSO

=over 4

=item L<Archive::Libarchive>

=item L<Archive::Libarchive::API>

=item L<Archive::Libarchive::Archive>

=item L<Archive::Libarchive::ArchiveRead>

=item L<Archive::Libarchive::ArchiveWrite>

=item L<Archive::Libarchive::DiskRead>

=item L<Archive::Libarchive::DiskWrite>

=item L<Archive::Libarchive::Entry>

=item L<Archive::Libarchive::EntryLinkResolver>

=item L<Archive::Libarchive::Match>

=back

=cut
