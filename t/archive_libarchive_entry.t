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

subtest 'filetype' => sub {

  my $reg_int = oct('100000');

  subtest 'set with string' => sub {

    my $e = Archive::Libarchive::Entry->new;
    $e->set_filetype('reg');

    is($e->filetype, 'reg');
    is($e->filetype, number $reg_int);

  };

  subtest 'set with string' => sub {

    my $e = Archive::Libarchive::Entry->new;
    $e->set_filetype($reg_int);

    is($e->filetype, 'reg');
    is($e->filetype, number $reg_int);

  };

};

subtest 'xattr' => sub {

  my $e = Archive::Libarchive::Entry->new;
  $e->xattr_add_entry( foo => "bar\0baz" );

  my($name, $value);

  is($e->xattr_reset, 1);

  is $e->xattr_next(\$name, \$value), 0;
  is($name, "foo" );
  is($value, "bar\0baz" );

  is $e->xattr_next(\$name, \$value), -20;
  is($name,  undef);
  is($value, undef );

};

subtest 'stat' => sub {

  require FFI::C::Stat;

  my $e = Archive::Libarchive::Entry->new;
  my $cstat = FFI::C::Stat->new(__FILE__);

  $e->copy_stat($cstat);
  is( $e->size, $cstat->size );

  my $cstat2 = $e->stat;
  is( $cstat2->size, $cstat->size );

};

done_testing;
