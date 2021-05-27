package Archive::Libarchive::Entry;

use strict;
use warnings;
use 5.020;
use Archive::Libarchive::Lib;
use experimental qw( signatures );

# ABSTRACT: Libarchive entry class
# VERSION

my $ffi = Archive::Libarchive::Lib->ffi;

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 CONSTRUCTOR

=head2 new

 my $e = Archive::Libarchive::Entry->new;

Create a new Entry object.

=cut

$ffi->mangler(sub ($name) { "archive_entry_$name"  });

$ffi->attach( new => [] => 'opaque' => sub {
  my($xsub, $class) = @_;
  my $ptr = $xsub->();
  bless \$ptr, $class;
});

=head1 METHODS

=head2 filetype

 # archive_entry_filetype
 my $code = $e->filetype;

This returns the type of file for the entry.  This will be a dualvar where the string
is one of C<mt>, C<reg>, C<lnx>, C<sock>, C<chr>, C<blk>, C<dir> or C<ifo>, and
integer values will match the corresponding C<AE_IF> prefixed constant.  See
L<Archive::Libarchive::API/CONSTANTS> for the full list.

=head2 set_filetype

 # archive_entry_set_filetype
 $e->set_filetype($code);

This sets the type of the file for the entry.  This will accept either a string value
which is one of C<mt>, C<reg>, C<lnx>, C<sock>, C<chr>, C<blk>, C<dir> or C<ifo>,
or an integer constant value with the C<AE_IF> prefix.  See
L<Archive::Libarchive::API/CONSTANTS> for the full list.

=cut

# FIXME: these constants can't currently be extracted by
# Const::Introspect::C.  Though to be fair these are unlikely
# to need changing.
# FIXME: the la mode_t is an unsigned short on cygwin, this probably
# needs to be fixed in the introspection code too.  In 4.x this will
# be changed to an int / uint as per the header file.
$ffi->load_custom_type( '::Enum', 'archive_entry_filetype_ret_t',
  { prefix => 'AE_IF', rev => 'dualvar', type => 'mode_t', package => 'Archive::Libarchive' },
  [ mt   => oct('170000') ],
  [ reg  => oct('100000') ],
  [ lnk  => oct('120000') ],
  [ sock => oct('140000') ],
  [ chr  => oct('020000') ],
  [ blk  => oct('060000') ],
  [ dir  => oct('040000') ],
  [ ifo  => oct('010000') ],
);

$ffi->load_custom_type( '::Enum', 'archive_entry_filetype_t',
  { prefix => 'AE_IF', type => 'uint', package => 'Archive::Libarchive' },
  [ mt   => oct('170000') ],
  [ reg  => oct('100000') ],
  [ lnk  => oct('120000') ],
  [ sock => oct('140000') ],
  [ chr  => oct('020000') ],
  [ blk  => oct('060000') ],
  [ dir  => oct('040000') ],
  [ ifo  => oct('010000') ],
);

$ffi->attach( filetype => ['archive_entry'] => 'archive_entry_filetype_ret_t' );
$ffi->attach( set_filetype => ['archive_entry', 'archive_entry_filetype_t'] );

# TODO: warn if doesn't return ARCHIVE_OK
$ffi->attach( [ free => 'DESTROY' ] => ['archive_entry'] => 'void' );

require Archive::Libarchive::Lib::Entry unless $Archive::Libarchive::no_gen;

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
