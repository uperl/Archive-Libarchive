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

$ffi->attach( [ free => 'DESTROY' ] => ['archive_entry_t'] => 'void' );

1;
