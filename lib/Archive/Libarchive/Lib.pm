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
  find_lib_or_die( lib => 'archive', symbol => ['archive_read_free','archive_write_free'], alien => ['Alien::Libarchive3'] );
}

sub ffi
{
  state $ffi;
  $ffi ||= do {
    require FFI::Platypus;
    FFI::Platypus->VERSION('1.00');
    my $ffi = FFI::Platypus->new( api => 1 );

    # use libarchive dynamic lib
    $ffi->lib(__PACKAGE__->lib);

    $ffi->load_custom_type( '::WideString', 'wstring', access => 'read' );

    # type
    $ffi->load_custom_type( '::PtrObject', 'archive'            => 'Archive::Libarchive::Archive'      );
    $ffi->load_custom_type( '::PtrObject', 'archive_read'       => 'Archive::Libarchive::ArchiveRead'  );
    $ffi->load_custom_type( '::PtrObject', 'archive_write'      => 'Archive::Libarchive::ArchiveWrite' );
    $ffi->load_custom_type( '::PtrObject', 'archive_read_disk'  => 'Archive::Libarchive::DiskRead'  );
    $ffi->load_custom_type( '::PtrObject', 'archive_write_disk' => 'Archive::Libarchive::DiskWrite' );

    $ffi->type( 'object(Archive::Libarchive::Entry)' => 'archive_entry' );
    $ffi->type( 'object(Archive::Libarchive::Entry::LinkResolver)' => 'archive_entry_linkresolver' );

    $ffi;
  };
}

1;
