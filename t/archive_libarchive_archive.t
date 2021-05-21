use Test2::V0 -no_srand => 1;
use Archive::Libarchive::ArchiveRead;
use Archive::Libarchive::ArchiveWrite;
use 5.020;

subtest 'entry' => sub {

  foreach my $class (qw( Archive::Libarchive::ArchiveRead Archive::Libarchive::ArchiveWrite ))
  {
    my $ar = $class->new;
    isa_ok $ar, $class;
    my $e = $ar->entry;
    isa_ok $e, 'Archive::Libarchive::Entry';
  }

};

done_testing;


