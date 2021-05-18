use Test2::V0 -no_srand => 1;
use 5.020;
use Archive::Libarchive::Read;

subtest 'basic' => sub {

  my $e = Archive::Libarchive::Read->new;
  isa_ok $e, 'Archive::Libarchive::Read';

};

done_testing;
