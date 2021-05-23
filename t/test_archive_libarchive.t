use Test2::V0 -no_srand => 1;
use Test::Archive::Libarchive;
use 5.020;
use experimental qw( signatures );

foreach my $name (qw( ok eof warn failed fatal ))
{
  my $count = 0;
  my $ret = $Test::Archive::Libarchive::code{$name};
  my @args;

  my $mock = mock 'Archive::Libarchive::Archive' => (
    add => [
      foo => sub { $count++; @args = @_; return $ret },
    ],
  );

  my $ar = Archive::Libarchive::Archive->new;

  local *la_something = \&{"la_$name"};

  la_something($ar, 'foo');
  is [$count, @args], [1, $ar], 'called correctly';

  la_something($ar, 'foo' => [1,2,3]);
  is [$count, @args], [2, $ar, 1,2,3], 'called correctly';

  is
    intercept { la_something($ar, 'bar') },
    array {
      event Fail => sub {};
      etc;
    },
    'missing method'
  ;

  $ret = 22;

  is
    intercept { la_something($ar, 'foo') },
    array {
      event Fail => sub {};
      etc;
    },
    'bad return'
  ;
  is [$count, @args], [3, $ar], 'called correctly';

  is
    intercept { la_something($ar, 'foo', [5, 6, 7]) },
    array {
      event Fail => sub {};
      etc;
    },
    'bad return'
  ;
  is [$count, @args], [4, $ar, 5, 6, 7], 'called correctly';

}

package Archive::Libarchive::Archive {
  sub new ($class) {
    bless {}, $class;
  }
}

done_testing;
