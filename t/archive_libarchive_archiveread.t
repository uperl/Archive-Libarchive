use Test2::V0 -no_srand => 1;
use 5.020;
use Path::Tiny qw( path );
use Archive::Libarchive::ArchiveRead;
use Test::Archive::Libarchive;
use experimental qw( signatures );

subtest 'basic' => sub {

  my $r = Archive::Libarchive::ArchiveRead->new;
  isa_ok $r, 'Archive::Libarchive::ArchiveRead';

};

BEGIN {
  require Archive::Libarchive::Lib::Constants;
  foreach my $name (qw( ARCHIVE_OK ARCHIVE_EOF ))
  {
    no strict 'refs';
    *{$name} = \&{"Archive::Libarchive::$name"};
  }
}

subtest 'next_header' => sub {

  require Archive::Libarchive::Entry;

  my $r = Archive::Libarchive::ArchiveRead->new;
  la_ok $r, 'support_format_tar';

  my $e = Archive::Libarchive::Entry->new;
  la_ok $r, 'open_filename', ['examples/archive.tar', 10240];

  la_ok $r, 'next_header', [$e];
  is($e->pathname, 'archive/', '$entry->pathname');
  la_ok $r, 'read_data_skip';

  la_ok $r, 'next_header', [$e];
  is($e->pathname, 'archive/bar.txt', '$entry->pathname (2)');
  la_ok $r, 'read_data_skip';

  la_ok $r, 'next_header', [$e];
  is($e->pathname, 'archive/foo.txt', '$entry->pathname (2)');
  la_ok $r, 'read_data_skip';

  la_eof $r, 'next_header', [$e];
};

subtest 'open_memory' => sub {

  my $r = Archive::Libarchive::ArchiveRead->new;
  la_ok $r, 'support_format_tar';
  la_ok $r, 'open_memory', [\path('examples/archive.tar')->slurp_raw];
  la_archive_ok($r);

};

subtest 'open_filename' => sub {

  my $r = Archive::Libarchive::ArchiveRead->new;
  la_ok $r, 'support_format_tar';
  la_ok $r, 'open_filename', ['examples/archive.tar', 40];
  la_archive_ok($r);

};

subtest 'open_FILE' => sub {

  subtest 'object' => sub {
    skip_all 'test requires FFI::C::File'
      unless eval { require FFI::C::File; 1 };

    my $fp = FFI::C::File->fopen('examples/archive.tar', 'rb');

    my $r = Archive::Libarchive::ArchiveRead->new;
    la_ok $r, 'support_format_tar';
    la_ok $r, 'open_FILE', [$fp];
    la_archive_ok($r);

  };

  subtest 'opaque pointer' => sub {

    my $ffi = FFI::Platypus->new( api => 1, lib => [undef] );
    my $fp = $ffi->function( fopen => ['string','string'] => 'opaque' )->call('examples/archive.tar', 'rb');

    my $r = Archive::Libarchive::ArchiveRead->new;
    la_ok $r, 'support_format_tar';
    la_ok $r, 'open_FILE', [$fp];
    la_archive_ok($r);

  };


};

subtest 'open_perlfile' => sub {

  open my $fh, '<', 'examples/archive.tar';

  my $r = Archive::Libarchive::ArchiveRead->new;
  la_ok $r, 'support_format_tar';
  la_ok $r, 'open_perlfile', [$fh];
  la_archive_ok($r);

};


subtest 'read_data' => sub {

  my $r = Archive::Libarchive::ArchiveRead->new;
  la_ok $r, 'support_compression_all';
  la_ok $r, 'support_format_raw';
  la_ok $r, 'open_filename' => ['examples/hello.txt.uu', 10240];
  la_ok $r, 'next_header' => [Archive::Libarchive::Entry->new];

  my $image;

  while(1)
  {
    my $buffer;
    my $size = $r->read_data(\$buffer);
    if($size > 0)
    {
      $image .= $buffer;
    }
    elsif($size == 0)
    {
      last;
    }
    else
    {
      fail "error!";
    }
  }

  is $image, "Hello World!\n", 'content matches!';

};

subtest 'filter' => sub {

  subtest 'string' => sub {
    my $r = Archive::Libarchive::ArchiveRead->new;
    la_ok $r, append_filter => ['uu'];
    is( $r->filter_count, 1 );
    is( $r->filter_code(0), 'uu');
    is( $r->filter_code(0), number Archive::Libarchive::ARCHIVE_FILTER_UU() );
  };

  subtest 'int' => sub {
    my $r = Archive::Libarchive::ArchiveRead->new;
    la_ok $r, append_filter => [Archive::Libarchive::ARCHIVE_FILTER_UU()];
    is( $r->filter_count, 1 );
    is( $r->filter_code(0), 'uu');
    is( $r->filter_code(0), number Archive::Libarchive::ARCHIVE_FILTER_UU() );
  };

};

subtest 'format' => sub {

  subtest 'string' => sub {
    my $r = Archive::Libarchive::ArchiveRead->new;
    la_ok $r, set_format => ['tar_gnutar'];
    la_ok $r, open_filename => ['examples/archive.tar', 10240];
    la_ok $r, next_header => [Archive::Libarchive::Entry->new];
    is $r->format, 'tar_gnutar';
    is $r->format, number(Archive::Libarchive::ARCHIVE_FORMAT_TAR_GNUTAR());
  };

  subtest 'int' => sub {
    my $r = Archive::Libarchive::ArchiveRead->new;
    la_ok $r, set_format => [Archive::Libarchive::ARCHIVE_FORMAT_TAR_GNUTAR()];
    la_ok $r, open_filename => ['examples/archive.tar', 10240];
    la_ok $r, next_header => [Archive::Libarchive::Entry->new];
    is $r->format, 'tar_gnutar';
    is $r->format, number(Archive::Libarchive::ARCHIVE_FORMAT_TAR_GNUTAR());
  };

};

sub la_archive_ok ($r)
{
  my $e = Archive::Libarchive::Entry->new;
  la_ok $r, 'next_header', [$e];
  is($e->pathname, 'archive/', '$entry->pathname');

  la_ok $r, 'next_header', [$e];
  is($e->pathname, 'archive/bar.txt', '$entry->pathname');
  my $content = la_read_data_ok $r;
  is $content, "there\n", 'content matches';

  la_ok $r, 'next_header', [$e];
  is($e->pathname, 'archive/foo.txt', '$entry->pathname');
  $content = la_read_data_ok $r;
  is $content, "hello\n", 'content matches';

}

done_testing;
