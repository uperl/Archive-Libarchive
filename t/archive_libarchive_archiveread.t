use Test2::V0 -no_srand => 1;
use 5.020;
use Archive::Libarchive::ArchiveRead;

subtest 'basic' => sub {

  my $r = Archive::Libarchive::ArchiveRead->new;
  isa_ok $r, 'Archive::Libarchive::ArchiveRead';

};

done_testing;
