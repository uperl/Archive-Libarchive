package Archive::Libarchive::DiskRead;

use strict;
use warnings;
use 5.020;
use Archive::Libarchive::Lib;
use experimental qw( signatures );
use parent qw( Archive::Libarchive::Archive );

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

$ffi->mangler(sub ($name) { "archive_read_disk_$name"  });

$ffi->attach( new => [] => 'opaque' => sub {
  my($xsub, $class) = @_;
  my $ptr = $xsub->();
  bless { ptr => $ptr }, $class;
});

#$ffi->attach( [ free => 'DESTROY' ] => ['archive_disk_read'] => 'void' );

require Archive::Libarchive::Generated::DiskRead unless $Archive::Libarchive::no_gen;

1;
