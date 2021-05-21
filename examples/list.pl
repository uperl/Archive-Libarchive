use strict;
use warnings;
use 5.020;
use Archive::Libarchive;

my $r = Archive::Libarchive::ArchiveRead->new;
$r->support_filter_all;
$r->support_format_all;
my $ret = $r->open_filename("archive.tar", 10240);
if($ret != 0) {
  exit 1;
}

my $e = Archive::Libarchive::Entry->new;
while($r->next_header($e) == 0) {
  say $e->pathname;
  $r->data_skip;
}
