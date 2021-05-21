package Archive::Libarchive::Archive;

use strict;
use warnings;
use 5.020;
use experimental qw( signatures );
use Archive::Libarchive::Entry;

# ABSTRACT: Libarchive archive base object
# VERSION

my $ffi = Archive::Libarchive::Lib->ffi;

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 entry

 my $e = $archive->entry;

=cut

$ffi->mangler(sub ($name) { "archive_$name" });
$ffi->ignore_not_found(0);

$ffi->attach( [ entry_new2 => 'entry' ] => ['archive'] => 'opaque' => sub {
  my($xsub, $self) = @_;
  my $ptr = $xsub->($self);
  bless \$ptr, 'Archive::Libarchive::Entry';
});

1;
