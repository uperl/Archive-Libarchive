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
- uuencoded files
- shell archive (shar)
- ... and many many more

This distribution is split up into several classes, that correspond to `libarchive` classes.  Probably the best
place to start when learning how to use this module is to look at the ["EXAMPLES"](#examples) section below, but you
can also take a look at the main class documentation for the operation that you are interested in as well:

- [Archive](https://metacpan.org/pod/Archive::Libarchive::Archive) => [Archive::Libarchive::ArchiveRead](https://metacpan.org/pod/Archive::Libarchive::ArchiveRead)

    Class for reading from archives.

- [Archive](https://metacpan.org/pod/Archive::Libarchive::Archive) => [Archive::Libarchive::ArchiveWrite](https://metacpan.org/pod/Archive::Libarchive::ArchiveWrite)

    Class for creating new archives.

- [Archive](https://metacpan.org/pod/Archive::Libarchive::Archive) => [ArchiveRead](https://metacpan.org/pod/Archive::Libarchive::ArchiveRead) => [Archive::Libarchive::DiskRead](https://metacpan.org/pod/Archive::Libarchive::DiskRead)

    Class for reading file entries from a local filesystem.

- [Archive](https://metacpan.org/pod/Archive::Libarchive::Archive) => [ArchiveWrite](https://metacpan.org/pod/Archive::Libarchive::ArchiveWrite) => [Archive::Libarchive::DiskWrite](https://metacpan.org/pod/Archive::Libarchive::DiskWrite)

    Class for writing file entries to a local filesystem.

- [Archive::Libarchive::Entry](https://metacpan.org/pod/Archive::Libarchive::Entry)

    Class representing file meta data of a file inside an archive, or in the local filesystem.

- [Archive::Libarchive::EntryLinkResolver](https://metacpan.org/pod/Archive::Libarchive::EntryLinkResolver)

    This is the `libarchive` link resolver API.

- [Archive](https://metacpan.org/pod/Archive::Libarchive::Archive) =>  [Archive::Libarchive::Match](https://metacpan.org/pod/Archive::Libarchive::Match)

    This is the `libarchive` match API.

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

# FUNCTIONS

The main functionality of this module is implemented in the classes listed above, but this module does
also provide a few top level non-object-oriented functions as well.  These methods are not exported
by default, but they can be requested using the usual [Exporter](https://metacpan.org/pod/Exporter) interface, either individually, or
with the `:func` or `:all` tags (The latter will also import constants).

## archive\_bzlib\_version

```perl
# archive_bzlib_version
my $string = archive_bzlib_version();
```

The `bzlib` version that `libarchive` was built with.  This will return `undef` if the library was
not found at build time.

## archive\_liblz4\_version

```perl
# archive_liblz4_version
my $string = archive_liblz4_version();
```

The `liblz4` version that `libarchive` was built with.  This will return `undef` if the library was
not found at build time.

## archive\_liblzma\_version

```perl
# archive_liblzma_version
my $string = archive_liblzma_version();
```

The `liblzma` version that `libarchive` was built with.  This will return `undef` if the library was
not found at build time.

## archive\_libzstd\_version

```perl
# archive_libzstd_version (optional)
my $string = archive_libzstd_version();
```

The `zstd` version that `libarchive` was built with.  This will return `undef` if the library was
not found at build time.

## archive\_version\_details

```perl
# archive_version_details
my $string = archive_version_details();
```

Detailed textual name/version of the library and its dependencies. This has the form:

- `libarchive x.y.z zlib/a.b.c liblzma/d.e.f ... etc ...`

the list of libraries described here will vary depending on how libarchive was compiled.

## archive\_version\_number

```perl
# archive_version_number
my $int = archive_version_number();
```

The `libarchive` version expressed as an integer.  This will be the major, minor and patch
levels each using up to three digits, so 3.5.1 will be `3005001`.

## archive\_version\_string

```perl
# archive_version_string
my $string = archive_version_string();
```

The `libarchive` version as a string.

## archive\_zlib\_version

```perl
# archive_zlib_version
my $string = archive_zlib_version();
```

The `zlib` version that `libarchive` was built with.  This will return `undef` if the library was
not found at build time.

## versions

```perl
my %versions = Archive::Libarchive->versions();
```

This returns a hash of `libarchive` and [Archive::Libarchive](https://metacpan.org/pod/Archive::Libarchive) versions and dependency versions.  This
may be useful in a test report diagnostic.

# EXAMPLES

These examples are translated from the `libarchive` C examples, which can be found here:

- [https://github.com/libarchive/libarchive/wiki/Examples#List\_contents\_of\_Archive\_stored\_in\_File](https://github.com/libarchive/libarchive/wiki/Examples#List_contents_of_Archive_stored_in_File)

## List contents of archive stored in file

The main [Archive::Libarchive](https://metacpan.org/pod/Archive::Libarchive) API is based around two basic type of classes.  The [Archive::Libarchive::Archive](https://metacpan.org/pod/Archive::Libarchive::Archive)
class serves as a basis for all archive objects.  The [Archive::Libarchive::Entry](https://metacpan.org/pod/Archive::Libarchive::Entry) represents the header or meta data
for files stored inside an archive (or as we will see later, files on disk).

The basic life cycle of an archive instance is:

- Create one using its `new` constructor

    The constructor does not take any arguments, instead you will configure it in the
    next step.

- Configure it using "support" or "set" calls

    Support calls allow [Archive::Libarchive](https://metacpan.org/pod/Archive::Libarchive) to decide when to use a feature; "set" calls
    enable the feature unconditionally.

- "Open" a particular data source

    This can be using callbacks for a custom source, or one of the pre-canned data sources supported directly by
    [Archive::Libarchive](https://metacpan.org/pod/Archive::Libarchive).

- Iterate over the contents

    Ask alternatively for "header" or entry/file meta data (which is represented by a [Archive::Libarchive::Entry](https://metacpan.org/pod/Archive::Libarchive::Entry) instance),
    and entry/file content.

- Finish by calling "close"

    This will be called automatically if the archive instance falls out of scope.

Writing an archive is very similar, except that you provide the "header" and content data to [Archive::Libarchive](https://metacpan.org/pod/Archive::Libarchive) instead
of asking for them.

Here is a very basic example that simply opens a file and lists the contents of the archive.

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
  $r->read_data_skip;
}
```

Note that [open\_filename](https://metacpan.org/pod/Archive::Libarchive::ArchiveRead#open_filename) method inspects the file before deciding
how to handle the block size.  If the filename provided refers to a tape device, for example, it will use exactly
the block size you specify.  For other devices, it may adjust the requested block size in order to obtain better
performance.

Note that the call to [read\_data\_skip](https://metacpan.org/pod/Archive::Libarchive::API#read_data_skip) here is not actually necessary, since
[Archive::Libarchive](https://metacpan.org/pod/Archive::Libarchive) will invoke it automatically if you request the next header without reading the data for the
last entry.

## List contents of archive stored in memory

There are several variants of the open methods.  The "filename" variant used above is intended to be simple
to use in the common case of reading from a file from disk, but you may find the "memory" variant useful in other
cases.

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
  $r->read_data_skip;
}
```

There are also variants to read from an already-opened file descriptor, a `libc` `FILE` pointer, or a Perl
file handle.

## List contents of archive with custom read functions

Sometimes, none of the packaged open methods will work for you.  In that case, you can use the lower-level `open`
method, which accepts a number of callbacks.  For this example we will use the `open`, `read` and `close`
callbacks.

```perl
use 5.020;
use Archive::Libarchive qw( :const );

my $r = Archive::Libarchive::ArchiveRead->new;
$r->support_compression_all;
$r->support_format_all;

my $fh;

$r->open(
  open => sub {
    open $fh, '<', 'archive.tar';
    binmode $fh;
    return ARCHIVE_OK;
  },
  read => sub {
    my(undef, $ref) = @_;
    my $size = read $fh, $$ref, 512;
    return $size;
  },
  close => sub {
    close $fh;
    return ARCHIVE_OK;
  },
) == ARCHIVE_OK or die $r->error_string;

my $e = Archive::Libarchive::Entry->new;
while(1) {
  my $ret = $r->next_header($e);
  last if $ret == ARCHIVE_EOF;
  die $r->error_string if $ret < ARCHIVE_WARN;
  warn $r->error_string if $ret != ARCHIVE_OK;
  say $e->pathname;
}

$r->close;
```

For full power of read callbacks see the [open method's documentation](https://metacpan.org/pod/Archive::Libarchive::ArchiveRead#open).

When writing to an archive the [Archive::Libarchive::ArchiveWrite](https://metacpan.org/pod/Archive::Libarchive::ArchiveWrite) class also has its own
[open method and callbacks](https://metacpan.org/pod/Archive::Libarchive::ArchiveWrite#open).

## A universal decompressor / defilter-er

The "raw" format handler treats arbitrary binary input as a single-element archive.  This allows you to get the
output of a libarchive filter chain, including files with multiple encodings, such as `gz.uu` files:

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

Note that the "raw" format is not enabled by the
[support\_format\_all method on Archive::Libarchive::ArchiveRead](https://metacpan.org/pod/Archive::Libarchive::API#support_format_all).
Also note that the "raw" format handler does not recognize or accept empty files.  If you specifically want to be
able to read empty files, you'll need to also invoke the
[support\_format\_empty method on Archive::Libarchive::ArchiveRead](https://metacpan.org/pod/Archive::Libarchive::API#support_format_empty).

## A basic write example

The following is a very simple example of using [Archive::Libarchive](https://metacpan.org/pod/Archive::Libarchive) to write a group of files into a tar archive.
This is a little more complex than the read examples above because the write example actually does something with
the file bodies.

```perl
use 5.020;
use experimental qw( signatures );
use Archive::Libarchive;
use Path::Tiny qw( path );

my $w = Archive::Libarchive::ArchiveWrite->new;
$w->set_format_pax_restricted;
$w->open_filename("outarchive.tar");

path('.')->visit(sub ($path, $) {
  return if $path->is_dir;

  my $e = Archive::Libarchive::Entry->new;
  $e->set_pathname("$path");
  $e->set_size(-s $path);
  $e->set_filetype('reg');
  $e->set_perm( oct('0644') );
  $w->write_header($e);
  $w->write_data(\$path->slurp_raw);

}, { recurse => 1 });

$w->close;
```

Note that:

- filetype

    The filetype methods take either a string code, or an integer constant with the `AE_IF` prefix.  When returning
    a filetype code, they will return a dualvar with both.  The code `reg` / `AE_IFREG` is the code for a regular
    file (not a directory, symlink or other special filetype).

- gzip

    If you wanted to write a gzipped tar archive, you would just add a call to the
    [add\_filter\_gzip method on Archive::Libarchive::ArchiveRead](https://metacpan.org/pod/Archive::Libarchive::API#add_filter_gzip), and
    append `.gz` to the output filename.

- pax restricted

    The "pax restricted" format is a tar format that uses pax extensions only when absolutely necessary.  Most of
    the time, it will write plain ustar entries.  This is recommended tar format for most uses.  You should explicitly
    use ustar format only when you have to create archives that will be readable on older systems; you should explicitly
    request pax format only when you need to preserve as many attributes as possible.

- reusing entry instance

    This example creates a fresh [Archive::Libarchive::Entry](https://metacpan.org/pod/Archive::Libarchive::Entry) instance for each file.  For better performance, you
    can reuse the same entry instance by using the
    [clear method](https://metacpan.org/pod/Archive::Libarchive::API#clear) to erase it after each use.

- required properties

    Size, file type and pathname are all required properties here.  You can also use the
    [copy\_stat method](https://metacpan.org/pod/Archive::Libarchive::API#copy_stat) to copy all information from file to the archive entry,
    including file type.  To get even more complete information, look at the [Archive::Libarchive::DiskRead](https://metacpan.org/pod/Archive::Libarchive::DiskRead) class,
    which provides an easy way to get more extensive file meta data―including ACLs and extended attributes on
    some systems―than using `stat`.  It also works on platforms such as Windows where `stat` either doesn't
    exist or is broken.

- calling close

    The close method will be called implicitly when the archive instance falls out of scope.  However, the close call
    returns an error code, which may be useful for catching errors.

## Constructing objects on disk

[Archive::Libarchive](https://metacpan.org/pod/Archive::Libarchive) includes a [Archive::Libarchive::DiskWrite](https://metacpan.org/pod/Archive::Libarchive::DiskWrite) class that works very much like
[Archive::Libarchive::ArchiveWrite](https://metacpan.org/pod/Archive::Libarchive::ArchiveWrite), except that it constructs objects on disk, instead of adding
them to an archive.  This class knows how to construct directories, regular files, symlinks, hard links
and other types of disk objects.  Here is a very simple example showing how you could use it
to create a regular file on disk:

```perl
use 5.020;
use Archive::Libarchive qw( ARCHIVE_EXTRACT_TIME );

my $dw = Archive::Libarchive::DiskWrite->new;
$dw->disk_set_options(ARCHIVE_EXTRACT_TIME);

my $text = "Hello World!\n";

my $e = Archive::Libarchive::Entry->new;
$e->set_pathname("hello.txt");
$e->set_filetype('reg');
$e->set_size(length $text);
$e->set_mtime(time);
$e->set_mode(oct('0644'));

$dw->write_header($e);
$dw->write_data(\$text);
$dw->finish_entry;
```

Note that if you set a size in the entry instance, [Archive::Libarchive::DiskWrite](https://metacpan.org/pod/Archive::Libarchive::DiskWrite) will enforce that size.
If you try to write more than the size set in the entry content, your writes will be truncated; if you write
fewer bytes than you promised, the file will be extended with zero bytes.

The pattern above can also be used to reconstruct directories, device nodes, and FIFOs. The same idea also works
for restoring symlinks and hardlinks, but you do have to initialize the entry a little differently:

- symlinks

    Symlinks have a file type `lnk` / `AE_IFLNK` and require a target to be set with the
    [set\_symlink method](https://metacpan.org/pod/Archive::Libarchive::API#set_symlink).

- hardlinks

    Hardlinks require a target to be set with
    [the set\_hardlink method](https://metacpan.org/pod/Archive::Libarchive::API#set_hardlink); if this is set, the regular filetype is ignored.
    If the entry describing a hardlink has a size, you must be prepared to write data to the linked files. If you don't
    want to overwrite the file, leave the size unset.

## A complete extractor

Using the facilities described above, you can extract most archives to disk by simply copying entries from an
[Archive::Libarchive::ArchiveRead](https://metacpan.org/pod/Archive::Libarchive::ArchiveRead) instance to an [Archive::Libarchive::DiskWrite](https://metacpan.org/pod/Archive::Libarchive::DiskWrite) instance.

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

      $ret = $dw->write_data(\$buffer);
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

You could create an archive by going the other way by copying entries from an
[Archive::Libarchive::DiskRead](https://metacpan.org/pod/Archive::Libarchive::DiskRead) instance to an [Archive::Libarchive::ArchiveWrite](https://metacpan.org/pod/Archive::Libarchive::ArchiveWrite) instance.

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

I started working with `libarchive` in order to experiment with FFI.  To that end I implemented bindings
for `libarchive` using both [XS](https://metacpan.org/pod/Archive::Libarchive::XS) and [FFI](https://metacpan.org/pod/Archive::Libarchive::FFI) to compare
and contrast the process.  It was the basis for my first YAPC::NA talk back in 2014.

- [Foreign Function Interface (FFI) : Never Need to Write XS Again!](https://www.youtube.com/watch?v=cY-yqQ_nmtw)

When I was working on the XS and FFI implementations I recognized that some degree of automation would be
required, mainly because the `libarchive` is a C API of hundreds of methods, and new methods are being
added all the time.  I also wanted both implementations to use the same test suite, since their interfaces
should be identical.  While this work was useful, and I even ended up using both versions in production at
a previous `$work`, the tools that I chose to automate managing the large number of methods, and the common
test suite made both modules quite difficult to maintain.

I think also the interface that I chose was wrong.  I opted to provide a very thin layer over `libarchive`,
to avoid as much object-oriented overhead as possible.  I intended to one day make an object-oriented
layer over this thin layer to make it easier to use, but I never found the time to do this.  I think a better
approach would have been to bite the bullet provide only an object-oriented interface, because the ease of
using a library that automatically free's its pointers when an object falls out of scope is worth the
performance penalty of object oriented invocation.

I did, however, learn a lot about XS and FFI, and I started to think about what would make FFI easier in Perl.
At the time the only viable FFI on cpan was [FFI::Raw](https://metacpan.org/pod/FFI::Raw), and I contributed a number of enhancements and
fixes to that project, and even got it working on Strawberry Perl.  But I was starting to crave a better
experience writing FFI bindings in Perl.

BULK88 was in the audience for a DC / Baltimore version of my _Never Need to Write XS_ talk and he pointed
me to a feature in XS that would make FFI calls much faster than what was possible in [FFI::Raw](https://metacpan.org/pod/FFI::Raw).  Using
the `any_ptr` it is possible to remove method calls from an FFI interface, which, due to their dynamic
nature.

I was loosing faith in [FFI::Raw](https://metacpan.org/pod/FFI::Raw) being tenable or performant for large APIs, so I I gathered up my ideas
of what would make a better FFI experience in Perl and the `any_ptr` feature that Bulk had shown me and
I started working on a prototype FFI library.  I gave a talk at the Pittsburgh workshop based on the
work of that prototype.

- [FFI Performance](https://www.youtube.com/watch?v=uq2mgTOtbhM)

I didn't release that prototype, because I kept hoping that FFI would catch fire and someone else
would write a killer FFI for Perl.  Since it didn't seem to be happening I re-worked my prototype
into what eventually became [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus).  I wrote lots of bindings for Perl using Platypus,
and I always had the idea that I would circle back to my FFI bindings for `libarchive`
([Archive::Libarchive::FFI](https://metacpan.org/pod/Archive::Libarchive::FFI)) and rework it using Platypus instead of [FFI::Raw](https://metacpan.org/pod/FFI::Raw).  The problem is
that the project has since atrophied, and the problems with the dual module and automation
tools that I chose made this not really a viable enterprise.

I next thing that FFI needs in Perl is some good tools to introspect C and generate bindings automatically.
There are lots of challenges in this area.  One being that exactly what a function signature (assuming
you can even introspect that) can be ambiguous.  For example a `char` could either be a 8 bit integer value
(it could even be signed or unsigned depending on architecture) or it could be a single character.
A pointer `int *` could actually be used by the callee as an array.  There are lots of things that are
unsafe about C, and a ton of corner cases because of the way the C pre-processor works, but if we can
surmount these challenges then it would be very useful, because even when two different non-C languages are
trying to talk to each other, they are usually using the C ABI to do it.  This sort of drives me crazy
but it is the way the world works, at least today.

I've been working on some low-level tools that I'm hoping we can build on to do some of this introspection.
[Const::Introspect::C](https://metacpan.org/pod/Const::Introspect::C) is able to extract `#define` constants from a C header file, and [Clang::CastXML](https://metacpan.org/pod/Clang::CastXML)
uses the `castxml` project to extract a model of the functions and `strct`s in a C header file.  I'm hoping
with a middle layer these modules could be used to write a `h2ffi` tool similar to [h2xs](https://metacpan.org/pod/h2xs).  I've had
a number of false starts writing this middle layer: so I've decided to write some custom introspection
with `libarchive`, which is a very FFI-friendly library, and one that I am familiar with, but that also
has some interesting challenges and edge cases.  I'm hoping this work will help design a more general middle
layer that will be usable for other libraries.

At the same time, I've decided to fix some of the design flaws of my original XS and FFI implementations.
There really isn't a good way of doing this with the original implementations so I'm deprecating them in
favor of this one.  I feel confident that the overall experience of using this library should be much
better than using one of the older ones.  I also think this one will be more easily maintainable, because
I am using `castxml`, and I've created a reference build of `libarchive` using docker, which should
ensure that the code generation is done consistently.

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
