package Archive::Libarchive::API;

use strict;
use warnings;

# ABSTRACT: Comprehensive API documentation for Archive::Libarchive
# VERSION

1;

__END__

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 Archive::Libarchive::Archive

=head2 clear_error

 # archive_clear_error
 $ar->clear_error;

=head2 compression

 # archive_compression
 $ar->compression;

=head2 compression_name

 # archive_compression_name
 $ar->compression_name;

=head2 copy_error

 # archive_copy_error
 $ar->copy_error;

=head2 errno

 # archive_errno
 $ar->errno;

=head2 error_string

 # archive_error_string
 $ar->error_string;

=head2 file_count

 # archive_file_count
 $ar->file_count;

=head2 filter_bytes

 # archive_filter_bytes
 $ar->filter_bytes;

=head2 filter_code

 # archive_filter_code
 $ar->filter_code;

=head2 filter_count

 # archive_filter_count
 $ar->filter_count;

=head2 filter_name

 # archive_filter_name
 $ar->filter_name;

=head2 format

 # archive_format
 $ar->format;

=head2 format_name

 # archive_format_name
 $ar->format_name;

=head2 position_compressed

 # archive_position_compressed
 $ar->position_compressed;

=head2 position_uncompressed

 # archive_position_uncompressed
 $ar->position_uncompressed;

=head2 seek_data

 # archive_seek_data
 $ar->seek_data;

=head1 Archive::Libarchive::ArchiveRead

=head2 add_callback_data

 # archive_read_add_callback_data
 $r->add_callback_data;

=head2 add_passphrase

 # archive_read_add_passphrase
 $r->add_passphrase;

=head2 append_callback_data

 # archive_read_append_callback_data
 $r->append_callback_data;

=head2 append_filter

 # archive_read_append_filter
 $r->append_filter;

=head2 append_filter_program

 # archive_read_append_filter_program
 $r->append_filter_program;

=head2 append_filter_program_signature

 # archive_read_append_filter_program_signature
 $r->append_filter_program_signature;

=head2 close

 # archive_read_close
 $r->close;

=head2 data_block

 # archive_read_data_block
 $r->data_block;

=head2 data_into_fd

 # archive_read_data_into_fd
 $r->data_into_fd;

=head2 data_skip

 # archive_read_data_skip
 $r->data_skip;

=head2 extract

 # archive_read_extract
 $r->extract;

=head2 extract2

 # archive_read_extract2
 $r->extract2;

=head2 extract_set_progress_callback

 # archive_read_extract_set_progress_callback
 $r->extract_set_progress_callback;

=head2 extract_set_skip_file

 # archive_read_extract_set_skip_file
 $r->extract_set_skip_file;

=head2 format_capabilities

 # archive_read_format_capabilities
 $r->format_capabilities;

=head2 has_encrypted_entries

 # archive_read_has_encrypted_entries
 $r->has_encrypted_entries;

=head2 header_position

 # archive_read_header_position
 $r->header_position;

=head2 open

 # archive_read_open
 $r->open;

=head2 open1

 # archive_read_open1
 $r->open1;

=head2 open2

 # archive_read_open2
 $r->open2;

=head2 open_FILE

 # archive_read_open_FILE
 $r->open_FILE;

=head2 open_fd

 # archive_read_open_fd
 $r->open_fd;

=head2 open_file

 # archive_read_open_file
 $r->open_file;

=head2 open_filename

 # archive_read_open_filename
 $r->open_filename;

=head2 open_filename_w

 # archive_read_open_filename_w
 $r->open_filename_w;

=head2 open_filenames

 # archive_read_open_filenames
 $r->open_filenames;

=head2 prepend_callback_data

 # archive_read_prepend_callback_data
 $r->prepend_callback_data;

=head2 set_callback_data

 # archive_read_set_callback_data
 $r->set_callback_data;

=head2 set_callback_data2

 # archive_read_set_callback_data2
 $r->set_callback_data2;

=head2 set_close_callback

 # archive_read_set_close_callback
 $r->set_close_callback;

=head2 set_filter_option

 # archive_read_set_filter_option
 $r->set_filter_option;

=head2 set_format

 # archive_read_set_format
 $r->set_format;

=head2 set_format_option

 # archive_read_set_format_option
 $r->set_format_option;

=head2 set_open_callback

 # archive_read_set_open_callback
 $r->set_open_callback;

=head2 set_option

 # archive_read_set_option
 $r->set_option;

=head2 set_options

 # archive_read_set_options
 $r->set_options;

=head2 set_passphrase_callback

 # archive_read_set_passphrase_callback
 $r->set_passphrase_callback;

=head2 set_read_callback

 # archive_read_set_read_callback
 $r->set_read_callback;

=head2 set_seek_callback

 # archive_read_set_seek_callback
 $r->set_seek_callback;

=head2 set_skip_callback

 # archive_read_set_skip_callback
 $r->set_skip_callback;

=head2 set_switch_callback

 # archive_read_set_switch_callback
 $r->set_switch_callback;

=head2 support_compression_all

 # archive_read_support_compression_all
 $r->support_compression_all;

=head2 support_compression_bzip2

 # archive_read_support_compression_bzip2
 $r->support_compression_bzip2;

=head2 support_compression_compress

 # archive_read_support_compression_compress
 $r->support_compression_compress;

=head2 support_compression_gzip

 # archive_read_support_compression_gzip
 $r->support_compression_gzip;

=head2 support_compression_lzip

 # archive_read_support_compression_lzip
 $r->support_compression_lzip;

=head2 support_compression_lzma

 # archive_read_support_compression_lzma
 $r->support_compression_lzma;

=head2 support_compression_none

 # archive_read_support_compression_none
 $r->support_compression_none;

=head2 support_compression_program

 # archive_read_support_compression_program
 $r->support_compression_program;

=head2 support_compression_program_signature

 # archive_read_support_compression_program_signature
 $r->support_compression_program_signature;

=head2 support_compression_rpm

 # archive_read_support_compression_rpm
 $r->support_compression_rpm;

=head2 support_compression_uu

 # archive_read_support_compression_uu
 $r->support_compression_uu;

=head2 support_compression_xz

 # archive_read_support_compression_xz
 $r->support_compression_xz;

=head2 support_filter_all

 # archive_read_support_filter_all
 $r->support_filter_all;

=head2 support_filter_by_code

 # archive_read_support_filter_by_code (optional)
 $r->support_filter_by_code;

=head2 support_filter_bzip2

 # archive_read_support_filter_bzip2
 $r->support_filter_bzip2;

=head2 support_filter_compress

 # archive_read_support_filter_compress
 $r->support_filter_compress;

=head2 support_filter_grzip

 # archive_read_support_filter_grzip
 $r->support_filter_grzip;

=head2 support_filter_gzip

 # archive_read_support_filter_gzip
 $r->support_filter_gzip;

=head2 support_filter_lrzip

 # archive_read_support_filter_lrzip
 $r->support_filter_lrzip;

=head2 support_filter_lz4

 # archive_read_support_filter_lz4
 $r->support_filter_lz4;

=head2 support_filter_lzip

 # archive_read_support_filter_lzip
 $r->support_filter_lzip;

=head2 support_filter_lzma

 # archive_read_support_filter_lzma
 $r->support_filter_lzma;

=head2 support_filter_lzop

 # archive_read_support_filter_lzop
 $r->support_filter_lzop;

=head2 support_filter_none

 # archive_read_support_filter_none
 $r->support_filter_none;

=head2 support_filter_program

 # archive_read_support_filter_program
 $r->support_filter_program;

=head2 support_filter_program_signature

 # archive_read_support_filter_program_signature
 $r->support_filter_program_signature;

=head2 support_filter_rpm

 # archive_read_support_filter_rpm
 $r->support_filter_rpm;

=head2 support_filter_uu

 # archive_read_support_filter_uu
 $r->support_filter_uu;

=head2 support_filter_xz

 # archive_read_support_filter_xz
 $r->support_filter_xz;

=head2 support_filter_zstd

 # archive_read_support_filter_zstd (optional)
 $r->support_filter_zstd;

=head2 support_format_7zip

 # archive_read_support_format_7zip
 $r->support_format_7zip;

=head2 support_format_all

 # archive_read_support_format_all
 $r->support_format_all;

=head2 support_format_ar

 # archive_read_support_format_ar
 $r->support_format_ar;

=head2 support_format_by_code

 # archive_read_support_format_by_code
 $r->support_format_by_code;

=head2 support_format_cab

 # archive_read_support_format_cab
 $r->support_format_cab;

=head2 support_format_cpio

 # archive_read_support_format_cpio
 $r->support_format_cpio;

=head2 support_format_empty

 # archive_read_support_format_empty
 $r->support_format_empty;

=head2 support_format_gnutar

 # archive_read_support_format_gnutar
 $r->support_format_gnutar;

=head2 support_format_iso9660

 # archive_read_support_format_iso9660
 $r->support_format_iso9660;

=head2 support_format_lha

 # archive_read_support_format_lha
 $r->support_format_lha;

=head2 support_format_mtree

 # archive_read_support_format_mtree
 $r->support_format_mtree;

=head2 support_format_rar

 # archive_read_support_format_rar
 $r->support_format_rar;

=head2 support_format_rar5

 # archive_read_support_format_rar5 (optional)
 $r->support_format_rar5;

=head2 support_format_raw

 # archive_read_support_format_raw
 $r->support_format_raw;

=head2 support_format_tar

 # archive_read_support_format_tar
 $r->support_format_tar;

=head2 support_format_warc

 # archive_read_support_format_warc
 $r->support_format_warc;

=head2 support_format_xar

 # archive_read_support_format_xar
 $r->support_format_xar;

=head2 support_format_zip

 # archive_read_support_format_zip
 $r->support_format_zip;

=head2 support_format_zip_seekable

 # archive_read_support_format_zip_seekable
 $r->support_format_zip_seekable;

=head2 support_format_zip_streamable

 # archive_read_support_format_zip_streamable
 $r->support_format_zip_streamable;

=head1 Archive::Libarchive::ArchiveWrite

=head2 add_filter

 # archive_write_add_filter
 $w->add_filter;

=head2 add_filter_b64encode

 # archive_write_add_filter_b64encode
 $w->add_filter_b64encode;

=head2 add_filter_by_name

 # archive_write_add_filter_by_name
 $w->add_filter_by_name;

=head2 add_filter_bzip2

 # archive_write_add_filter_bzip2
 $w->add_filter_bzip2;

=head2 add_filter_compress

 # archive_write_add_filter_compress
 $w->add_filter_compress;

=head2 add_filter_grzip

 # archive_write_add_filter_grzip
 $w->add_filter_grzip;

=head2 add_filter_gzip

 # archive_write_add_filter_gzip
 $w->add_filter_gzip;

=head2 add_filter_lrzip

 # archive_write_add_filter_lrzip
 $w->add_filter_lrzip;

=head2 add_filter_lz4

 # archive_write_add_filter_lz4
 $w->add_filter_lz4;

=head2 add_filter_lzip

 # archive_write_add_filter_lzip
 $w->add_filter_lzip;

=head2 add_filter_lzma

 # archive_write_add_filter_lzma
 $w->add_filter_lzma;

=head2 add_filter_lzop

 # archive_write_add_filter_lzop
 $w->add_filter_lzop;

=head2 add_filter_none

 # archive_write_add_filter_none
 $w->add_filter_none;

=head2 add_filter_program

 # archive_write_add_filter_program
 $w->add_filter_program;

=head2 add_filter_uuencode

 # archive_write_add_filter_uuencode
 $w->add_filter_uuencode;

=head2 add_filter_xz

 # archive_write_add_filter_xz
 $w->add_filter_xz;

=head2 add_filter_zstd

 # archive_write_add_filter_zstd (optional)
 $w->add_filter_zstd;

=head2 close

 # archive_write_close
 $w->close;

=head2 data_block

 # archive_write_data_block
 $w->data_block;

=head2 fail

 # archive_write_fail
 $w->fail;

=head2 finish_entry

 # archive_write_finish_entry
 $w->finish_entry;

=head2 get_bytes_in_last_block

 # archive_write_get_bytes_in_last_block
 $w->get_bytes_in_last_block;

=head2 get_bytes_per_block

 # archive_write_get_bytes_per_block
 $w->get_bytes_per_block;

=head2 open2

 # archive_write_open2 (optional)
 $w->open2;

=head2 open_fd

 # archive_write_open_fd
 $w->open_fd;

=head2 open_filename

 # archive_write_open_filename
 $w->open_filename;

=head2 open_filename_w

 # archive_write_open_filename_w
 $w->open_filename_w;

=head2 set_bytes_in_last_block

 # archive_write_set_bytes_in_last_block
 $w->set_bytes_in_last_block;

=head2 set_bytes_per_block

 # archive_write_set_bytes_per_block
 $w->set_bytes_per_block;

=head2 set_filter_option

 # archive_write_set_filter_option
 $w->set_filter_option;

=head2 set_format

 # archive_write_set_format
 $w->set_format;

=head2 set_format_7zip

 # archive_write_set_format_7zip
 $w->set_format_7zip;

=head2 set_format_ar_bsd

 # archive_write_set_format_ar_bsd
 $w->set_format_ar_bsd;

=head2 set_format_ar_svr4

 # archive_write_set_format_ar_svr4
 $w->set_format_ar_svr4;

=head2 set_format_by_name

 # archive_write_set_format_by_name
 $w->set_format_by_name;

=head2 set_format_cpio

 # archive_write_set_format_cpio
 $w->set_format_cpio;

=head2 set_format_cpio_newc

 # archive_write_set_format_cpio_newc
 $w->set_format_cpio_newc;

=head2 set_format_filter_by_ext

 # archive_write_set_format_filter_by_ext
 $w->set_format_filter_by_ext;

=head2 set_format_filter_by_ext_def

 # archive_write_set_format_filter_by_ext_def
 $w->set_format_filter_by_ext_def;

=head2 set_format_gnutar

 # archive_write_set_format_gnutar
 $w->set_format_gnutar;

=head2 set_format_iso9660

 # archive_write_set_format_iso9660
 $w->set_format_iso9660;

=head2 set_format_mtree

 # archive_write_set_format_mtree
 $w->set_format_mtree;

=head2 set_format_mtree_classic

 # archive_write_set_format_mtree_classic
 $w->set_format_mtree_classic;

=head2 set_format_option

 # archive_write_set_format_option
 $w->set_format_option;

=head2 set_format_pax

 # archive_write_set_format_pax
 $w->set_format_pax;

=head2 set_format_pax_restricted

 # archive_write_set_format_pax_restricted
 $w->set_format_pax_restricted;

=head2 set_format_raw

 # archive_write_set_format_raw
 $w->set_format_raw;

=head2 set_format_shar

 # archive_write_set_format_shar
 $w->set_format_shar;

=head2 set_format_shar_dump

 # archive_write_set_format_shar_dump
 $w->set_format_shar_dump;

=head2 set_format_ustar

 # archive_write_set_format_ustar
 $w->set_format_ustar;

=head2 set_format_v7tar

 # archive_write_set_format_v7tar
 $w->set_format_v7tar;

=head2 set_format_warc

 # archive_write_set_format_warc
 $w->set_format_warc;

=head2 set_format_xar

 # archive_write_set_format_xar
 $w->set_format_xar;

=head2 set_format_zip

 # archive_write_set_format_zip
 $w->set_format_zip;

=head2 set_option

 # archive_write_set_option
 $w->set_option;

=head2 set_options

 # archive_write_set_options
 $w->set_options;

=head2 set_passphrase

 # archive_write_set_passphrase
 $w->set_passphrase;

=head2 set_passphrase_callback

 # archive_write_set_passphrase_callback
 $w->set_passphrase_callback;

=head2 set_skip_file

 # archive_write_set_skip_file
 $w->set_skip_file;

=head2 write_header

 # archive_write_header
 $w->write_header;

=head2 zip_set_compression_deflate

 # archive_write_zip_set_compression_deflate
 $w->zip_set_compression_deflate;

=head2 zip_set_compression_store

 # archive_write_zip_set_compression_store
 $w->zip_set_compression_store;

=head1 Archive::Libarchive::DiskRead

=head2 disk_can_descend

 # archive_read_disk_can_descend
 $dr->disk_can_descend;

=head2 disk_current_filesystem

 # archive_read_disk_current_filesystem
 $dr->disk_current_filesystem;

=head2 disk_current_filesystem_is_remote

 # archive_read_disk_current_filesystem_is_remote
 $dr->disk_current_filesystem_is_remote;

=head2 disk_current_filesystem_is_synthetic

 # archive_read_disk_current_filesystem_is_synthetic
 $dr->disk_current_filesystem_is_synthetic;

=head2 disk_descend

 # archive_read_disk_descend
 $dr->disk_descend;

=head2 disk_entry_from_file

 # archive_read_disk_entry_from_file
 $dr->disk_entry_from_file;

=head2 disk_gname

 # archive_read_disk_gname
 $dr->disk_gname;

=head2 disk_open

 # archive_read_disk_open
 $dr->disk_open;

=head2 disk_open_w

 # archive_read_disk_open_w
 $dr->disk_open_w;

=head2 disk_set_atime_restored

 # archive_read_disk_set_atime_restored
 $dr->disk_set_atime_restored;

=head2 disk_set_behavior

 # archive_read_disk_set_behavior
 $dr->disk_set_behavior;

=head2 disk_set_gname_lookup

 # archive_read_disk_set_gname_lookup
 $dr->disk_set_gname_lookup;

=head2 disk_set_matching

 # archive_read_disk_set_matching
 $dr->disk_set_matching;

=head2 disk_set_metadata_filter_callback

 # archive_read_disk_set_metadata_filter_callback
 $dr->disk_set_metadata_filter_callback;

=head2 disk_set_standard_lookup

 # archive_read_disk_set_standard_lookup
 $dr->disk_set_standard_lookup;

=head2 disk_set_symlink_hybrid

 # archive_read_disk_set_symlink_hybrid
 $dr->disk_set_symlink_hybrid;

=head2 disk_set_symlink_logical

 # archive_read_disk_set_symlink_logical
 $dr->disk_set_symlink_logical;

=head2 disk_set_symlink_physical

 # archive_read_disk_set_symlink_physical
 $dr->disk_set_symlink_physical;

=head2 disk_set_uname_lookup

 # archive_read_disk_set_uname_lookup
 $dr->disk_set_uname_lookup;

=head2 disk_uname

 # archive_read_disk_uname
 $dr->disk_uname;

=head1 Archive::Libarchive::DiskWrite

=head2 disk_gid

 # archive_write_disk_gid
 $dw->disk_gid;

=head2 disk_set_group_lookup

 # archive_write_disk_set_group_lookup
 $dw->disk_set_group_lookup;

=head2 disk_set_options

 # archive_write_disk_set_options
 $dw->disk_set_options;

=head2 disk_set_skip_file

 # archive_write_disk_set_skip_file
 $dw->disk_set_skip_file;

=head2 disk_set_standard_lookup

 # archive_write_disk_set_standard_lookup
 $dw->disk_set_standard_lookup;

=head2 disk_set_user_lookup

 # archive_write_disk_set_user_lookup
 $dw->disk_set_user_lookup;

=head2 disk_uid

 # archive_write_disk_uid
 $dw->disk_uid;

=head1 Archive::Libarchive::Entry

=head2 acl_add_entry

 # archive_entry_acl_add_entry
 $e->acl_add_entry;

=head2 acl_add_entry_w

 # archive_entry_acl_add_entry_w
 $e->acl_add_entry_w;

=head2 acl_clear

 # archive_entry_acl_clear
 $e->acl_clear;

=head2 acl_count

 # archive_entry_acl_count
 $e->acl_count;

=head2 acl_from_text

 # archive_entry_acl_from_text (optional)
 $e->acl_from_text;

=head2 acl_from_text_w

 # archive_entry_acl_from_text_w (optional)
 $e->acl_from_text_w;

=head2 acl_next

 # archive_entry_acl_next
 $e->acl_next;

=head2 acl_reset

 # archive_entry_acl_reset
 $e->acl_reset;

=head2 acl_text

 # archive_entry_acl_text
 $e->acl_text;

=head2 acl_text_w

 # archive_entry_acl_text_w
 $e->acl_text_w;

=head2 acl_to_text

 # archive_entry_acl_to_text (optional)
 $e->acl_to_text;

=head2 acl_to_text_w

 # archive_entry_acl_to_text_w (optional)
 $e->acl_to_text_w;

=head2 acl_types

 # archive_entry_acl_types (optional)
 $e->acl_types;

=head2 atime

 # archive_entry_atime
 $e->atime;

=head2 atime_is_set

 # archive_entry_atime_is_set
 $e->atime_is_set;

=head2 atime_nsec

 # archive_entry_atime_nsec
 $e->atime_nsec;

=head2 birthtime

 # archive_entry_birthtime
 $e->birthtime;

=head2 birthtime_is_set

 # archive_entry_birthtime_is_set
 $e->birthtime_is_set;

=head2 birthtime_nsec

 # archive_entry_birthtime_nsec
 $e->birthtime_nsec;

=head2 clear

 # archive_entry_clear
 $e->clear;

=head2 clone

 # archive_entry_clone
 $e->clone;

=head2 copy_fflags_text

 # archive_entry_copy_fflags_text
 $e->copy_fflags_text;

=head2 copy_fflags_text_w

 # archive_entry_copy_fflags_text_w
 $e->copy_fflags_text_w;

=head2 copy_gname

 # archive_entry_copy_gname
 $e->copy_gname;

=head2 copy_gname_w

 # archive_entry_copy_gname_w
 $e->copy_gname_w;

=head2 copy_hardlink

 # archive_entry_copy_hardlink
 $e->copy_hardlink;

=head2 copy_hardlink_w

 # archive_entry_copy_hardlink_w
 $e->copy_hardlink_w;

=head2 copy_link

 # archive_entry_copy_link
 $e->copy_link;

=head2 copy_link_w

 # archive_entry_copy_link_w
 $e->copy_link_w;

=head2 copy_mac_metadata

 # archive_entry_copy_mac_metadata
 $e->copy_mac_metadata;

=head2 copy_pathname

 # archive_entry_copy_pathname
 $e->copy_pathname;

=head2 copy_pathname_w

 # archive_entry_copy_pathname_w
 $e->copy_pathname_w;

=head2 copy_sourcepath

 # archive_entry_copy_sourcepath
 $e->copy_sourcepath;

=head2 copy_sourcepath_w

 # archive_entry_copy_sourcepath_w
 $e->copy_sourcepath_w;

=head2 copy_stat

 # archive_entry_copy_stat
 $e->copy_stat;

=head2 copy_symlink

 # archive_entry_copy_symlink
 $e->copy_symlink;

=head2 copy_symlink_w

 # archive_entry_copy_symlink_w
 $e->copy_symlink_w;

=head2 copy_uname

 # archive_entry_copy_uname
 $e->copy_uname;

=head2 copy_uname_w

 # archive_entry_copy_uname_w
 $e->copy_uname_w;

=head2 ctime

 # archive_entry_ctime
 $e->ctime;

=head2 ctime_is_set

 # archive_entry_ctime_is_set
 $e->ctime_is_set;

=head2 ctime_nsec

 # archive_entry_ctime_nsec
 $e->ctime_nsec;

=head2 dev

 # archive_entry_dev
 $e->dev;

=head2 dev_is_set

 # archive_entry_dev_is_set
 $e->dev_is_set;

=head2 devmajor

 # archive_entry_devmajor
 $e->devmajor;

=head2 devminor

 # archive_entry_devminor
 $e->devminor;

=head2 digest

 # archive_entry_digest (optional)
 $e->digest;

=head2 fflags

 # archive_entry_fflags
 $e->fflags;

=head2 fflags_text

 # archive_entry_fflags_text
 $e->fflags_text;

=head2 filetype

 # archive_entry_filetype
 $e->filetype;

=head2 gid

 # archive_entry_gid
 $e->gid;

=head2 gname

 # archive_entry_gname
 $e->gname;

=head2 gname_utf8

 # archive_entry_gname_utf8
 $e->gname_utf8;

=head2 hardlink

 # archive_entry_hardlink
 $e->hardlink;

=head2 hardlink_utf8

 # archive_entry_hardlink_utf8
 $e->hardlink_utf8;

=head2 ino

 # archive_entry_ino
 $e->ino;

=head2 ino64

 # archive_entry_ino64
 $e->ino64;

=head2 ino_is_set

 # archive_entry_ino_is_set
 $e->ino_is_set;

=head2 is_data_encrypted

 # archive_entry_is_data_encrypted
 $e->is_data_encrypted;

=head2 is_encrypted

 # archive_entry_is_encrypted
 $e->is_encrypted;

=head2 is_metadata_encrypted

 # archive_entry_is_metadata_encrypted
 $e->is_metadata_encrypted;

=head2 mac_metadata

 # archive_entry_mac_metadata
 $e->mac_metadata;

=head2 mode

 # archive_entry_mode
 $e->mode;

=head2 mtime

 # archive_entry_mtime
 $e->mtime;

=head2 mtime_is_set

 # archive_entry_mtime_is_set
 $e->mtime_is_set;

=head2 mtime_nsec

 # archive_entry_mtime_nsec
 $e->mtime_nsec;

=head2 nlink

 # archive_entry_nlink
 $e->nlink;

=head2 pathname

 # archive_entry_pathname
 $e->pathname;

=head2 pathname_utf8

 # archive_entry_pathname_utf8
 $e->pathname_utf8;

=head2 perm

 # archive_entry_perm
 $e->perm;

=head2 rdev

 # archive_entry_rdev
 $e->rdev;

=head2 rdevmajor

 # archive_entry_rdevmajor
 $e->rdevmajor;

=head2 rdevminor

 # archive_entry_rdevminor
 $e->rdevminor;

=head2 set_atime

 # archive_entry_set_atime
 $e->set_atime;

=head2 set_birthtime

 # archive_entry_set_birthtime
 $e->set_birthtime;

=head2 set_ctime

 # archive_entry_set_ctime
 $e->set_ctime;

=head2 set_dev

 # archive_entry_set_dev
 $e->set_dev;

=head2 set_devmajor

 # archive_entry_set_devmajor
 $e->set_devmajor;

=head2 set_devminor

 # archive_entry_set_devminor
 $e->set_devminor;

=head2 set_fflags

 # archive_entry_set_fflags
 $e->set_fflags;

=head2 set_filetype

 # archive_entry_set_filetype
 $e->set_filetype;

=head2 set_gid

 # archive_entry_set_gid
 $e->set_gid;

=head2 set_gname

 # archive_entry_set_gname
 $e->set_gname;

=head2 set_gname_utf8

 # archive_entry_set_gname_utf8
 $e->set_gname_utf8;

=head2 set_hardlink

 # archive_entry_set_hardlink
 $e->set_hardlink;

=head2 set_hardlink_utf8

 # archive_entry_set_hardlink_utf8
 $e->set_hardlink_utf8;

=head2 set_ino

 # archive_entry_set_ino
 $e->set_ino;

=head2 set_ino64

 # archive_entry_set_ino64
 $e->set_ino64;

=head2 set_is_data_encrypted

 # archive_entry_set_is_data_encrypted
 $e->set_is_data_encrypted;

=head2 set_is_metadata_encrypted

 # archive_entry_set_is_metadata_encrypted
 $e->set_is_metadata_encrypted;

=head2 set_link

 # archive_entry_set_link
 $e->set_link;

=head2 set_link_utf8

 # archive_entry_set_link_utf8
 $e->set_link_utf8;

=head2 set_mode

 # archive_entry_set_mode
 $e->set_mode;

=head2 set_mtime

 # archive_entry_set_mtime
 $e->set_mtime;

=head2 set_nlink

 # archive_entry_set_nlink
 $e->set_nlink;

=head2 set_pathname

 # archive_entry_set_pathname
 $e->set_pathname;

=head2 set_pathname_utf8

 # archive_entry_set_pathname_utf8
 $e->set_pathname_utf8;

=head2 set_perm

 # archive_entry_set_perm
 $e->set_perm;

=head2 set_rdev

 # archive_entry_set_rdev
 $e->set_rdev;

=head2 set_rdevmajor

 # archive_entry_set_rdevmajor
 $e->set_rdevmajor;

=head2 set_rdevminor

 # archive_entry_set_rdevminor
 $e->set_rdevminor;

=head2 set_size

 # archive_entry_set_size
 $e->set_size;

=head2 set_symlink

 # archive_entry_set_symlink
 $e->set_symlink;

=head2 set_symlink_type

 # archive_entry_set_symlink_type (optional)
 $e->set_symlink_type;

=head2 set_symlink_utf8

 # archive_entry_set_symlink_utf8
 $e->set_symlink_utf8;

=head2 set_uid

 # archive_entry_set_uid
 $e->set_uid;

=head2 set_uname

 # archive_entry_set_uname
 $e->set_uname;

=head2 set_uname_utf8

 # archive_entry_set_uname_utf8
 $e->set_uname_utf8;

=head2 size

 # archive_entry_size
 $e->size;

=head2 size_is_set

 # archive_entry_size_is_set
 $e->size_is_set;

=head2 sourcepath

 # archive_entry_sourcepath
 $e->sourcepath;

=head2 sourcepath_w

 # archive_entry_sourcepath_w
 $e->sourcepath_w;

=head2 sparse_add_entry

 # archive_entry_sparse_add_entry
 $e->sparse_add_entry;

=head2 sparse_clear

 # archive_entry_sparse_clear
 $e->sparse_clear;

=head2 sparse_count

 # archive_entry_sparse_count
 $e->sparse_count;

=head2 sparse_next

 # archive_entry_sparse_next
 $e->sparse_next;

=head2 sparse_reset

 # archive_entry_sparse_reset
 $e->sparse_reset;

=head2 stat

 # archive_entry_stat
 $e->stat;

=head2 strmode

 # archive_entry_strmode
 $e->strmode;

=head2 symlink

 # archive_entry_symlink
 $e->symlink;

=head2 symlink_type

 # archive_entry_symlink_type (optional)
 $e->symlink_type;

=head2 symlink_utf8

 # archive_entry_symlink_utf8
 $e->symlink_utf8;

=head2 uid

 # archive_entry_uid
 $e->uid;

=head2 uname

 # archive_entry_uname
 $e->uname;

=head2 uname_utf8

 # archive_entry_uname_utf8
 $e->uname_utf8;

=head2 unset_atime

 # archive_entry_unset_atime
 $e->unset_atime;

=head2 unset_birthtime

 # archive_entry_unset_birthtime
 $e->unset_birthtime;

=head2 unset_ctime

 # archive_entry_unset_ctime
 $e->unset_ctime;

=head2 unset_mtime

 # archive_entry_unset_mtime
 $e->unset_mtime;

=head2 unset_size

 # archive_entry_unset_size
 $e->unset_size;

=head2 update_gname_utf8

 # archive_entry_update_gname_utf8
 $e->update_gname_utf8;

=head2 update_hardlink_utf8

 # archive_entry_update_hardlink_utf8
 $e->update_hardlink_utf8;

=head2 update_link_utf8

 # archive_entry_update_link_utf8
 $e->update_link_utf8;

=head2 update_pathname_utf8

 # archive_entry_update_pathname_utf8
 $e->update_pathname_utf8;

=head2 update_symlink_utf8

 # archive_entry_update_symlink_utf8
 $e->update_symlink_utf8;

=head2 update_uname_utf8

 # archive_entry_update_uname_utf8
 $e->update_uname_utf8;

=head2 xattr_add_entry

 # archive_entry_xattr_add_entry
 $e->xattr_add_entry;

=head2 xattr_clear

 # archive_entry_xattr_clear
 $e->xattr_clear;

=head2 xattr_count

 # archive_entry_xattr_count
 $e->xattr_count;

=head2 xattr_next

 # archive_entry_xattr_next
 $e->xattr_next;

=head2 xattr_reset

 # archive_entry_xattr_reset
 $e->xattr_reset;

=head1 Archive::Libarchive::EntryLinkResolver

=head2 set_strategy

 # archive_entry_linkresolver_set_strategy
 $lr->set_strategy;

=head1 Archive::Libarchive::Match

=head2 exclude_entry

 # archive_match_exclude_entry
 $m->exclude_entry;

=head2 exclude_pattern

 # archive_match_exclude_pattern
 $m->exclude_pattern;

=head2 exclude_pattern_from_file

 # archive_match_exclude_pattern_from_file
 $m->exclude_pattern_from_file;

=head2 exclude_pattern_from_file_w

 # archive_match_exclude_pattern_from_file_w
 $m->exclude_pattern_from_file_w;

=head2 exclude_pattern_w

 # archive_match_exclude_pattern_w
 $m->exclude_pattern_w;

=head2 excluded

 # archive_match_excluded
 $m->excluded;

=head2 include_date

 # archive_match_include_date
 $m->include_date;

=head2 include_date_w

 # archive_match_include_date_w
 $m->include_date_w;

=head2 include_file_time

 # archive_match_include_file_time
 $m->include_file_time;

=head2 include_file_time_w

 # archive_match_include_file_time_w
 $m->include_file_time_w;

=head2 include_gid

 # archive_match_include_gid
 $m->include_gid;

=head2 include_gname

 # archive_match_include_gname
 $m->include_gname;

=head2 include_gname_w

 # archive_match_include_gname_w
 $m->include_gname_w;

=head2 include_pattern

 # archive_match_include_pattern
 $m->include_pattern;

=head2 include_pattern_from_file

 # archive_match_include_pattern_from_file
 $m->include_pattern_from_file;

=head2 include_pattern_from_file_w

 # archive_match_include_pattern_from_file_w
 $m->include_pattern_from_file_w;

=head2 include_pattern_w

 # archive_match_include_pattern_w
 $m->include_pattern_w;

=head2 include_time

 # archive_match_include_time
 $m->include_time;

=head2 include_uid

 # archive_match_include_uid
 $m->include_uid;

=head2 include_uname

 # archive_match_include_uname
 $m->include_uname;

=head2 include_uname_w

 # archive_match_include_uname_w
 $m->include_uname_w;

=head2 owner_excluded

 # archive_match_owner_excluded
 $m->owner_excluded;

=head2 path_excluded

 # archive_match_path_excluded
 $m->path_excluded;

=head2 path_unmatched_inclusions

 # archive_match_path_unmatched_inclusions
 $m->path_unmatched_inclusions;

=head2 path_unmatched_inclusions_next

 # archive_match_path_unmatched_inclusions_next
 $m->path_unmatched_inclusions_next;

=head2 path_unmatched_inclusions_next_w

 # archive_match_path_unmatched_inclusions_next_w
 $m->path_unmatched_inclusions_next_w;

=head2 set_inclusion_recursion

 # archive_match_set_inclusion_recursion (optional)
 $m->set_inclusion_recursion;

=head2 time_excluded

 # archive_match_time_excluded
 $m->time_excluded;

=cut
