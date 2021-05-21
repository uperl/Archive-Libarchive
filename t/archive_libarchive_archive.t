use Test2::V0 -no_srand => 1;
use Archive::Libarchive::Read;
use Archive::Libarchive::Write;
use 5.020;

subtest 'entry' => sub {

  foreach my $class (qw( Archive::Libarchive::Read Archive::Libarchive::Write ))
  {
    my $ar = $class->new;
    isa_ok $ar, $class;
    my $e = $ar->entry;
    isa_ok $e, 'Archive::Libarchive::Entry';
  }

};

done_testing;


