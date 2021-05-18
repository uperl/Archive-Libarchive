package Archive::Libarchive::Lib;

use strict;
use warnings;
use 5.020;
use FFI::CheckLib 0.28 qw( find_lib_or_die );

# ABSTRACT: Private class for Archive::Libarchive
# VERSION

=head1 SYNOPSIS

 perldoc Archive::Libarchive

=head1 DESCRIPTION

There is nothing to see here.  Please see the main documentation page at
L<Archive::Libarchive>.

=head1 SEE ALSO

=over 4

=item L<Archive::Libarchive>

=back

=cut

sub lib
{
  find_lib_or_die( lib => 'archive', symbol => [], alien => ['Alien::Libarchive3'] );
}

sub ffi
{
  state $ffi;
  $ffi ||= do {
    require FFI::Platypus;
    FFI::Platypus->VERSION('1.00');
    my $ffi = FFI::Platypus->new( api => 1 );
    $ffi->lib(__PACKAGE__->lib);
    $ffi;
  };
}

1;
