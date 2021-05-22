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

$ffi->attach( [ entry_new2 => 'entry' ] => ['archive'] => 'opaque' => sub {
  my($xsub, $self) = @_;
  my $ptr = $xsub->($self);
  bless \$ptr, 'Archive::Libarchive::Entry';
});

=head2 set_error

 $archive->set_error($str);

=cut

$ffi->attach( set_error => ['archive', 'int', 'string'] => [] => sub {
  my($xsub, $self, $errno, $string) = @_;
  $xsub->($self, $errno, $string =~ s/%/%%/gr);
});

require Archive::Libarchive::Lib::Archive unless $Archive::Libarchive::no_gen;

1;
