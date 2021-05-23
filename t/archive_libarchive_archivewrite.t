use Test2::V0 -no_srand => 1;
use 5.020;
use Path::Tiny qw( path );
use Archive::Libarchive::ArchiveWrite;
use Test::Archive::Libarchive;
use experimental qw( signatures );
use Archive::Tar;
use File::chdir;
use File::Temp qw( tempdir );
use FFI::Platypus 1.00;

subtest 'basic' => sub {

  my $w = Archive::Libarchive::ArchiveWrite->new;
  isa_ok $w, 'Archive::Libarchive::ArchiveWrite';

};

subtest 'open / write' => sub {

  subtest 'open ok' => sub {

    my $w = Archive::Libarchive::ArchiveWrite->new;

    la_ok $w, 'open' => [ open => sub { return 0 }, write => sub { return 0; } ];

  };

  subtest 'open warn' => sub {

    my $w = Archive::Libarchive::ArchiveWrite->new;

    la_warn $w, 'open' => [ open => sub { return -20 }, write => sub { return 0; } ];

  };

  subtest 'close' => sub {

    my $w = Archive::Libarchive::ArchiveWrite->new;

    my $count = 0;

    la_ok $w, 'open' => [ write => sub { return 0 }, close => sub { $count++; return 0 } ];

    is $count, 0, 'not called yet';

    undef $w;

    is $count, 1, 'called now!';

  };

  subtest 'write' => sub {

    my $w = Archive::Libarchive::ArchiveWrite->new;

    my $image;

    la_ok $w, 'set_format_pax_restricted';

    la_ok $w, 'open' => [write => sub ($w, $buffer) {
      $image .= $buffer;
      return length $buffer;
    }];

    la_write_ok($w);
    la_readback_ok($image);

  };

};

subtest 'open_FILE' => sub {

  subtest 'object' => sub {
    skip_all 'test requires FFI::C::File'
      unless eval { require FFI::C::File; 1 };

    my $path = path( tempdir(CLEANUP=>1), 'archive.tar');
    my $fp = FFI::C::File->fopen("$path", "wb");

    my $w = Archive::Libarchive::ArchiveWrite->new;

    la_ok $w, 'set_format_pax_restricted';
    la_ok $w, 'open_FILE' => [$fp];

    la_write_ok($w);

    $fp->fclose;

    la_readback_ok($path->slurp_raw);
  };

  subtest 'opaque pointer' => sub {
    my $path = path( tempdir(CLEANUP=>1), 'archive.tar');

    my $ffi = FFI::Platypus->new( api => 1, lib => [undef] );
    my $fp = $ffi->function( fopen => ['string','string'] => 'opaque' )->call("$path", "wb");

    my $w = Archive::Libarchive::ArchiveWrite->new;

    la_ok $w, 'set_format_pax_restricted';
    la_ok $w, 'open_FILE' => [$fp];

    la_write_ok($w);

    $ffi->function( fclose => ['opaque'] => 'int' )->call($fp);

    la_readback_ok($path->slurp_raw);
  };

};

subtest 'open_memory' => sub {
  my $image;

  my $w = Archive::Libarchive::ArchiveWrite->new;
  la_ok $w, 'set_format_pax_restricted';
  la_ok $w, 'open_memory' => [\$image];

  la_write_ok($w);
  la_readback_ok($image);
};

subtest 'open_perlfile' => sub {

  my $path = path( tempdir(CLEANUP=>1), 'archive.tar');
  open my $fh, '>', "$path";

  my $w = Archive::Libarchive::ArchiveWrite->new;
  la_ok $w, 'set_format_pax_restricted';
  la_ok $w, 'open_perlfile' => [$fh];

  la_write_ok($w);
  la_readback_ok($path->slurp_raw);
};

sub la_write_ok ($w)
{
  my $ctx = context();

  require Archive::Libarchive::Entry;

  my $e = Archive::Libarchive::Entry->new;
  $e->set_pathname('archive_libarchive_archivewrite.t');
  $e->set_size(-s __FILE__);
  $e->set_filetype(oct('0100000'));
  $e->set_perm(oct('0644'));

  la_ok $w, 'write_header' => [$e];

  my $data = path(__FILE__)->slurp_raw;
  is( $w->write_data($data), length($data), '$archive->data(...)');

  la_ok $w, 'close';

  $ctx->release;
}

sub la_readback_ok ($image)
{
  my $ctx = context();

  my $data = path(__FILE__)->slurp_raw;

  local $CWD = tempdir( CLEANUP => 1 );
  path('test.tar')->spew_raw($image);

  my $tar = Archive::Tar->new;
  is(
    Archive::Tar->new,
    object {
      call [read => 'test.tar'] => 1;
      call_list get_files => array {
        item object {
          call name => 'archive_libarchive_archivewrite.t';
          call mode => oct('0644');
          call size => length $data;
          call has_content => T();
          call get_content => $data;
        };
        end;
      };
    },
    'extrat file with Archive::Tar',
  );

  $ctx->release;
}

done_testing;
