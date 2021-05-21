use Test2::V0 -no_srand => 1;
use 5.020;
use Path::Tiny qw( path );
use Archive::Libarchive::ArchiveRead;
use Test::Archive::Libarchive;

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
  la_ok $r, 'support_format_tar';

  my $e = Archive::Libarchive::Entry->new;
  la_ok $r, 'open_filename', ["examples/archive.tar", 10240];

  la_ok $r, 'next_header', [$e];
  is($e->pathname, 'archive/', '$entry->pathname');
  la_ok $r, 'data_skip';

  la_ok $r, 'next_header', [$e];
  is($e->pathname, 'archive/bar.txt', '$entry->pathname (2)');
  la_ok $r, 'data_skip';

  la_ok $r, 'next_header', [$e];
  is($e->pathname, 'archive/foo.txt', '$entry->pathname (2)');
  la_ok $r, 'data_skip';

  is($r->next_header($e), ARCHIVE_EOF);
};

subtest 'open_memory' => sub {

  my $r = Archive::Libarchive::ArchiveRead->new;
  la_ok $r, 'support_format_tar';
  la_ok $r, 'open_memory', [\path("examples/archive.tar")->slurp_raw];

  my $e = Archive::Libarchive::Entry->new;
  la_ok $r, 'next_header', [$e];
  is($e->pathname, 'archive/', '$entry->pathname');

};

done_testing;

