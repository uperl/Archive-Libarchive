use Test2::V0 -no_srand => 1;
use 5.020;
use Path::Tiny qw( path );
use Archive::Libarchive::ArchiveRead;

subtest 'basic' => sub {

  my $r = Archive::Libarchive::ArchiveRead->new;
  isa_ok $r, 'Archive::Libarchive::ArchiveRead';

};

BEGIN {
  require Archive::Libarchive::Lib::Constants;
  foreach my $name (qw( ARCHIVE_OK ARCHIVE_EOF ))
  {
    no strict 'refs';
    *{$name} = \&{"Archive::Libarchive::$name"};
  }
}

subtest 'next_header' => sub {

  require Archive::Libarchive::Entry;

  my $r = Archive::Libarchive::ArchiveRead->new;
  is($r->support_format_tar, ARCHIVE_OK);

  my $e = Archive::Libarchive::Entry->new;
  is($r->open_filename("examples/archive.tar", 10240), ARCHIVE_OK);

  is($r->next_header($e), ARCHIVE_OK);
  is($e->pathname, 'archive/');
  is($r->data_skip, ARCHIVE_OK);

  is($r->next_header($e), ARCHIVE_OK);
  is($e->pathname, 'archive/bar.txt');
  is($r->data_skip, ARCHIVE_OK);

  is($r->next_header($e), ARCHIVE_OK);
  is($e->pathname, 'archive/foo.txt');
  is($r->data_skip, ARCHIVE_OK);

  is($r->next_header($e), ARCHIVE_EOF);
};

subtest 'open_memory' => sub {

  my $r = Archive::Libarchive::ArchiveRead->new;
  is($r->support_format_tar, ARCHIVE_OK);
  is($r->open_memory( \path("examples/archive.tar")->slurp_raw ), ARCHIVE_OK);

  my $e = Archive::Libarchive::Entry->new;
  is($r->next_header($e), ARCHIVE_OK);
  is($e->pathname, 'archive/');

};

done_testing;

