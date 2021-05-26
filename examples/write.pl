use strict;
use warnings;
use 5.020;
use experimental qw( signatures );
use Archive::Libarchive qw( AE_IFREG );
use Path::Tiny qw( path );

my $w = Archive::Libarchive::ArchiveWrite->new;
$w->set_format_pax_restricted;
$w->open_filename("outarchive.tar");

path('.')->visit(sub ($path, $) {
  return if $path->is_dir;

  my $e = Archive::Libarchive::Entry->new;
  $e->set_pathname("$path");
  $e->set_size(-s $path);
  $e->set_filetype(AE_IFREG);
  $e->set_perm( oct('0644') );
  $w->write_header($e);
  $w->write_data(\$path->slurp_raw);

}, { recurse => 1 });

$w->close;
