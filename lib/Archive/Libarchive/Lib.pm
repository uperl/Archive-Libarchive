package Archive::Libarchive::Lib;

use strict;
use warnings;
use 5.020;
use FFI::CheckLib 0.28 qw( find_lib_or_die );
use Encode qw( decode );
use experimental qw( signatures );

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
  $ENV{ARCHIVE_LIBARCHIVE_LIB_DLL} // find_lib_or_die( lib => 'archive', symbol => ['archive_read_free','archive_write_free','archive_free'], alien => ['Alien::Libarchive3'] );
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
    $ffi->load_custom_type( '::PtrObject', 'archive_match'      => 'Archive::Libarchive::Match' );
    $ffi->load_custom_type( '::PtrObject', 'archive_read_disk'  => 'Archive::Libarchive::DiskRead'     );
    $ffi->load_custom_type( '::PtrObject', 'archive_write_disk' => 'Archive::Libarchive::DiskWrite'    );

    $ffi->type( 'object(Archive::Libarchive::Entry)' => 'archive_entry' );
    $ffi->type( 'object(Archive::Libarchive::EntryLinkResolver)' => 'archive_entry_linkresolver' );

    $ffi->attach_cast( '_ptr_to_str', opaque => 'string' );

    $ffi->custom_type(string_utf8 => {
      native_type => 'opaque',
      native_to_perl => sub ($ptr,$) {
        my $raw = _ptr_to_str($ptr);
        decode('UTF-8', $raw, Encode::FB_CROAK);
      },
    });

    # callbacks for both read/write
    $ffi->type('(opaque,opaque)->int' => 'archive_open_callback');
    $ffi->type('(opaque,opaque)->int' => 'archive_close_callback');

    # callbacks for write
    $ffi->type('(opaque,opaque,opaque,size_t)->ssize_t' => 'archive_write_callback');

    # callbacks for read
    $ffi->type('(opaque,opaque,opaque)->ssize_t' => 'archive_read_callback');
    $ffi->type('(opaque,opaque,sint64)->ssize_t' => 'archive_skip_callback');
    $ffi->type('(opaque,opaque,sint64,int)->sint64' => 'archive_seek_callback');

    $ffi;
  };
}

1;
