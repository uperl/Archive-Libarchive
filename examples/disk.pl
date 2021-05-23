use strict;
use warnings;
use 5.020;
use Archive::Libarchive qw( ARCHIVE_EXTRACT_TIME AE_IFREG );

my $dw = Archive::Libarchive::DiskWrite->new;
$dw->disk_set_options(ARCHIVE_EXTRACT_TIME);

my $text = "Hello World!\n";

my $e = Archive::Libarchive::Entry->new;
$e->set_pathname("hello.txt");
$e->set_filetype(AE_IFREG);
$e->set_size(length $text);
$e->set_mtime(time);
$e->set_mode(oct('0644'));

$dw->write_header($e);
$dw->write_data($text);
$dw->finish_entry;

