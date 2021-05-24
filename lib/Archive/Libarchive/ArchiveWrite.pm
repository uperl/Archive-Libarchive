package Archive::Libarchive::ArchiveWrite;

use strict;
use warnings;
use 5.020;
use Archive::Libarchive::Lib;
use Carp ();
use Ref::Util qw( is_plain_coderef is_blessed_ref );
use FFI::Platypus::Buffer qw( window scalar_to_buffer );
use experimental qw( signatures );
use parent qw( Archive::Libarchive::Archive );

# ABSTRACT: Libarchive write archive class
# VERSION

my $ffi = Archive::Libarchive::Lib->ffi;

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 CONSTRUCTOR

=head2 new

 my $w = Archive::Libarchive::ArchiveWrite->new;

Create a new archive write object.

=cut

$ffi->mangler(sub ($name) { "archive_write_$name"  });

$ffi->attach( new => [] => 'opaque' => sub {
  my($xsub, $class) = @_;
  my $ptr = $xsub->();
  bless { ptr => $ptr }, $class;
});

$ffi->attach( [ free => 'DESTROY' ] => ['archive_write'] => 'int' => sub {
  my($xsub, $self) = @_;
  return if $self->{cb};  # inside a callback, we don't own the archive pointer
  my $ret = $xsub->($self);
  warn "destroying archive pointer did not return ARCHIVE_OK" unless $ret == 0;
});

=head2 open

 $w->open(%callbacks);

=over 4

=item open

 $w->open(open => sub ($w) {
   ...
 });

=item read

 $w->open(read => sub ($w, $buffer) {
   ...
 });

=item close

 $w->open(open => sub ($w) {
   ...
 });

=back

=cut

$ffi->attach( open => ['archive_write', 'opaque', 'archive_open_callback', 'archive_write_callback', 'archive_close_callback'] => 'int' => sub {
  my($xsub, $self, %cb) = @_;

  foreach my $name (qw( open write close ))
  {
    if(defined $cb{$name} && !is_plain_coderef $cb{$name})
    {
      Carp::croak("$name callback is not a subref");
    }
  }

  my $opener = $cb{open};
  my $writer = $cb{write};
  my $closer = $cb{close};

  Carp::croak("write callback is required") unless $writer;

  if($opener)
  {
    my $orig = $opener;
    $opener = FFI::Platypus->closure(sub ($w, $) {
      $w = bless { ptr => $w, cb => 1 }, __PACKAGE__;
      $orig->($w);
    });
    push @{ $self->{keep} }, $opener;
  }

  if($writer)
  {
    my $orig = $writer;
    $writer = FFI::Platypus->closure(sub ($w, $, $ptr, $size) {
      $w = bless { ptr => $w, cb => 1 }, __PACKAGE__;
      my $buffer;
      window $buffer, $ptr, $size;
      $orig->($w, $buffer);
    });
    push @{ $self->{keep} }, $writer;
  }

  if($closer)
  {
    my $orig = $closer;
    $closer = FFI::Platypus->closure(sub ($w, $) {
      $w = bless { ptr => $w, cb => 1 }, __PACKAGE__;
      $orig->($w);
    });
    push @{ $self->{keep} }, $closer;
  }

  $xsub->($self, undef, $opener, $writer, $closer);
});

=head2 open_FILE

 $w->open_FILE($file_pointer);

This takes either a L<FFI::C::File>, or an opaque pointer to a libc file pointer.

=cut

$ffi->attach( open_FILE => ['archive_write', 'opaque'] => 'int' => sub {
  my($xsub, $self, $fp) = @_;
  $fp = $$fp if is_blessed_ref $fp && $fp->isa('FFI::C::File');
  $xsub->($self, $fp);
});

=head2 open_memory

 $w->open_memory(\$buffer);

This takes a reference to scalar and stores the archive in memory there.

=cut

sub open_memory ($self, $ref)
{
  # TODO: it would be nice to pre-allocate $$ref with grow (FFI::Platypus::Buffer)
  # but that gave me scary errors, so look into it later.
  $self->open(
    write => sub ($w, $buffer) {
      $$ref .= $buffer;
      return length $buffer;
    },
  );
}

=head2 open_perlfile

 $w->open_perlfile(*FILE);

This takes a perl file handle and stores the archive there.

=cut

sub open_perlfile ($self, $fh)
{
  $self->open(
    write => sub ($w, $buffer) {
      return syswrite $fh, $buffer;
    },
    close => sub ($w) {
      close $fh;
    },
  );
}

=head2 data

 $w->write_data($buffer);

=cut

# TODO: data_block?

$ffi->attach( [ data => 'write_data' ] => ['archive_write', 'opaque', 'size_t'] => 'ssize_t' => sub {
  my $xsub = shift;
  my $self = shift;
  $xsub->($self, scalar_to_buffer $_[0]);
});

require Archive::Libarchive::Lib::ArchiveWrite unless $Archive::Libarchive::no_gen;

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
