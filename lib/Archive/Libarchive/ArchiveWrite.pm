package Archive::Libarchive::ArchiveWrite;

use strict;
use warnings;
use 5.020;
use Archive::Libarchive::Lib;
use Carp ();
use Ref::Util qw( is_plain_coderef );
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

=head2 data

 $w->data($buffer);

=cut

$ffi->attach( data => ['archive_write', 'opaque', 'size_t'] => 'ssize_t' => sub {
  my $xsub = shift;
  my $self = shift;
  $xsub->($self, scalar_to_buffer $_[0]);
});

require Archive::Libarchive::Lib::ArchiveWrite unless $Archive::Libarchive::no_gen;

1;
