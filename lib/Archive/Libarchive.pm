package Archive::Libarchive;

use strict;
use warnings;
use 5.020;
use experimental qw( signatures );
use Archive::Libarchive::Lib;
use Archive::Libarchive::Read;
use Archive::Libarchive::Write;
use Archive::Libarchive::Entry;

# ABSTRACT: Modern Perl bindings to libarchive
# VERSION

my $ffi = Archive::Libarchive::Lib->ffi;

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 entry

 my $e = $archive->entry;

=cut

$ffi->mangler(sub ($name) { "archive_$name" });

$ffi->attach( [ entry_new => 'entry' ] => ['archive_t'] => 'opaque' => sub {
  my($xsub, $self) = @_;
  my $ptr = $xsub->($self);
  bless \$ptr, 'Archive::Libarchive::Entry';
});

1;
