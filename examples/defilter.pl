use strict;
use warnings;
use Archive::Libarchive;

my $r = Archive::Libarchive::ArchiveRead->new;
$r->support_compression_all;
$r->support_format_raw;
$r->open_filename("examples/hello.txt.uu");
$r->next_header(Archive::Libarchive::Entry->new);


# TODO
