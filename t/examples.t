use Test2::V0 -no_srand => 1;
use Test::Script 1.09;
use File::chdir;
use File::Spec;

@INC = map { File::Spec->rel2abs($_) } @INC;

{
  local $CWD = 'examples';

  opendir my $dir, '.';
  my @examples = sort grep /\.pl$/, readdir $dir;
  closedir $dir;

  foreach my $example (@examples)
  {
    script_compiles("$example");
    my $stdout = '';
    my $stderr = '';
    script_runs("$example", { stdout => \$stdout, stderr => \$stderr } );
    note "[out]\n$stdout" if $stdout ne '';
    note "[err]\n$stderr" if $stderr ne '';
  }
}

done_testing;
