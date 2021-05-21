package Archive::Libarchive::DiskWrite;

use strict;
use warnings;
use 5.020;
use Archive::Libarchive::Lib;
use experimental qw( signatures );
use parent qw( Archive::Libarchive::Archive );

# ABSTRACT: Libarchive disk write class
# VERSION

my $ffi = Archive::Libarchive::Lib->ffi;

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 CONSTRUCTOR

=head2 new

 my $r = Archive::Libarchive::DiskWrite->new;

Create a new disk write object.

=cut

$ffi->mangler(sub ($name) { "archive_write_disk_$name"  });

$ffi->attach( new => [] => 'opaque' => sub {
  my($xsub, $class) = @_;
  my $ptr = $xsub->();
  bless { ptr => $ptr }, $class;
});

#$ffi->attach( [ free => 'DESTROY' ] => ['archive_disk_write'] => 'void' );

require Archive::Libarchive::Generated::DiskWrite unless $Archive::Libarchive::no_gen;

1;
