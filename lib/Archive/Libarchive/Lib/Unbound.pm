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

$ffi->attach( archive_bzlib_version => [] => 'string' );
$ffi->attach( archive_liblz4_version => [] => 'string' );
$ffi->attach( archive_liblzma_version => [] => 'string' );
$ffi->attach( archive_utility_string_sort => ['string*'] => 'int' );
$ffi->attach( archive_version_details => [] => 'string' );
$ffi->attach( archive_version_number => [] => 'int' );
$ffi->attach( archive_version_string => [] => 'string' );
$ffi->attach( archive_zlib_version => [] => 'string' );
$ffi->attach( archive_entry_linkify => ['archive_entry_linkresolver', 'archive_entry', 'archive_entry'] );
$ffi->attach( archive_entry_partial_links => ['archive_entry_linkresolver', 'uint*'] => 'archive_entry' );

$ffi->ignore_not_found(1);

$ffi->attach( archive_libzstd_version => [] => 'string' );

$ffi->ignore_not_found(0);

1;
