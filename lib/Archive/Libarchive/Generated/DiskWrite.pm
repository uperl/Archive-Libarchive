package Archive::Libarchive::Generated::DiskWrite;

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

package Archive::Libarchive::DiskWrite;

use Archive::Libarchive::Lib;

my $ffi = Archive::Libarchive::Lib->ffi;

$ffi->attach( gid => ['archive_write_disk', 'string', 'sint64'] => 'sint64' );
$ffi->attach( set_options => ['archive_write_disk', 'int'] => 'int' );
$ffi->attach( set_skip_file => ['archive_write_disk', 'sint64', 'sint64'] => 'int' );
$ffi->attach( set_standard_lookup => ['archive_write_disk'] => 'int' );
$ffi->attach( uid => ['archive_write_disk', 'string', 'sint64'] => 'sint64' );

$ffi->ignore_not_found(1);


$ffi->ignore_not_found(0);

1;
