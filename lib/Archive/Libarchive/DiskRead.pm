package Archive::Libarchive::DiskRead;

use strict;
use warnings;
use 5.020;
use Archive::Libarchive::Lib;
use experimental qw( signatures );
use parent qw( Archive::Libarchive::ArchiveRead );

# ABSTRACT: Libarchive disk read class
# VERSION

my $ffi = Archive::Libarchive::Lib->ffi;

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 CONSTRUCTOR

=head2 new

 my $r = Archive::Libarchive::DiskRead->new;

Create a new disk read object.

=cut

$ffi->mangler(sub ($name) { "archive_read_$name"  });

$ffi->attach( [ disk_new => 'new' ] => [] => 'opaque' => sub {
  my($xsub, $class) = @_;
  my $ptr = $xsub->();
  bless { ptr => $ptr }, $class;
});

require Archive::Libarchive::Lib::DiskRead unless $Archive::Libarchive::no_gen;

1;
