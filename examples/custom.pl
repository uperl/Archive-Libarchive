use strict;
use warnings;
use 5.020;
use Archive::Libarchive;

my $r = Archive::Libarchive::ArchiveRead->new;
$r->support_compression_all;
$r->support_format_all;

my $fh;

=pod

$r->open(
  open => sub {
    open my $fh, '<', 'archive.tar';
  },
  read => sub {
    ...
  },
  close => sub {
    close $fh;
  },
);

my $e = Archive::Libarchive::Entry->new;
while($r->next_header($e) == ARCHIVE_OK)
{
  say $e->pathname;
}

=cut
