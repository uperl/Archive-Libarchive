use Test2::V0 -no_srand => 1;
use 5.020;
use Archive::Libarchive::Read;

subtest 'basic' => sub {

  my $r = Archive::Libarchive::Read->new;
  isa_ok $r, 'Archive::Libarchive::Read';

};

done_testing;
