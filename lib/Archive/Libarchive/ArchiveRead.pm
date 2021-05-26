package Archive::Libarchive::ArchiveRead;

use strict;
use warnings;
use 5.020;
use Archive::Libarchive::Lib;
use FFI::Platypus::Buffer qw( scalar_to_buffer scalar_to_pointer );
use Ref::Util qw( is_plain_scalarref is_plain_coderef is_blessed_ref );
use Carp ();
use PeekPoke::FFI ();
use experimental qw( signatures );
use parent qw( Archive::Libarchive::Archive );

# ABSTRACT: Libarchive read archive class
# VERSION

my $ffi = Archive::Libarchive::Lib->ffi;

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 CONSTRUCTOR

=head2 new

 # archive_read_new
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
  return if $self->{cb}                 # inside a callback, we don't own the archive pointer
    || ${^GLOBAL_PHASE} eq 'DESTRUCT';  # during global shutdown the xsub might go away
  my $ret = $xsub->($self);
  warn "destroying archive pointer did not return ARCHIVE_OK" unless $ret == 0;
});

=head1 METHODS

=head2 open

 # archive_read_open1
 # archive_read_set_callback_data
 # archive_read_set_close_callback
 # archive_read_set_open_callback
 # archive_read_set_read_callback
 # archive_read_set_seek_callback
 # archive_read_set_skip_callback
 $r->open(%callbacks);

=over 4

=item open

 $r->open(open => sub ($w) {
   ...
 });

=item read

 $r->open(read => sub ($w, $ref) {
   $$ref = ...;
   ...
 });

=item seek

 $r->open(seek => sub ($w, $offset, $whence) {
   ...
 });

=item skip

 $r->open(skip => sub ($w, $request) {
   ...
 });

=item close

 $r->open(close => sub ($w) {
   ...
 });

=back

=cut

my %set_callback = map {
  ($_ => $ffi->function( "set_${_}_callback" => ['archive_read',"archive_${_}_callback"] => 'int' )->sub_ref)
} qw( open close read seek skip );

$ffi->attach( [ set_callback_data => '_set_callback_data' ] => ['archive_read','opaque'] => 'int' );

$ffi->attach( [ open1 => 'open' ] => [ 'archive_read'] => 'int' => sub {
  my($xsub, $self, %callbacks) = @_;

  Carp::croak("The read callback is required") unless $callbacks{read};

  foreach my $name (keys %set_callback)
  {
    my $set = $set_callback{$name};
    my $sub = delete $callbacks{$name};

    unless(defined $sub)
    {
      $set->($self, undef);
      next;
    }

    Carp::croak("Callback for $name is not a code reference") unless is_plain_coderef $sub;

    my $closure;

    if($name eq 'read')
    {
      $closure = FFI::Platypus->closure(sub ($r, $, $ptrptr) {
        $r = bless { ptr => $r, cb => 1 }, __PACKAGE__;
        $self->{read_buffer} = undef;
        my $size = $sub->($r, \$self->{read_buffer});
        my $ptr = defined $self->{read_buffer} ? scalar_to_pointer($self->{read_buffer}) : undef;
        my $pp = PeekPoke::FFI->new( type => 'opaque', base => $ptrptr );
        $pp->poke(0, $ptr);
        return $size;
      });
    }
    else
    {
      $closure = FFI::Platypus->closure(sub ($r, $, @therest) {
        $r = bless { ptr => $r, cb => 1 }, __PACKAGE__;
        $sub->($r, @therest);
      });
    }

    push @{ $self->{keep} }, $closure;

    $set->($self, $closure);
  }

  Carp::croak("No such read callbacks: @{[ sort keys %callbacks ]}") if %callbacks;

  _set_callback_data($self, undef);

  $xsub->($self);
});

=head2 next_header

 # archive_read_next_header
 my $code = $r->next_header($e);

Returns the next L<Archive::Libarchive::Entry> object.

=cut

$ffi->attach( [ next_header2 => 'next_header' ] => ['archive_read','archive_entry'] => 'int' => sub {
  my($xsub, $self, $entry) = @_;
  $xsub->($self, $entry);
});

=head2 open_memory

 # archive_write_open_memory
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

=head2 open_FILE

 $r->open_FILE($file_pointer);

This takes either a L<FFI::C::File>, or an opaque pointer to a libc file pointer.

=cut

$ffi->attach( open_FILE => ['archive_read', 'opaque'] => 'int' => sub {
  my($xsub, $self, $fp) = @_;
  $fp = $$fp if is_blessed_ref $fp && $fp->isa('FFI::C::File');
  $xsub->($self, $fp);
});

=head2 open_perlfile

 $r->open_perlfile(*FILE);

This takes a perl file handle and reads the archive from there.

=cut

sub open_perlfile ($self, $fh)
{
  $self->open(
    read => sub ($w, $ref) {
      return sysread $fh, $$ref, 512;
    },
    close => sub ($w) {
      close $fh;
    },
  );
}

=head2 read_data

 # archive_read_data
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
