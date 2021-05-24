package Archive::Libarchive::Match;

use strict;
use warnings;
use 5.020;
use Archive::Libarchive::Lib;
use experimental qw( signatures );
use parent qw( Archive::Libarchive::Archive );

# ABSTRACT: Libarchive match archive class
# VERSION

my $ffi = Archive::Libarchive::Lib->ffi;

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 CONSTRUCTOR

=head2 new

 my $r = Archive::Libarchive::Match->new;

Create a new archive match object.

=cut

$ffi->mangler(sub ($name) { "archive_match_$name"  });

$ffi->attach( new => [] => 'opaque' => sub {
  my($xsub, $class) = @_;
  my $ptr = $xsub->();
  bless { ptr => $ptr }, $class;
});

# TODO: warn if doesn't return ARCHIVE_OK
$ffi->attach( [ free => 'DESTROY' ] => ['archive_match'] => 'void' );

require Archive::Libarchive::Lib::Match unless $Archive::Libarchive::no_gen;

1;

__END__

=head1 SEE ALSO

=over 4

=item L<Archive::Libarchive>

=item L<Archive::Libarchive::API>

=item L<Archive::Libarchive::Archive>

=item L<Archive::Libarchive::ArchiveRead>

=item L<Archive::Libarchive::ArchiveWrite>

=item L<Archive::Libarchive::DiskRead>

=item L<Archive::Libarchive::DiskWrite>

=item L<Archive::Libarchive::Entry>

=item L<Archive::Libarchive::EntryLinkResolver>

=item L<Archive::Libarchive::Match>

=back

=cut
