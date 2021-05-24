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

=item L<Archive::Libarchive::API>

=item L<Archive::Libarchive::Archive>

=item L<Archive::Libarchive::ArchiveWrite>

=item L<Archive::Libarchive::DiskRead>

=item L<Archive::Libarchive::DiskWrite>

=item L<Archive::Libarchive::Entry>

=item L<Archive::Libarchive::EntryLinkResolver>

=item L<Archive::Libarchive::Match>

=back

=cut
