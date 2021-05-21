use Test2::V0 -no_srand => 1;
use 5.020;
use Archive::Libarchive::ArchiveMatch;

subtest 'basic' => sub {

  my $w = Archive::Libarchive::ArchiveMatch->new;
  isa_ok $w, 'Archive::Libarchive::ArchiveMatch';

};

done_testing;
