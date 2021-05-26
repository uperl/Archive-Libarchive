package Archive::Libarchive;

use strict;
use warnings;
use 5.020;
use experimental qw( signatures );
use Archive::Libarchive::Lib;
use Archive::Libarchive::ArchiveRead;
use Archive::Libarchive::ArchiveWrite;
use Archive::Libarchive::Match;
use Archive::Libarchive::DiskRead;
use Archive::Libarchive::DiskWrite;
use Archive::Libarchive::Entry;
use Archive::Libarchive::EntryLinkResolver;
use parent qw( Exporter );

# ABSTRACT: Modern Perl bindings to libarchive
# VERSION

=head1 SYNOPSIS

# EXAMPLE: examples/synopsis/synopsis.pl

=head1 DESCRIPTION

This module provides a Perl object-oriented interface to the C<libarchive> library.  The C<libarchive>
library is the API used to implemnt C<bsdtar>, the default tar implementation on a number of operating systems,
including FreeBSD, macOS and Windows.  It can also be installed on most Linux distributions.  But wait, there
is more, C<libarchive> supports a number of formats, compressors and filters transparently, so it can be a useful
when used as a universal archiver/extractor.  Supported formats include:

=over 4

=item various tar formats, including the oldest forms and the newest extensions

=item zip

=item ISO 9660 (CD-ROM image format)

=item gzip

=item bzip2

=item uuencoded files

=item shell archive (shar)

=item ... and many many more

=back

This distribution is split up into several classes, that correspond to C<libarchive> classes.  Probably the best
place to start when learning how to use this module is to look at the L</EXAMPLES> section below, but you
can also take a look at the main class documentation for the operation that you are interested in as well:

=over 4

=item L<Archive|Archive::Libarchive::Archive> =E<gt> L<Archive::Libarchive::ArchiveRead>

Class for reading from archives.

=item L<Archive|Archive::Libarchive::Archive> =E<gt> L<Archive::Libarchive::ArchiveWrite>

Class for creating new archives.

=item L<Archive|Archive::Libarchive::Archive> =E<gt> L<ArchiveRead|Archive::Libarchive::ArchiveRead> =E<gt> L<Archive::Libarchive::DiskRead>

Class for reading file entries from a local filesystem.

=item L<Archive|Archive::Libarchive::Archive> =E<gt> L<ArchiveWrite|Archive::Libarchive::ArchiveWrite> =E<gt> L<Archive::Libarchive::DiskWrite>

Class for writing file entries to a local filesystem.

=item L<Archive::Libarchive::Entry>

Class representing file meta data of a file inside an archive, or in the local filesystem.

=item L<Archive::Libarchive::EntryLinkResolver>

This is the C<libarchive> link resolver API.

=item L<Archive|Archive::Libarchive::Archive> =E<gt>  L<Archive::Libarchive::Match>

This is the C<libarchive> match API.

=back

This module attempts to provide comprehensive bindings to the C<libarchive> library.  For more details on
the history and alternatives to this project see the L</HISTORY> section below.  All recent versions of
C<libarchive> should be supported, although some methods are only available when you have the most recent
version of C<libarchive> installed.  For methods not available on older versions please consult
L<Archive::Libarchive::API>, which will list these methods as C<(optional)>.  If you need to support both
older versions of C<libarchive> and exploit the newer methods on newer versions of C<libarchive> you can use
the C<can> method to check if they are available.  If you need the latest version of C<libarchive>, and
your system provides an older version, then you can force a C<share> install of L<Alien::Libarchive3>:

 env ALIEN_INSTALL_TYPE=share cpanm Alien::Libarchive3

=head1 METHODS

The main functionality of this module is implemented in the classes listed above, but this module does
also provide a few top level non-object-oriented functions as well.  These methods are not exported
by default, but they can be requested using the usual L<Exporter> interface, either individually, or
with the C<:func> or C<:all> tags (The latter will also import constants).

=head2 archive_bzlib_version

 # archive_bzlib_version
 my $string = archive_bzlib_version();

The C<bzlib> version that C<libarchive> was built with.  This will return C<undef> if the library was
not found at build time.

=head2 archive_liblz4_version

 # archive_liblz4_version
 my $string = archive_liblz4_version();

The C<liblz4> version that C<libarchive> was built with.  This will return C<undef> if the library was
not found at build time.

=head2 archive_liblzma_version

 # archive_liblzma_version
 my $string = archive_liblzma_version();

The C<liblzma> version that C<libarchive> was built with.  This will return C<undef> if the library was
not found at build time.

=head2 archive_libzstd_version

 # archive_libzstd_version (optional)
 my $string = archive_libzstd_version();

The C<zstd> version that C<libarchive> was built with.  This will return C<undef> if the library was
not found at build time.

=head2 archive_version_details

 # archive_version_details
 my $string = archive_version_details();

Detailed textual name/version of the library and its dependencies. This has the form:

=over 4

=item C<libarchive x.y.z zlib/a.b.c liblzma/d.e.f ... etc ...>

=back

the list of libraries described here will vary depending on how libarchive was compiled.

=head2 archive_version_number

 # archive_version_number
 my $int = archive_version_number();

The C<libarchive> version expressed as an integer.  This will be the major, minor and patch
levels each using up to three digits, so 3.5.1 will be C<3005001>.

=head2 archive_version_string

 # archive_version_string
 my $string = archive_version_string();

The C<libarchive> version as a string.

=head2 archive_zlib_version

 # archive_zlib_version
 my $string = archive_zlib_version();

The C<zlib> version that C<libarchive> was built with.  This will return C<undef> if the library was
not found at build time.

=cut

my $ffi = Archive::Libarchive::Lib->ffi;

$ffi->mangler(undef);

$ffi->attach( archive_bzlib_version =>   [] => 'string' );
$ffi->attach( archive_liblz4_version =>  [] => 'string' );
$ffi->attach( archive_liblzma_version => [] => 'string' );
$ffi->attach( archive_version_details => [] => 'string' );
$ffi->attach( archive_version_number =>  [] => 'int'    );
$ffi->attach( archive_version_string =>  [] => 'string' );
$ffi->attach( archive_zlib_version =>    [] => 'string' );
$ffi->ignore_not_found(1);
$ffi->attach( archive_libzstd_version => [] => 'string' );
$ffi->ignore_not_found(0);

=head2 versions

 my %versions = Archive::Libarchive->versions();

This returns a hash of C<libarchive> and L<Archive::Libarchive> versions and dependency versions.  This
may be useful in a test report diagnostic.

=cut

sub versions ($class)
{
  my %v = (
    bzlib      => archive_bzlib_version()   // 'undef',
    liblz4     => archive_liblz4_version()  // 'undef',
    liblzma    => archive_liblzma_version() // 'undef',
    libarchive => archive_version_string()  // 'undef',
    zlib       => archive_zlib_version()    // 'undef',
    perl       => $],
  );

  if(__PACKAGE__->can('archive_libzstd_version'))
  {
    $v{libzstd} = archive_libzstd_version();
  }
  else
  {
    $v{libzstd} = 'undef';
  }

  foreach my $mod (qw( FFI::Platypus Archive::Libarchive FFI::CheckLib Alien::Libarchive3 Foo ))
  {
    my $version = $mod->VERSION;
    $v{$mod} = $version if defined $version;
  }

  %v;
}

=head1 EXAMPLES

These examples are translated from the C<libarchive> C examples, which can be found here:

=over 4

=item L<https://github.com/libarchive/libarchive/wiki/Examples#List_contents_of_Archive_stored_in_File>

=back

=head2 List contents of archive stored in file

The main L<Archive::Libarchive> API is based around two basic type of classes.  The L<Archive::Libarchive::Archive>
class serves as a basis for all archive objects.  The L<Archive::Libarchive::Entry> represents the header or meta data
for files stored inside an archive (or as we will see later, files on disk).

The basic life cycle of an archive instance is:

=over 4

=item Create one using its C<new> constructor

The constructor does not take any arguments, instead you will configure it in the
next step.

=item Configure it using "support" or "set" calls

Support calls allow L<Archive::Libarchive> to decide when to use a feature; "set" calls
enable the feature unconditionally.

=item "Open" a particular data source

This can be using callbacks for a custom source, or one of the pre-canned data sources supported directly by
L<Archive::Libarchive>.

=item Iterate over the contents

Ask alternatively for "header" or entry/file meta data (which is represented by a L<Archive::Libarchive::Entry> instance),
and entry/file content.

=item Finish by calling "close"

This will be called automatically if the archive instance falls out of scope.

=back

Writing an archive is very similar, except that you provide the "header" and content data to L<Archive::Libarchive> instead
of asking for them.

Here is a very basic example that simply opens a file and lists the contents of the archive.

# EXAMPLE: examples/list.pl

Note that L<open_filename|Archive::Libarchive::ArchiveRead/open_filename> method inspects the file before deciding
how to handle the block size.  If the filename provided refers to a tape device, for example, it will use exactly
the block size you specify.  For other devices, it may adjust the requested block size in order to obtain better
performance.

Note that the call to L<read_data_skip|Archive::Libarchive::API/read_data_skip> here is not actually necessary, since
L<Archive::Libarchive> will invoke it automatically if you request the next header without reading the data for the
last entry.

=head2 List contents of archive stored in memory

There are several variants of the open methods.  The "filename" variant used above is intended to be simple
to use in the common case of reading from a file from disk, but you may find the "memory" variant useful in other
cases.

# EXAMPLE: examples/list_memory.pl

There are also variants to read from an already-opened file descriptor, a C<libc> C<FILE> pointer, or a Perl
file handle.

=head2 List contents of archive with custom read functions

Sometimes, none of the packaged open methods will work for you.  In that case, you can use the lower-level C<open>
method, which accepts a number of callbacks.  For this example we will use the C<open>, C<read> and C<close>
callbacks.

# EXAMPLE: examples/custom.pl

For full power of read callbacks see the L<open method's documentation|Archive::Libarchive::ArchiveRead/open>.

When writing to an archive the L<Archive::Libarchive::ArchiveWrite> class also has its own
L<open method and callbacks|Archive::Libarchive::ArchiveWrite/open>.

=head2 A universal decompressor / defilter-er

The "raw" format handler treats arbitrary binary input as a single-element archive.  This allows you to get the
output of a libarchive filter chain, including files with multiple encodings, such as C<gz.uu> files:

# EXAMPLE: examples/defilter.pl

Note that the "raw" format is not enabled by the
L<support_format_all method on Archive::Libarchive::ArchiveRead|Archive::Libarchive::API/support_format_all>.
Also note that the "raw" format handler does not recognize or accept empty files.  If you specifically want to be
able to read empty files, you'll need to also invoke the
L<support_format_empty method on Archive::Libarchive::ArchiveRead|Archive::Libarchive::API/support_format_empty>.

=head2 A basic write example

# EXAMPLE: examples/write.pl

=head2 Constructing objects on disk

# EXAMPLE: examples/disk.pl

=head2 A complete extractor

# EXAMPLE: examples/extract.pl

=head1 CONSTANTS

This module provides all of the constants used by C<libarchive>.  These typically
are prefixed either C<ARCHIVE_> or C<AE_> and can be imported into your code
individually, or I<en masse> using the C<:const> export tag.  The will also be imported
if you use the C<:all> export tag to import everything.]

The complete list of available constants is listed in
L<Archive::Libarchive::API>.

The most common constants are the return of status codes from most functions:

=over 4

=item C<ARCHIVE_EOF>

is returned only from
L<read_data|Archive::Libarchive::ArchiveRead/read_data> and
L<read_data_block|Archive::Libarchive::ArchiveRead/read_data_block> from the
L<Archive::Libarchive::ArchiveRead> class when you reach the end of a structure.

=item C<ARCHIVE_OK>

The operation completed successfully.

=item C<ARCHIVE_WARN>

If the operation completed with some surprises. You may want to report the issue to your user.
The L<error_string|Archive::Libarchive::Archive/error_string> method on most classes will return
a suitable text message; the
L<errno|Archive::Libarchive::Archive/errno> method on most classes returns an associated system
C<errno> value. (Since not all errors are caused by failing system calls, this is not always
meaningful).

=item C<ARCHIVE_FAILED>

If this operation failed. In particular, this means that further operations on this entry are
impossible. This is returned, for example, if you try to write an entry type that's not supported
by this archive format. Recovery usually consists of simply going on to the next entry.

=item C<ARCHIVE_FATAL>

If the archive object itself is no longer usable, typically because of an I/O failure or memory
allocation failure.

=back

=head1 HISTORY

I started working with C<libarchive> in order to experiment with FFI.  To that end I implemented bindings
for C<libarchive> using both L<XS|Archive::Libarchive::XS> and L<FFI|Archive::Libarchive::FFI> to compare
and contrast the process.  It was the basis for my first YAPC::NA talk back in 2014.

=over 4

=item L<Foreign Function Interface (FFI) : Never Need to Write XS Again!|https://www.youtube.com/watch?v=cY-yqQ_nmtw>

=back

When I was working on the XS and FFI implementations I recognized that some degree of automation would be
required, mainly because the C<libarchive> is a C API of hundreds of methods, and new methods are being
added all the time.  I also wanted both implementations to use the same test suite, since their interfaces
should be identical.  While this work was useful, and I even ended up using both versions in production at
a previous C<$work>, the tools that I chose to automate managing the large number of methods, and the common
test suite made both modules quite difficult to maintain.

I think also the interface that I chose was wrong.  I opted to provide a very thin layer over C<libarchive>,
to avoid as much object-oriented overhead as possible.  I intended to one day make an object-oriented
layer over this thin layer to make it easier to use, but I never found the time to do this.  I think a better
approach would have been to bite the bullet provide only an object-oriented interface, because the ease of
using a library that automatically free's its pointers when an object falls out of scope is worth the
performance penalty of object oriented invocation.

I did, however, learn a lot about XS and FFI, and I started to think about what would make FFI easier in Perl.
At the time the only viable FFI on cpan was L<FFI::Raw>, and I contributed a number of enhancements and
fixes to that project, and even got it working on Strawberry Perl.  But I was starting to crave a better
experience writing FFI bindings in Perl.

BULK88 was in the audience for a DC / Baltimore version of my I<Never Need to Write XS> talk and he pointed
me to a feature in XS that would make FFI calls much faster than what was possible in L<FFI::Raw>.  Using
the C<any_ptr> it is possible to remove method calls from an FFI interface, which, due to their dynamic
nature.

I was loosing faith in L<FFI::Raw> being tenable or performant for large APIs, so I I gathered up my ideas
of what would make a better FFI experience in Perl and the C<any_ptr> feature that Bulk had shown me and
I started working on a prototype FFI library.  I gave a talk at the Pittsburgh workshop based on the
work of that prototype.

=over 4

=item L<FFI Performance|https://www.youtube.com/watch?v=uq2mgTOtbhM>

=back

I didn't release that prototype, because I kept hoping that FFI would catch fire and someone else
would write a killer FFI for Perl.  Since it didn't seem to be happening I re-worked my prototype
into what eventually became L<FFI::Platypus>.  I wrote lots of bindings for Perl using Platypus,
and I always had the idea that I would circle back to my FFI bindings for C<libarchive>
(L<Archive::Libarchive::FFI>) and rework it using Platypus instead of L<FFI::Raw>.  The problem is
that the project has since atrophied, and the problems with the dual module and automation
tools that I chose made this not really a viable enterprise.

I next thing that FFI needs in Perl is some good tools to introspect C and generate bindings automatically.
There are lots of challenges in this area.  One being that exactly what a function signature (assuming
you can even introspect that) can be ambiguous.  For example a C<char> could either be a 8 bit integer value
(it could even be signed or unsigned depending on architecture) or it could be a single character.
A pointer C<int *> could actually be used by the callee as an array.  There are lots of things that are
unsafe about C, and a ton of corner cases because of the way the C pre-processor works, but if we can
surmount these challenges then it would be very useful, because even when two different non-C languages are
trying to talk to each other, they are usually using the C ABI to do it.  This sort of drives me crazy
but it is the way the world works, at least today.

I've been working on some low-level tools that I'm hoping we can build on to do some of this introspection.
L<Const::Introspect::C> is able to extract C<#define> constants from a C header file, and L<Clang::CastXML>
uses the C<castxml> project to extract a model of the functions and C<strct>s in a C header file.  I'm hoping
with a middle layer these modules could be used to write a C<h2ffi> tool similar to L<h2xs>.  I've had
a number of false starts writing this middle layer: so I've decided to write some custom introspection
with C<libarchive>, which is a very FFI-friendly library, and one that I am familiar with, but that also
has some interesting challenges and edge cases.  I'm hoping this work will help design a more general middle
layer that will be usable for other libraries.

At the same time, I've decided to fix some of the design flaws of my original XS and FFI implementations.
There really isn't a good way of doing this with the original implementations so I'm deprecating them in
favor of this one.  I feel confident that the overall experience of using this library should be much
better than using one of the older ones.  I also think this one will be more easily maintainable, because
I am using C<castxml>, and I've created a reference build of C<libarchive> using docker, which should
ensure that the code generation is done consistently.

=cut

require Archive::Libarchive::Lib::Constants unless $Archive::Libarchive::no_gen;

use constant {
  AE_IFMT   => oct('170000'),
  AE_IFREG  => oct('100000'),
  AE_IFLNK  => oct('120000'),
  AE_IFSOCK => oct('140000'),
  AE_IFCHR  => oct('020000'),
  AE_IFBLK  => oct('060000'),
  AE_IFDIR  => oct('040000'),
  AE_IFIFO  => oct('010000'),
};

$DB::single = 1;
our @EXPORT_OK = grep /^(archive|ARCHIVE|AE)_/, keys %Archive::Libarchive::;
our %EXPORT_TAGS = (
  all   => \@EXPORT_OK,
  const => [grep /^(ARCHIVE|AE)_/, @EXPORT_OK],
  func  => [grep /^archive_/, @EXPORT_OK],
);

1;

__END__

=head1 SEE ALSO

=over 4

=item L<Archive::Libarchive::API>

This contains the full and complete API for all of the L<Archive::Libarchive>
classes.  Because C<libarchive> has hundreds of methods, the main documentation
pages elsewhere only contain enough to be useful, and not to overwhelm.

=item L<Archive::Libarchive::Archive>

The base class of all archive classes.  This includes some common error
reporting functionality among other things.

=item L<Archive::Libarchive::ArchiveRead>

This class is used for reading from archives.

=item L<Archive::Libarchive::ArchiveWrite>

This class is for creating new archives.

=item L<Archive::Libarchive::DiskRead>

This class is for reading L<Archive::Libarchive::Entry> objects from disk
so that they can be written to L<Archive::Libarchive::ArchiveWrite> objects.

=item L<Archive::Libarchive::DiskWrite>

This class is for writing L<Archive::Libarchive::Entry> objects to disk
that have been written from L<Archive::Libarchive::ArchiveRead> objects.

=item L<Archive::Libarchive::Entry>

This class represents a file in an archive, or on disk.

=item L<Archive::Libarchive::EntryLinkResolver>

This class exposes the C<libarchive> link resolver API.

=item L<Archive::Libarchive::Match>

This class exposes the C<libarchive> match API.

=item L<Alien::Libarchive3>

If a suitable system C<libarchive> can't be found, then this
L<Alien> will be installed to provide it.

=item L<libarchive.org|http://libarchive.org/>

The C<libarchive> project home page.

=item L<https://github.com/libarchive/libarchive/wiki>

The C<libarchive> project wiki.

=item L<https://github.com/libarchive/libarchive/wiki/ManualPages>

Some of the C<libarchive> man pages are listed here.

=back

=cut
