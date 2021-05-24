# Archive::Libarchive ![linux](https://github.com/uperl/Archive-Libarchive/workflows/linux/badge.svg) ![macos](https://github.com/uperl/Archive-Libarchive/workflows/macos/badge.svg) ![windows](https://github.com/uperl/Archive-Libarchive/workflows/windows/badge.svg) ![cygwin](https://github.com/uperl/Archive-Libarchive/workflows/cygwin/badge.svg) ![msys2-mingw](https://github.com/uperl/Archive-Libarchive/workflows/msys2-mingw/badge.svg) ![ref](https://github.com/uperl/Archive-Libarchive/workflows/ref/badge.svg)

Modern Perl bindings to libarchive

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

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2021 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
