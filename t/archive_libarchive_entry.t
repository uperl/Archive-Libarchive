use Test2::V0 -no_srand => 1;
use 5.020;
use Archive::Libarchive::Entry;
use utf8;

subtest 'basic' => sub {

  my $e = Archive::Libarchive::Entry->new;
  isa_ok $e, 'Archive::Libarchive::Entry';

};

subtest 'utf-8' => sub {

  my $e = Archive::Libarchive::Entry->new;
  $e->set_pathname_utf8('Привет.txt');
  my $ret = $e->pathname_utf8;

  use Encode qw( decode );

  is($ret, 'Привет.txt');

};

done_testing;
