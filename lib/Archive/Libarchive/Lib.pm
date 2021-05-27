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
    $ffi->type('(opaque,opaque)->int'    => 'archive_open_callback'                 );
    $ffi->type('(opaque,opaque)->int'    => 'archive_close_callback'                );
    $ffi->type('(opaque,opaque)->opaque' => 'archive_passphrase_callback'           );  # actually returns a string :/

    # callbacks for write
    $ffi->type('(opaque,opaque,opaque,size_t)->ssize_t' => 'archive_write_callback' );

    # callbacks for read
    $ffi->type('(opaque,opaque,opaque)->ssize_t'    => 'archive_read_callback'      );
    $ffi->type('(opaque,opaque,sint64)->ssize_t'    => 'archive_skip_callback'      );
    $ffi->type('(opaque,opaque,sint64,int)->sint64' => 'archive_seek_callback'      );

    # FIXME: these constants can't currently be extracted by
    # Const::Introspect::C.  Though to be fair these are unlikely
    # to need changing.
    $ffi->load_custom_type( '::Enum', 'archive_entry_filetype_t',
      { prefix => 'AE_IF', rev => 'str', type => 'int', package => 'Archive::Libarchive' },
      [ mt   => oct('170000') ],
      [ reg  => oct('100000') ],
      [ lnk  => oct('120000') ],
      [ sock => oct('140000') ],
      [ chr  => oct('020000') ],
      [ blk  => oct('060000') ],
      [ dir  => oct('040000') ],
      [ ifo  => oct('010000') ],
    );

    if($Archive::Libarchive::no_gen)
    {
    }
    else
    {
      require Archive::Libarchive::Lib::Constants;
      Archive::Libarchive::Lib::Constants->_enums($ffi);
    }

    $ffi;
  };
}

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
