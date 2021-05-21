package Archive::Libarchive::ArchiveWrite;

use strict;
use warnings;
use 5.020;
use Archive::Libarchive::Lib;
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

$ffi->attach( [ free => 'DESTROY' ] => ['archive_write'] => 'void' );

1;
