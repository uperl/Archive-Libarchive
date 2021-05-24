package Archive::Libarchive::ArchiveRead;

use strict;
use warnings;
use 5.020;
use Archive::Libarchive::Lib;
use FFI::Platypus::Buffer qw( scalar_to_buffer );
use Ref::Util qw( is_plain_scalarref );
use Carp ();
use experimental qw( signatures );
use parent qw( Archive::Libarchive::Archive );

# ABSTRACT: Libarchive read archive class
# VERSION

my $ffi = Archive::Libarchive::Lib->ffi;

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 CONSTRUCTOR

=head2 new

 my $r = Archive::Libarchive::ArchiveRead->new;

Create a new archive read object.

=cut

$ffi->mangler(sub ($name) { "archive_read_$name"  });

$ffi->attach( new => [] => 'opaque' => sub {
  my($xsub, $class) = @_;
  my $ptr = $xsub->();
  bless { ptr => $ptr }, $class;
});

$ffi->attach( [ free => 'DESTROY' ] => ['archive_read'] => 'int' => sub {
  my($xsub, $self) = @_;
  return if $self->{cb};  # inside a callback, we don't own the archive pointer
  my $ret = $xsub->($self);
  warn "destroying archive pointer did not return ARCHIVE_OK" unless $ret == 0;
});

=head1 METHODS

=head2 next_header

 my $code = $r->next_header($e);

Returns the next L<Archive::Libarchive::Entry> object.

=cut

$ffi->attach( [ next_header2 => 'next_header' ] => ['archive_read','archive_entry'] => 'int' => sub {
  my($xsub, $self, $entry) = @_;
  $xsub->($self, $entry);
});

=head2 open_memory

 my $code = $r->open_memory(\$buffer);

Open's the in-memory archive.

=cut

$ffi->attach( open_memory => ['archive_read','opaque','size_t'] => 'int' => sub {
  my($xsub, $self, $ref) = @_;
  Carp::croak("buffer must be a scalar reference")
    unless defined $ref && is_plain_scalarref $ref;
  push @{ $self->{keep} }, \($$ref);
  my($ptr, $size) = scalar_to_buffer $$ref;
  $xsub->($self, $ptr, $size);
});

=head2 read_data

 my $code = $r->read_data(\$buffer, $size);
 my $code = $r->read_data(\$buffer);

=cut

$ffi->attach( [data => 'read_data'] => ['archive_read', 'opaque', 'size_t'] => 'ssize_t' => sub {
  my($xsub, $self, $ref, $size) = @_;
  $size ||= 1024;

  # TODO: this is highly non-performant!
  $$ref = "\0" x $size;
  my $rsize = $xsub->($self, (scalar_to_buffer $$ref));

  $$ref = substr $$ref, 0, $rsize if $size != $rsize;

  return $rsize;
});

require Archive::Libarchive::Lib::ArchiveRead unless $Archive::Libarchive::no_gen;

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
