use Test2::V0 -no_srand => 1;
use 5.020;
use Archive::Libarchive::ArchiveWrite;

subtest 'basic' => sub {

  my $w = Archive::Libarchive::ArchiveWrite->new;
  isa_ok $w, 'Archive::Libarchive::ArchiveWrite';

};

done_testing;
