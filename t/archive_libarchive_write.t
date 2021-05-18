use Test2::V0 -no_srand => 1;
use 5.020;
use Archive::Libarchive::Write;

subtest 'basic' => sub {

  my $w = Archive::Libarchive::Write->new;
  isa_ok $w, 'Archive::Libarchive::Write';

};

done_testing;
