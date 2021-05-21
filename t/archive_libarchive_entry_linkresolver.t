use Test2::V0 -no_srand => 1;
use 5.020;
use Archive::Libarchive::Entry::LinkResolver;

subtest 'basic' => sub {

  my $e = Archive::Libarchive::Entry::LinkResolver->new;
  isa_ok $e, 'Archive::Libarchive::Entry::LinkResolver';

};

done_testing;
