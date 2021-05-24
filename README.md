# Archive::Libarchive ![linux](https://github.com/uperl/Archive-Libarchive/workflows/linux/badge.svg) ![macos](https://github.com/uperl/Archive-Libarchive/workflows/macos/badge.svg) ![windows](https://github.com/uperl/Archive-Libarchive/workflows/windows/badge.svg) ![cygwin](https://github.com/uperl/Archive-Libarchive/workflows/cygwin/badge.svg) ![msys2-mingw](https://github.com/uperl/Archive-Libarchive/workflows/msys2-mingw/badge.svg) ![ref](https://github.com/uperl/Archive-Libarchive/workflows/ref/badge.svg)

Modern Perl bindings to libarchive

# SYNOPSIS

```perl
use 5.020;
use Archive::Libarchive qw( :all );

my $r = Archive::Libarchive::ArchiveRead->new;
$r->support_filter_all;
$r->support_format_all;
$r->open_filename("archive.tar", 10240) == ARCHIVE_OK
  or die $r->error_string;

my $e = Archive::Libarchive::Entry->new;
say $e->pathname while $r->next_header($e) == ARCHIVE_OK;
```

# DESCRIPTION

This module provides a Perl object-oriented interface to the `libarchive` library.  The `libarchive`
library is the API used to implemnt `bsdtar`, the default tar implementation on a number of operating systems,
including FreeBSD, macOS and Windows.  It can also be installed on most Linux distributions.  But wait, there
is more, `libarchive` supports a number of formats, compressors and filters transparently, so it can be a useful
when used as a universal archiver/extractor.  Supported formats include:

- various tar formats, including the oldest forms and the newest extensions
- zip
- ISO 9660 (CD-ROM image format)
- gzip
- bzip2
- ... and many many more

This distribution is split up into several classes, that correspond to `libarchive` classes.  Probably the best
place to start when learning how to use this module is to look at the `/EXAMPLES` section below, but you
can also take a look at the main class documentation for the operation that you are interested in as well:

- [Archive](https://metacpan.org/pod/Archive::Libarchive::Archive) -> [Archive::Libarchive::ArchiveRead](https://metacpan.org/pod/Archive::Libarchive::ArchiveRead)
- [Archive](https://metacpan.org/pod/Archive::Libarchive::Archive) -> [Archive::Libarchive::ArchiveWrite](https://metacpan.org/pod/Archive::Libarchive::ArchiveWrite)
- [Archive](https://metacpan.org/pod/Archive::Libarchive::Archive) -> [ArchiveRead](https://metacpan.org/pod/Archive::Libarchive::ArchiveRead) -> [ArchiveRead](https://metacpan.org/pod/Archive::Libarchive::DiskRead)
- [Archive](https://metacpan.org/pod/Archive::Libarchive::Archive) -> [ArchiveWrite](https://metacpan.org/pod/Archive::Libarchive::ArchiveWrite) -> [ArchiveRead](https://metacpan.org/pod/Archive::Libarchive::DiskWrite)

This module attempts to provide comprehensive bindings to the `libarchive` library.  For more details on
the history and alternatives to this project see the ["HISTORY"](#history) section below.  All recent versions of
`libarchive` should be supported, although some methods are only available when you have the most recent
version of `libarchive` installed.  For methods not available on older versions please consult
[Archive::Libarchive::API](https://metacpan.org/pod/Archive::Libarchive::API), which will list these methods as `(optional)`.  If you need to support both
older versions of `libarchive` and exploit the newer methods on newer versions of `libarchive` you can use
the `can` method to check if they are available.  If you need the latest version of `libarchive`, and
your system provides an older version, then you can force a `share` install of [Alien::Libarchive3](https://metacpan.org/pod/Alien::Libarchive3):

```
env ALIEN_INSTALL_TYPE=share cpanm Alien::Libarchive3
```

# EXAMPLES

These examples are translated from the `libarchive` C examples, which can be found here:

- [https://github.com/libarchive/libarchive/wiki/Examples#List\_contents\_of\_Archive\_stored\_in\_File](https://github.com/libarchive/libarchive/wiki/Examples#List_contents_of_Archive_stored_in_File)

## List contents of archive stored in file

```perl
use 5.020;
use Archive::Libarchive qw( ARCHIVE_OK );

my $r = Archive::Libarchive::ArchiveRead->new;
$r->support_filter_all;
$r->support_format_all;

my $ret = $r->open_filename("archive.tar", 10240);
if($ret != ARCHIVE_OK) {
  exit 1;
}

my $e = Archive::Libarchive::Entry->new;
while($r->next_header($e) == ARCHIVE_OK) {
  say $e->pathname;
  $r->data_skip;
}
```

## List contents of archive stored in memory

```perl
use 5.020;
use Path::Tiny qw( path );
use Archive::Libarchive qw( ARCHIVE_OK );

my $r = Archive::Libarchive::ArchiveRead->new;
$r->support_filter_all;
$r->support_format_all;

my $buffer = path('archive.tar')->slurp_raw;

my $ret = $r->open_memory(\$buffer);
if($ret != ARCHIVE_OK) {
  exit 1;
}

my $e = Archive::Libarchive::Entry->new;
while($r->next_header($e) == ARCHIVE_OK) {
  say $e->pathname;
  $r->data_skip;
}
```

## List contents of archive with custom read functions

```perl
use 5.020;
use Archive::Libarchive;

my $r = Archive::Libarchive::ArchiveRead->new;
$r->support_compression_all;
$r->support_format_all;

my $fh;

=pod

$r->open(
  open => sub {
    open my $fh, '<', 'archive.tar';
  },
  read => sub {
    ...
  },
  close => sub {
    close $fh;
  },
);

my $e = Archive::Libarchive::Entry->new;
while($r->next_header($e) == ARCHIVE_OK)
{
  say $e->pathname;
}

=cut
```

## A universal decompressor / defilter-er

```perl
use 5.020;
use Archive::Libarchive;

my $r = Archive::Libarchive::ArchiveRead->new;
$r->support_compression_all;
$r->support_format_raw;
$r->open_filename("hello.txt.uu");
$r->next_header(Archive::Libarchive::Entry->new);

my $buffer;
while($r->read_data(\$buffer)) {
  print $buffer;
}

$r->close;
```

## A basic write example

```perl
use 5.020;
use experimental qw( signatures );
use Archive::Libarchive qw( AE_IFREG );
use Path::Tiny qw( path );

my $w = Archive::Libarchive::ArchiveWrite->new;
$w->set_format_pax_restricted;
$w->open_filename("outarchive.tar");

path('.')->visit(sub ($path, $) {
  return if $path->is_dir;

  my $e = Archive::Libarchive::Entry->new;
  $e->set_pathname("$path");
  $e->set_size(-s $path);
  $e->set_filetype(AE_IFREG);
  $e->set_perm( oct('0644') );
  $w->write_header($e);
  $w->write_data($path->slurp_raw);

}, { recurse => 1 });

$w->close;
```

## Constructing objects on disk

```perl
use 5.020;
use Archive::Libarchive qw( ARCHIVE_EXTRACT_TIME AE_IFREG );

my $dw = Archive::Libarchive::DiskWrite->new;
$dw->disk_set_options(ARCHIVE_EXTRACT_TIME);

my $text = "Hello World!\n";

my $e = Archive::Libarchive::Entry->new;
$e->set_pathname("hello.txt");
$e->set_filetype(AE_IFREG);
$e->set_size(length $text);
$e->set_mtime(time);
$e->set_mode(oct('0644'));

$dw->write_header($e);
$dw->write_data($text);
$dw->finish_entry;
```

## A complete extractor

```perl
use 5.020;
use Archive::Libarchive qw( :all );

my $tarball = 'archive.tar';

my $r = Archive::Libarchive::ArchiveRead->new;
$r->support_format_all;
$r->support_compression_all;

my $dw = Archive::Libarchive::DiskWrite->new;
$dw->disk_set_options(
  ARCHIVE_EXTRACT_TIME | ARCHIVE_EXTRACT_PERM | ARCHIVE_EXTRACT_ACL | ARCHIVE_EXTRACT_FFLAGS
);
$dw->disk_set_standard_lookup;

$r->open_filename($tarball) == ARCHIVE_OK
  or die "unable to open $tarball @{[ $r->error_string ]}";

my $e = Archive::Libarchive::Entry->new;
while(1) {
  my $ret = $r->next_header($e);
  last if $ret == ARCHIVE_EOF;
  if($ret < ARCHIVE_OK) {
    if($ret < ARCHIVE_WARN) {
      die "header read error on $tarball @{[ $r->error_string ]}";
    } else {
      warn "header read warning on $tarball @{[ $r->error_string ]}";
    }
  }

  $ret = $dw->write_header($e);
  if($ret < ARCHIVE_OK) {
    if($ret < ARCHIVE_WARN) {
      die "header write error on disk @{[ $dw->error_string ]}";
    } else {
      warn "header write warning disk @{[ $dw->error_string ]}";
    }
  }

  if($e->size > 0)
  {
    my $buffer;
    while(1) {

      $ret = $r->read_data(\$buffer);
      last if $ret == 0;
      if($ret < ARCHIVE_OK) {
        if($ret < ARCHIVE_WARN) {
          die "file read error on member @{[ $e->pathname ]} @{[ $r->error_string ]}";
        } else {
          warn "file read warning on member @{[ $e->pathname ]} @{[ $r->error_string ]}";
        }
      }

      $ret = $dw->write_data($buffer);
      if($ret < ARCHIVE_OK) {
        if($ret < ARCHIVE_WARN) {
          die "file write error on member @{[ $e->pathname ]} @{[ $dw->error_string ]}";
        } else {
          warn "file write warning on member @{[ $e->pathname ]} @{[ $dw->error_string ]}";
        }
      }
    }
  }

  $dw->finish_entry;
  if($ret < ARCHIVE_OK) {
    if($ret < ARCHIVE_WARN) {
      die "finish error on disk @{[ $dw->error_string ]}";
    } else {
      warn "finish warning disk @{[ $dw->error_string ]}";
    }
  }
}

$r->close;
$dw->close;
```

# CONSTANTS

This module provides all of the constants used by `libarchive`.  These typically
are prefixed either `ARCHIVE_` or `AE_` and can be imported into your code
individually, or _en masse_ using the `:const` export tag.  The will also be imported
if you use the `:all` export tag to import everything.\]

The complete list of available constants is listed in
[Archive::Libarchive::API](https://metacpan.org/pod/Archive::Libarchive::API).

The most common constants are the return of status codes from most functions:

- `ARCHIVE_EOF`

    is returned only from
    [read\_data](https://metacpan.org/pod/Archive::Libarchive::ArchiveRead#read_data) and
    [read\_data\_block](https://metacpan.org/pod/Archive::Libarchive::ArchiveRead#read_data_block) from the
    [Archive::Libarchive::ArchiveRead](https://metacpan.org/pod/Archive::Libarchive::ArchiveRead) class when you reach the end of a structure.

- `ARCHIVE_OK`

    The operation completed successfully.

- `ARCHIVE_WARN`

    If the operation completed with some surprises. You may want to report the issue to your user.
    The [error\_string](https://metacpan.org/pod/Archive::Libarchive::Archive#error_string) method on most classes will return
    a suitable text message; the
    [errno](https://metacpan.org/pod/Archive::Libarchive::Archive#errno) method on most classes returns an associated system
    `errno` value. (Since not all errors are caused by failing system calls, this is not always
    meaningful).

- `ARCHIVE_FAILED`

    If this operation failed. In particular, this means that further operations on this entry are
    impossible. This is returned, for example, if you try to write an entry type that's not supported
    by this archive format. Recovery usually consists of simply going on to the next entry.

- `ARCHIVE_FATAL`

    If the archive object itself is no longer usable, typically because of an I/O failure or memory
    allocation failure.

# HISTORY

TODO

# SEE ALSO

- [Archive::Libarchive::API](https://metacpan.org/pod/Archive::Libarchive::API)

    This contains the full and complete API for all of the [Archive::Libarchive](https://metacpan.org/pod/Archive::Libarchive)
    classes.  Because `libarchive` has hundreds of methods, the main documentation
    pages elsewhere only contain enough to be useful, and not to overwhelm.

- [Archive::Libarchive::Archive](https://metacpan.org/pod/Archive::Libarchive::Archive)

    The base class of all archive classes.  This includes some common error
    reporting functionality among other things.

- [Archive::Libarchive::ArchiveRead](https://metacpan.org/pod/Archive::Libarchive::ArchiveRead)

    This class is used for reading from archives.

- [Archive::Libarchive::ArchiveWrite](https://metacpan.org/pod/Archive::Libarchive::ArchiveWrite)

    This class is for creating new archives.

- [Archive::Libarchive::DiskRead](https://metacpan.org/pod/Archive::Libarchive::DiskRead)

    This class is for reading [Archive::Libarchive::Entry](https://metacpan.org/pod/Archive::Libarchive::Entry) objects from disk
    so that they can be written to [Archive::Libarchive::ArchiveWrite](https://metacpan.org/pod/Archive::Libarchive::ArchiveWrite) objects.

- [Archive::Libarchive::DiskWrite](https://metacpan.org/pod/Archive::Libarchive::DiskWrite)

    This class is for writing [Archive::Libarchive::Entry](https://metacpan.org/pod/Archive::Libarchive::Entry) objects to disk
    that have been written from [Archive::Libarchive::ArchiveRead](https://metacpan.org/pod/Archive::Libarchive::ArchiveRead) objects.

- [Archive::Libarchive::Entry](https://metacpan.org/pod/Archive::Libarchive::Entry)

    This class represents a file in an archive, or on disk.

- [Archive::Libarchive::EntryLinkResolver](https://metacpan.org/pod/Archive::Libarchive::EntryLinkResolver)

    This class exposes the `libarchive` link resolver API.

- [Archive::Libarchive::Match](https://metacpan.org/pod/Archive::Libarchive::Match)

    This class exposes the `libarchive` match API.

- [Alien::Libarchive3](https://metacpan.org/pod/Alien::Libarchive3)

    If a suitable system `libarchive` can't be found, then this
    [Alien](https://metacpan.org/pod/Alien) will be installed to provide it.

- [libarchive.org](http://libarchive.org/)

    The `libarchive` project home page.

- [https://github.com/libarchive/libarchive/wiki](https://github.com/libarchive/libarchive/wiki)

    The `libarchive` project wiki.

- [https://github.com/libarchive/libarchive/wiki/ManualPages](https://github.com/libarchive/libarchive/wiki/ManualPages)

    Some of the `libarchive` man pages are listed here.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2021 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
