package Archive::Libarchive::Lib::Archive;

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

package Archive::Libarchive::Archive;

use Archive::Libarchive::Lib;

my $ffi = Archive::Libarchive::Lib->ffi;

$ffi->attach( clear_error => ['archive'] );
$ffi->attach( compression => ['archive'] => 'int' );
$ffi->attach( compression_name => ['archive'] => 'string' );
$ffi->attach( copy_error => ['archive', 'archive'] );
$ffi->attach( errno => ['archive'] => 'int' );
$ffi->attach( error_string => ['archive'] => 'string' );
$ffi->attach( file_count => ['archive'] => 'int' );
$ffi->attach( filter_bytes => ['archive', 'int'] => 'sint64' );
$ffi->attach( filter_code => ['archive', 'int'] => 'int' );
$ffi->attach( filter_count => ['archive'] => 'int' );
$ffi->attach( filter_name => ['archive', 'int'] => 'string' );
$ffi->attach( format => ['archive'] => 'int' );
$ffi->attach( format_name => ['archive'] => 'string' );
$ffi->attach( position_compressed => ['archive'] => 'sint64' );
$ffi->attach( position_uncompressed => ['archive'] => 'sint64' );
$ffi->attach( seek_data => ['archive', 'sint64', 'int'] => 'sint64' );

1;