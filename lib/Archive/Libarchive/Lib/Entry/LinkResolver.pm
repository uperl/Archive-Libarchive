package Archive::Libarchive::Lib::Entry::LinkResolver;

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

package Archive::Libarchive::Entry::LinkResolver;

use Archive::Libarchive::Lib;

my $ffi = Archive::Libarchive::Lib->ffi;

$ffi->attach( set_strategy => ['archive_entry_linkresolver', 'int'] );

$ffi->ignore_not_found(1);


$ffi->ignore_not_found(0);

1;
