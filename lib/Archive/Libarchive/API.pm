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
 $x->clear_error;

=head2 compression

 # archive_compression
 $x->compression;

=head2 compression_name

 # archive_compression_name
 $x->compression_name;

=head2 copy_error

 # archive_copy_error
 $x->copy_error;

=head2 errno

 # archive_errno
 $x->errno;

=head2 error_string

 # archive_error_string
 $x->error_string;

=head2 file_count

 # archive_file_count
 $x->file_count;

=head2 filter_bytes

 # archive_filter_bytes
 $x->filter_bytes;

=head2 filter_code

 # archive_filter_code
 $x->filter_code;

=head2 filter_count

 # archive_filter_count
 $x->filter_count;

=head2 filter_name

 # archive_filter_name
 $x->filter_name;

=head2 format

 # archive_format
 $x->format;

=head2 format_name

 # archive_format_name
 $x->format_name;

=head2 position_compressed

 # archive_position_compressed
 $x->position_compressed;

=head2 position_uncompressed

 # archive_position_uncompressed
 $x->position_uncompressed;

=head2 seek_data

 # archive_seek_data
 $x->seek_data;

=head1 Archive::Libarchive::ArchiveRead

=head2 add_callback_data

 # archive_read_add_callback_data
 $x->add_callback_data;

=head2 add_passphrase

 # archive_read_add_passphrase
 $x->add_passphrase;

=head2 append_callback_data

 # archive_read_append_callback_data
 $x->append_callback_data;

=head2 append_filter

 # archive_read_append_filter
 $x->append_filter;

=head2 append_filter_program

 # archive_read_append_filter_program
 $x->append_filter_program;

=head2 append_filter_program_signature

 # archive_read_append_filter_program_signature
 $x->append_filter_program_signature;

=head2 close

 # archive_read_close
 $x->close;

=head2 data_block

 # archive_read_data_block
 $x->data_block;

=head2 data_into_fd

 # archive_read_data_into_fd
 $x->data_into_fd;

=head2 data_skip

 # archive_read_data_skip
 $x->data_skip;

=head2 extract

 # archive_read_extract
 $x->extract;

=head2 extract2

 # archive_read_extract2
 $x->extract2;

=head2 extract_set_progress_callback

 # archive_read_extract_set_progress_callback
 $x->extract_set_progress_callback;

=head2 extract_set_skip_file

 # archive_read_extract_set_skip_file
 $x->extract_set_skip_file;

=head2 format_capabilities

 # archive_read_format_capabilities
 $x->format_capabilities;

=head2 has_encrypted_entries

 # archive_read_has_encrypted_entries
 $x->has_encrypted_entries;

=head2 header_position

 # archive_read_header_position
 $x->header_position;

=head2 open

 # archive_read_open
 $x->open;

=head2 open1

 # archive_read_open1
 $x->open1;

=head2 open2

 # archive_read_open2
 $x->open2;

=head2 open_FILE

 # archive_read_open_FILE
 $x->open_FILE;

=head2 open_fd

 # archive_read_open_fd
 $x->open_fd;

=head2 open_file

 # archive_read_open_file
 $x->open_file;

=head2 open_filename

 # archive_read_open_filename
 $x->open_filename;

=head2 open_filename_w

 # archive_read_open_filename_w
 $x->open_filename_w;

=head2 open_filenames

 # archive_read_open_filenames
 $x->open_filenames;

=head2 prepend_callback_data

 # archive_read_prepend_callback_data
 $x->prepend_callback_data;

=head2 set_callback_data

 # archive_read_set_callback_data
 $x->set_callback_data;

=head2 set_callback_data2

 # archive_read_set_callback_data2
 $x->set_callback_data2;

=head2 set_close_callback

 # archive_read_set_close_callback
 $x->set_close_callback;

=head2 set_filter_option

 # archive_read_set_filter_option
 $x->set_filter_option;

=head2 set_format

 # archive_read_set_format
 $x->set_format;

=head2 set_format_option

 # archive_read_set_format_option
 $x->set_format_option;

=head2 set_open_callback

 # archive_read_set_open_callback
 $x->set_open_callback;

=head2 set_option

 # archive_read_set_option
 $x->set_option;

=head2 set_options

 # archive_read_set_options
 $x->set_options;

=head2 set_passphrase_callback

 # archive_read_set_passphrase_callback
 $x->set_passphrase_callback;

=head2 set_read_callback

 # archive_read_set_read_callback
 $x->set_read_callback;

=head2 set_seek_callback

 # archive_read_set_seek_callback
 $x->set_seek_callback;

=head2 set_skip_callback

 # archive_read_set_skip_callback
 $x->set_skip_callback;

=head2 set_switch_callback

 # archive_read_set_switch_callback
 $x->set_switch_callback;

=head2 support_compression_all

 # archive_read_support_compression_all
 $x->support_compression_all;

=head2 support_compression_bzip2

 # archive_read_support_compression_bzip2
 $x->support_compression_bzip2;

=head2 support_compression_compress

 # archive_read_support_compression_compress
 $x->support_compression_compress;

=head2 support_compression_gzip

 # archive_read_support_compression_gzip
 $x->support_compression_gzip;

=head2 support_compression_lzip

 # archive_read_support_compression_lzip
 $x->support_compression_lzip;

=head2 support_compression_lzma

 # archive_read_support_compression_lzma
 $x->support_compression_lzma;

=head2 support_compression_none

 # archive_read_support_compression_none
 $x->support_compression_none;

=head2 support_compression_program

 # archive_read_support_compression_program
 $x->support_compression_program;

=head2 support_compression_program_signature

 # archive_read_support_compression_program_signature
 $x->support_compression_program_signature;

=head2 support_compression_rpm

 # archive_read_support_compression_rpm
 $x->support_compression_rpm;

=head2 support_compression_uu

 # archive_read_support_compression_uu
 $x->support_compression_uu;

=head2 support_compression_xz

 # archive_read_support_compression_xz
 $x->support_compression_xz;

=head2 support_filter_all

 # archive_read_support_filter_all
 $x->support_filter_all;

=head2 support_filter_by_code

 # archive_read_support_filter_by_code (optional)
 $x->support_filter_by_code;

=head2 support_filter_bzip2

 # archive_read_support_filter_bzip2
 $x->support_filter_bzip2;

=head2 support_filter_compress

 # archive_read_support_filter_compress
 $x->support_filter_compress;

=head2 support_filter_grzip

 # archive_read_support_filter_grzip
 $x->support_filter_grzip;

=head2 support_filter_gzip

 # archive_read_support_filter_gzip
 $x->support_filter_gzip;

=head2 support_filter_lrzip

 # archive_read_support_filter_lrzip
 $x->support_filter_lrzip;

=head2 support_filter_lz4

 # archive_read_support_filter_lz4
 $x->support_filter_lz4;

=head2 support_filter_lzip

 # archive_read_support_filter_lzip
 $x->support_filter_lzip;

=head2 support_filter_lzma

 # archive_read_support_filter_lzma
 $x->support_filter_lzma;

=head2 support_filter_lzop

 # archive_read_support_filter_lzop
 $x->support_filter_lzop;

=head2 support_filter_none

 # archive_read_support_filter_none
 $x->support_filter_none;

=head2 support_filter_program

 # archive_read_support_filter_program
 $x->support_filter_program;

=head2 support_filter_program_signature

 # archive_read_support_filter_program_signature
 $x->support_filter_program_signature;

=head2 support_filter_rpm

 # archive_read_support_filter_rpm
 $x->support_filter_rpm;

=head2 support_filter_uu

 # archive_read_support_filter_uu
 $x->support_filter_uu;

=head2 support_filter_xz

 # archive_read_support_filter_xz
 $x->support_filter_xz;

=head2 support_filter_zstd

 # archive_read_support_filter_zstd (optional)
 $x->support_filter_zstd;

=head2 support_format_7zip

 # archive_read_support_format_7zip
 $x->support_format_7zip;

=head2 support_format_all

 # archive_read_support_format_all
 $x->support_format_all;

=head2 support_format_ar

 # archive_read_support_format_ar
 $x->support_format_ar;

=head2 support_format_by_code

 # archive_read_support_format_by_code
 $x->support_format_by_code;

=head2 support_format_cab

 # archive_read_support_format_cab
 $x->support_format_cab;

=head2 support_format_cpio

 # archive_read_support_format_cpio
 $x->support_format_cpio;

=head2 support_format_empty

 # archive_read_support_format_empty
 $x->support_format_empty;

=head2 support_format_gnutar

 # archive_read_support_format_gnutar
 $x->support_format_gnutar;

=head2 support_format_iso9660

 # archive_read_support_format_iso9660
 $x->support_format_iso9660;

=head2 support_format_lha

 # archive_read_support_format_lha
 $x->support_format_lha;

=head2 support_format_mtree

 # archive_read_support_format_mtree
 $x->support_format_mtree;

=head2 support_format_rar

 # archive_read_support_format_rar
 $x->support_format_rar;

=head2 support_format_rar5

 # archive_read_support_format_rar5 (optional)
 $x->support_format_rar5;

=head2 support_format_raw

 # archive_read_support_format_raw
 $x->support_format_raw;

=head2 support_format_tar

 # archive_read_support_format_tar
 $x->support_format_tar;

=head2 support_format_warc

 # archive_read_support_format_warc
 $x->support_format_warc;

=head2 support_format_xar

 # archive_read_support_format_xar
 $x->support_format_xar;

=head2 support_format_zip

 # archive_read_support_format_zip
 $x->support_format_zip;

=head2 support_format_zip_seekable

 # archive_read_support_format_zip_seekable
 $x->support_format_zip_seekable;

=head2 support_format_zip_streamable

 # archive_read_support_format_zip_streamable
 $x->support_format_zip_streamable;

=head1 Archive::Libarchive::ArchiveWrite

=head2 add_filter

 # archive_write_add_filter
 $x->add_filter;

=head2 add_filter_b64encode

 # archive_write_add_filter_b64encode
 $x->add_filter_b64encode;

=head2 add_filter_by_name

 # archive_write_add_filter_by_name
 $x->add_filter_by_name;

=head2 add_filter_bzip2

 # archive_write_add_filter_bzip2
 $x->add_filter_bzip2;

=head2 add_filter_compress

 # archive_write_add_filter_compress
 $x->add_filter_compress;

=head2 add_filter_grzip

 # archive_write_add_filter_grzip
 $x->add_filter_grzip;

=head2 add_filter_gzip

 # archive_write_add_filter_gzip
 $x->add_filter_gzip;

=head2 add_filter_lrzip

 # archive_write_add_filter_lrzip
 $x->add_filter_lrzip;

=head2 add_filter_lz4

 # archive_write_add_filter_lz4
 $x->add_filter_lz4;

=head2 add_filter_lzip

 # archive_write_add_filter_lzip
 $x->add_filter_lzip;

=head2 add_filter_lzma

 # archive_write_add_filter_lzma
 $x->add_filter_lzma;

=head2 add_filter_lzop

 # archive_write_add_filter_lzop
 $x->add_filter_lzop;

=head2 add_filter_none

 # archive_write_add_filter_none
 $x->add_filter_none;

=head2 add_filter_program

 # archive_write_add_filter_program
 $x->add_filter_program;

=head2 add_filter_uuencode

 # archive_write_add_filter_uuencode
 $x->add_filter_uuencode;

=head2 add_filter_xz

 # archive_write_add_filter_xz
 $x->add_filter_xz;

=head2 add_filter_zstd

 # archive_write_add_filter_zstd (optional)
 $x->add_filter_zstd;

=head2 close

 # archive_write_close
 $x->close;

=head2 data_block

 # archive_write_data_block
 $x->data_block;

=head2 fail

 # archive_write_fail
 $x->fail;

=head2 finish_entry

 # archive_write_finish_entry
 $x->finish_entry;

=head2 get_bytes_in_last_block

 # archive_write_get_bytes_in_last_block
 $x->get_bytes_in_last_block;

=head2 get_bytes_per_block

 # archive_write_get_bytes_per_block
 $x->get_bytes_per_block;

=head2 open2

 # archive_write_open2 (optional)
 $x->open2;

=head2 open_fd

 # archive_write_open_fd
 $x->open_fd;

=head2 open_filename

 # archive_write_open_filename
 $x->open_filename;

=head2 open_filename_w

 # archive_write_open_filename_w
 $x->open_filename_w;

=head2 set_bytes_in_last_block

 # archive_write_set_bytes_in_last_block
 $x->set_bytes_in_last_block;

=head2 set_bytes_per_block

 # archive_write_set_bytes_per_block
 $x->set_bytes_per_block;

=head2 set_filter_option

 # archive_write_set_filter_option
 $x->set_filter_option;

=head2 set_format

 # archive_write_set_format
 $x->set_format;

=head2 set_format_7zip

 # archive_write_set_format_7zip
 $x->set_format_7zip;

=head2 set_format_ar_bsd

 # archive_write_set_format_ar_bsd
 $x->set_format_ar_bsd;

=head2 set_format_ar_svr4

 # archive_write_set_format_ar_svr4
 $x->set_format_ar_svr4;

=head2 set_format_by_name

 # archive_write_set_format_by_name
 $x->set_format_by_name;

=head2 set_format_cpio

 # archive_write_set_format_cpio
 $x->set_format_cpio;

=head2 set_format_cpio_newc

 # archive_write_set_format_cpio_newc
 $x->set_format_cpio_newc;

=head2 set_format_filter_by_ext

 # archive_write_set_format_filter_by_ext
 $x->set_format_filter_by_ext;

=head2 set_format_filter_by_ext_def

 # archive_write_set_format_filter_by_ext_def
 $x->set_format_filter_by_ext_def;

=head2 set_format_gnutar

 # archive_write_set_format_gnutar
 $x->set_format_gnutar;

=head2 set_format_iso9660

 # archive_write_set_format_iso9660
 $x->set_format_iso9660;

=head2 set_format_mtree

 # archive_write_set_format_mtree
 $x->set_format_mtree;

=head2 set_format_mtree_classic

 # archive_write_set_format_mtree_classic
 $x->set_format_mtree_classic;

=head2 set_format_option

 # archive_write_set_format_option
 $x->set_format_option;

=head2 set_format_pax

 # archive_write_set_format_pax
 $x->set_format_pax;

=head2 set_format_pax_restricted

 # archive_write_set_format_pax_restricted
 $x->set_format_pax_restricted;

=head2 set_format_raw

 # archive_write_set_format_raw
 $x->set_format_raw;

=head2 set_format_shar

 # archive_write_set_format_shar
 $x->set_format_shar;

=head2 set_format_shar_dump

 # archive_write_set_format_shar_dump
 $x->set_format_shar_dump;

=head2 set_format_ustar

 # archive_write_set_format_ustar
 $x->set_format_ustar;

=head2 set_format_v7tar

 # archive_write_set_format_v7tar
 $x->set_format_v7tar;

=head2 set_format_warc

 # archive_write_set_format_warc
 $x->set_format_warc;

=head2 set_format_xar

 # archive_write_set_format_xar
 $x->set_format_xar;

=head2 set_format_zip

 # archive_write_set_format_zip
 $x->set_format_zip;

=head2 set_option

 # archive_write_set_option
 $x->set_option;

=head2 set_options

 # archive_write_set_options
 $x->set_options;

=head2 set_passphrase

 # archive_write_set_passphrase
 $x->set_passphrase;

=head2 set_passphrase_callback

 # archive_write_set_passphrase_callback
 $x->set_passphrase_callback;

=head2 set_skip_file

 # archive_write_set_skip_file
 $x->set_skip_file;

=head2 write_header

 # archive_write_header
 $x->write_header;

=head2 zip_set_compression_deflate

 # archive_write_zip_set_compression_deflate
 $x->zip_set_compression_deflate;

=head2 zip_set_compression_store

 # archive_write_zip_set_compression_store
 $x->zip_set_compression_store;

=head1 Archive::Libarchive::DiskRead

=head2 disk_can_descend

 # archive_read_disk_can_descend
 $x->disk_can_descend;

=head2 disk_current_filesystem

 # archive_read_disk_current_filesystem
 $x->disk_current_filesystem;

=head2 disk_current_filesystem_is_remote

 # archive_read_disk_current_filesystem_is_remote
 $x->disk_current_filesystem_is_remote;

=head2 disk_current_filesystem_is_synthetic

 # archive_read_disk_current_filesystem_is_synthetic
 $x->disk_current_filesystem_is_synthetic;

=head2 disk_descend

 # archive_read_disk_descend
 $x->disk_descend;

=head2 disk_entry_from_file

 # archive_read_disk_entry_from_file
 $x->disk_entry_from_file;

=head2 disk_gname

 # archive_read_disk_gname
 $x->disk_gname;

=head2 disk_open

 # archive_read_disk_open
 $x->disk_open;

=head2 disk_open_w

 # archive_read_disk_open_w
 $x->disk_open_w;

=head2 disk_set_atime_restored

 # archive_read_disk_set_atime_restored
 $x->disk_set_atime_restored;

=head2 disk_set_behavior

 # archive_read_disk_set_behavior
 $x->disk_set_behavior;

=head2 disk_set_gname_lookup

 # archive_read_disk_set_gname_lookup
 $x->disk_set_gname_lookup;

=head2 disk_set_matching

 # archive_read_disk_set_matching
 $x->disk_set_matching;

=head2 disk_set_metadata_filter_callback

 # archive_read_disk_set_metadata_filter_callback
 $x->disk_set_metadata_filter_callback;

=head2 disk_set_standard_lookup

 # archive_read_disk_set_standard_lookup
 $x->disk_set_standard_lookup;

=head2 disk_set_symlink_hybrid

 # archive_read_disk_set_symlink_hybrid
 $x->disk_set_symlink_hybrid;

=head2 disk_set_symlink_logical

 # archive_read_disk_set_symlink_logical
 $x->disk_set_symlink_logical;

=head2 disk_set_symlink_physical

 # archive_read_disk_set_symlink_physical
 $x->disk_set_symlink_physical;

=head2 disk_set_uname_lookup

 # archive_read_disk_set_uname_lookup
 $x->disk_set_uname_lookup;

=head2 disk_uname

 # archive_read_disk_uname
 $x->disk_uname;

=head1 Archive::Libarchive::DiskWrite

=head2 disk_gid

 # archive_write_disk_gid
 $x->disk_gid;

=head2 disk_set_group_lookup

 # archive_write_disk_set_group_lookup
 $x->disk_set_group_lookup;

=head2 disk_set_options

 # archive_write_disk_set_options
 $x->disk_set_options;

=head2 disk_set_skip_file

 # archive_write_disk_set_skip_file
 $x->disk_set_skip_file;

=head2 disk_set_standard_lookup

 # archive_write_disk_set_standard_lookup
 $x->disk_set_standard_lookup;

=head2 disk_set_user_lookup

 # archive_write_disk_set_user_lookup
 $x->disk_set_user_lookup;

=head2 disk_uid

 # archive_write_disk_uid
 $x->disk_uid;

=head1 Archive::Libarchive::Entry

=head2 acl_add_entry

 # archive_entry_acl_add_entry
 $x->acl_add_entry;

=head2 acl_add_entry_w

 # archive_entry_acl_add_entry_w
 $x->acl_add_entry_w;

=head2 acl_clear

 # archive_entry_acl_clear
 $x->acl_clear;

=head2 acl_count

 # archive_entry_acl_count
 $x->acl_count;

=head2 acl_from_text

 # archive_entry_acl_from_text (optional)
 $x->acl_from_text;

=head2 acl_from_text_w

 # archive_entry_acl_from_text_w (optional)
 $x->acl_from_text_w;

=head2 acl_next

 # archive_entry_acl_next
 $x->acl_next;

=head2 acl_reset

 # archive_entry_acl_reset
 $x->acl_reset;

=head2 acl_text

 # archive_entry_acl_text
 $x->acl_text;

=head2 acl_text_w

 # archive_entry_acl_text_w
 $x->acl_text_w;

=head2 acl_to_text

 # archive_entry_acl_to_text (optional)
 $x->acl_to_text;

=head2 acl_to_text_w

 # archive_entry_acl_to_text_w (optional)
 $x->acl_to_text_w;

=head2 acl_types

 # archive_entry_acl_types (optional)
 $x->acl_types;

=head2 atime

 # archive_entry_atime
 $x->atime;

=head2 atime_is_set

 # archive_entry_atime_is_set
 $x->atime_is_set;

=head2 atime_nsec

 # archive_entry_atime_nsec
 $x->atime_nsec;

=head2 birthtime

 # archive_entry_birthtime
 $x->birthtime;

=head2 birthtime_is_set

 # archive_entry_birthtime_is_set
 $x->birthtime_is_set;

=head2 birthtime_nsec

 # archive_entry_birthtime_nsec
 $x->birthtime_nsec;

=head2 clear

 # archive_entry_clear
 $x->clear;

=head2 clone

 # archive_entry_clone
 $x->clone;

=head2 copy_fflags_text

 # archive_entry_copy_fflags_text
 $x->copy_fflags_text;

=head2 copy_fflags_text_w

 # archive_entry_copy_fflags_text_w
 $x->copy_fflags_text_w;

=head2 copy_gname

 # archive_entry_copy_gname
 $x->copy_gname;

=head2 copy_gname_w

 # archive_entry_copy_gname_w
 $x->copy_gname_w;

=head2 copy_hardlink

 # archive_entry_copy_hardlink
 $x->copy_hardlink;

=head2 copy_hardlink_w

 # archive_entry_copy_hardlink_w
 $x->copy_hardlink_w;

=head2 copy_link

 # archive_entry_copy_link
 $x->copy_link;

=head2 copy_link_w

 # archive_entry_copy_link_w
 $x->copy_link_w;

=head2 copy_mac_metadata

 # archive_entry_copy_mac_metadata
 $x->copy_mac_metadata;

=head2 copy_pathname

 # archive_entry_copy_pathname
 $x->copy_pathname;

=head2 copy_pathname_w

 # archive_entry_copy_pathname_w
 $x->copy_pathname_w;

=head2 copy_sourcepath

 # archive_entry_copy_sourcepath
 $x->copy_sourcepath;

=head2 copy_sourcepath_w

 # archive_entry_copy_sourcepath_w
 $x->copy_sourcepath_w;

=head2 copy_stat

 # archive_entry_copy_stat
 $x->copy_stat;

=head2 copy_symlink

 # archive_entry_copy_symlink
 $x->copy_symlink;

=head2 copy_symlink_w

 # archive_entry_copy_symlink_w
 $x->copy_symlink_w;

=head2 copy_uname

 # archive_entry_copy_uname
 $x->copy_uname;

=head2 copy_uname_w

 # archive_entry_copy_uname_w
 $x->copy_uname_w;

=head2 ctime

 # archive_entry_ctime
 $x->ctime;

=head2 ctime_is_set

 # archive_entry_ctime_is_set
 $x->ctime_is_set;

=head2 ctime_nsec

 # archive_entry_ctime_nsec
 $x->ctime_nsec;

=head2 dev

 # archive_entry_dev
 $x->dev;

=head2 dev_is_set

 # archive_entry_dev_is_set
 $x->dev_is_set;

=head2 devmajor

 # archive_entry_devmajor
 $x->devmajor;

=head2 devminor

 # archive_entry_devminor
 $x->devminor;

=head2 digest

 # archive_entry_digest (optional)
 $x->digest;

=head2 fflags

 # archive_entry_fflags
 $x->fflags;

=head2 fflags_text

 # archive_entry_fflags_text
 $x->fflags_text;

=head2 filetype

 # archive_entry_filetype
 $x->filetype;

=head2 gid

 # archive_entry_gid
 $x->gid;

=head2 gname

 # archive_entry_gname
 $x->gname;

=head2 gname_utf8

 # archive_entry_gname_utf8
 $x->gname_utf8;

=head2 hardlink

 # archive_entry_hardlink
 $x->hardlink;

=head2 hardlink_utf8

 # archive_entry_hardlink_utf8
 $x->hardlink_utf8;

=head2 ino

 # archive_entry_ino
 $x->ino;

=head2 ino64

 # archive_entry_ino64
 $x->ino64;

=head2 ino_is_set

 # archive_entry_ino_is_set
 $x->ino_is_set;

=head2 is_data_encrypted

 # archive_entry_is_data_encrypted
 $x->is_data_encrypted;

=head2 is_encrypted

 # archive_entry_is_encrypted
 $x->is_encrypted;

=head2 is_metadata_encrypted

 # archive_entry_is_metadata_encrypted
 $x->is_metadata_encrypted;

=head2 mac_metadata

 # archive_entry_mac_metadata
 $x->mac_metadata;

=head2 mode

 # archive_entry_mode
 $x->mode;

=head2 mtime

 # archive_entry_mtime
 $x->mtime;

=head2 mtime_is_set

 # archive_entry_mtime_is_set
 $x->mtime_is_set;

=head2 mtime_nsec

 # archive_entry_mtime_nsec
 $x->mtime_nsec;

=head2 nlink

 # archive_entry_nlink
 $x->nlink;

=head2 pathname

 # archive_entry_pathname
 $x->pathname;

=head2 pathname_utf8

 # archive_entry_pathname_utf8
 $x->pathname_utf8;

=head2 perm

 # archive_entry_perm
 $x->perm;

=head2 rdev

 # archive_entry_rdev
 $x->rdev;

=head2 rdevmajor

 # archive_entry_rdevmajor
 $x->rdevmajor;

=head2 rdevminor

 # archive_entry_rdevminor
 $x->rdevminor;

=head2 set_atime

 # archive_entry_set_atime
 $x->set_atime;

=head2 set_birthtime

 # archive_entry_set_birthtime
 $x->set_birthtime;

=head2 set_ctime

 # archive_entry_set_ctime
 $x->set_ctime;

=head2 set_dev

 # archive_entry_set_dev
 $x->set_dev;

=head2 set_devmajor

 # archive_entry_set_devmajor
 $x->set_devmajor;

=head2 set_devminor

 # archive_entry_set_devminor
 $x->set_devminor;

=head2 set_fflags

 # archive_entry_set_fflags
 $x->set_fflags;

=head2 set_filetype

 # archive_entry_set_filetype
 $x->set_filetype;

=head2 set_gid

 # archive_entry_set_gid
 $x->set_gid;

=head2 set_gname

 # archive_entry_set_gname
 $x->set_gname;

=head2 set_gname_utf8

 # archive_entry_set_gname_utf8
 $x->set_gname_utf8;

=head2 set_hardlink

 # archive_entry_set_hardlink
 $x->set_hardlink;

=head2 set_hardlink_utf8

 # archive_entry_set_hardlink_utf8
 $x->set_hardlink_utf8;

=head2 set_ino

 # archive_entry_set_ino
 $x->set_ino;

=head2 set_ino64

 # archive_entry_set_ino64
 $x->set_ino64;

=head2 set_is_data_encrypted

 # archive_entry_set_is_data_encrypted
 $x->set_is_data_encrypted;

=head2 set_is_metadata_encrypted

 # archive_entry_set_is_metadata_encrypted
 $x->set_is_metadata_encrypted;

=head2 set_link

 # archive_entry_set_link
 $x->set_link;

=head2 set_link_utf8

 # archive_entry_set_link_utf8
 $x->set_link_utf8;

=head2 set_mode

 # archive_entry_set_mode
 $x->set_mode;

=head2 set_mtime

 # archive_entry_set_mtime
 $x->set_mtime;

=head2 set_nlink

 # archive_entry_set_nlink
 $x->set_nlink;

=head2 set_pathname

 # archive_entry_set_pathname
 $x->set_pathname;

=head2 set_pathname_utf8

 # archive_entry_set_pathname_utf8
 $x->set_pathname_utf8;

=head2 set_perm

 # archive_entry_set_perm
 $x->set_perm;

=head2 set_rdev

 # archive_entry_set_rdev
 $x->set_rdev;

=head2 set_rdevmajor

 # archive_entry_set_rdevmajor
 $x->set_rdevmajor;

=head2 set_rdevminor

 # archive_entry_set_rdevminor
 $x->set_rdevminor;

=head2 set_size

 # archive_entry_set_size
 $x->set_size;

=head2 set_symlink

 # archive_entry_set_symlink
 $x->set_symlink;

=head2 set_symlink_type

 # archive_entry_set_symlink_type (optional)
 $x->set_symlink_type;

=head2 set_symlink_utf8

 # archive_entry_set_symlink_utf8
 $x->set_symlink_utf8;

=head2 set_uid

 # archive_entry_set_uid
 $x->set_uid;

=head2 set_uname

 # archive_entry_set_uname
 $x->set_uname;

=head2 set_uname_utf8

 # archive_entry_set_uname_utf8
 $x->set_uname_utf8;

=head2 size

 # archive_entry_size
 $x->size;

=head2 size_is_set

 # archive_entry_size_is_set
 $x->size_is_set;

=head2 sourcepath

 # archive_entry_sourcepath
 $x->sourcepath;

=head2 sourcepath_w

 # archive_entry_sourcepath_w
 $x->sourcepath_w;

=head2 sparse_add_entry

 # archive_entry_sparse_add_entry
 $x->sparse_add_entry;

=head2 sparse_clear

 # archive_entry_sparse_clear
 $x->sparse_clear;

=head2 sparse_count

 # archive_entry_sparse_count
 $x->sparse_count;

=head2 sparse_next

 # archive_entry_sparse_next
 $x->sparse_next;

=head2 sparse_reset

 # archive_entry_sparse_reset
 $x->sparse_reset;

=head2 stat

 # archive_entry_stat
 $x->stat;

=head2 strmode

 # archive_entry_strmode
 $x->strmode;

=head2 symlink

 # archive_entry_symlink
 $x->symlink;

=head2 symlink_type

 # archive_entry_symlink_type (optional)
 $x->symlink_type;

=head2 symlink_utf8

 # archive_entry_symlink_utf8
 $x->symlink_utf8;

=head2 uid

 # archive_entry_uid
 $x->uid;

=head2 uname

 # archive_entry_uname
 $x->uname;

=head2 uname_utf8

 # archive_entry_uname_utf8
 $x->uname_utf8;

=head2 unset_atime

 # archive_entry_unset_atime
 $x->unset_atime;

=head2 unset_birthtime

 # archive_entry_unset_birthtime
 $x->unset_birthtime;

=head2 unset_ctime

 # archive_entry_unset_ctime
 $x->unset_ctime;

=head2 unset_mtime

 # archive_entry_unset_mtime
 $x->unset_mtime;

=head2 unset_size

 # archive_entry_unset_size
 $x->unset_size;

=head2 update_gname_utf8

 # archive_entry_update_gname_utf8
 $x->update_gname_utf8;

=head2 update_hardlink_utf8

 # archive_entry_update_hardlink_utf8
 $x->update_hardlink_utf8;

=head2 update_link_utf8

 # archive_entry_update_link_utf8
 $x->update_link_utf8;

=head2 update_pathname_utf8

 # archive_entry_update_pathname_utf8
 $x->update_pathname_utf8;

=head2 update_symlink_utf8

 # archive_entry_update_symlink_utf8
 $x->update_symlink_utf8;

=head2 update_uname_utf8

 # archive_entry_update_uname_utf8
 $x->update_uname_utf8;

=head2 xattr_add_entry

 # archive_entry_xattr_add_entry
 $x->xattr_add_entry;

=head2 xattr_clear

 # archive_entry_xattr_clear
 $x->xattr_clear;

=head2 xattr_count

 # archive_entry_xattr_count
 $x->xattr_count;

=head2 xattr_next

 # archive_entry_xattr_next
 $x->xattr_next;

=head2 xattr_reset

 # archive_entry_xattr_reset
 $x->xattr_reset;

=head1 Archive::Libarchive::EntryLinkResolver

=head2 set_strategy

 # archive_entry_linkresolver_set_strategy
 $x->set_strategy;

=head1 Archive::Libarchive::Match

=head2 exclude_entry

 # archive_match_exclude_entry
 $x->exclude_entry;

=head2 exclude_pattern

 # archive_match_exclude_pattern
 $x->exclude_pattern;

=head2 exclude_pattern_from_file

 # archive_match_exclude_pattern_from_file
 $x->exclude_pattern_from_file;

=head2 exclude_pattern_from_file_w

 # archive_match_exclude_pattern_from_file_w
 $x->exclude_pattern_from_file_w;

=head2 exclude_pattern_w

 # archive_match_exclude_pattern_w
 $x->exclude_pattern_w;

=head2 excluded

 # archive_match_excluded
 $x->excluded;

=head2 include_date

 # archive_match_include_date
 $x->include_date;

=head2 include_date_w

 # archive_match_include_date_w
 $x->include_date_w;

=head2 include_file_time

 # archive_match_include_file_time
 $x->include_file_time;

=head2 include_file_time_w

 # archive_match_include_file_time_w
 $x->include_file_time_w;

=head2 include_gid

 # archive_match_include_gid
 $x->include_gid;

=head2 include_gname

 # archive_match_include_gname
 $x->include_gname;

=head2 include_gname_w

 # archive_match_include_gname_w
 $x->include_gname_w;

=head2 include_pattern

 # archive_match_include_pattern
 $x->include_pattern;

=head2 include_pattern_from_file

 # archive_match_include_pattern_from_file
 $x->include_pattern_from_file;

=head2 include_pattern_from_file_w

 # archive_match_include_pattern_from_file_w
 $x->include_pattern_from_file_w;

=head2 include_pattern_w

 # archive_match_include_pattern_w
 $x->include_pattern_w;

=head2 include_time

 # archive_match_include_time
 $x->include_time;

=head2 include_uid

 # archive_match_include_uid
 $x->include_uid;

=head2 include_uname

 # archive_match_include_uname
 $x->include_uname;

=head2 include_uname_w

 # archive_match_include_uname_w
 $x->include_uname_w;

=head2 owner_excluded

 # archive_match_owner_excluded
 $x->owner_excluded;

=head2 path_excluded

 # archive_match_path_excluded
 $x->path_excluded;

=head2 path_unmatched_inclusions

 # archive_match_path_unmatched_inclusions
 $x->path_unmatched_inclusions;

=head2 path_unmatched_inclusions_next

 # archive_match_path_unmatched_inclusions_next
 $x->path_unmatched_inclusions_next;

=head2 path_unmatched_inclusions_next_w

 # archive_match_path_unmatched_inclusions_next_w
 $x->path_unmatched_inclusions_next_w;

=head2 set_inclusion_recursion

 # archive_match_set_inclusion_recursion (optional)
 $x->set_inclusion_recursion;

=head2 time_excluded

 # archive_match_time_excluded
 $x->time_excluded;

=head1 Archive::Libarchive::Unbound

=head2 archive_bzlib_version

 # archive_bzlib_version
 $x->archive_bzlib_version;

=head2 archive_entry_linkify

 # archive_entry_linkify
 $x->archive_entry_linkify;

=head2 archive_entry_partial_links

 # archive_entry_partial_links
 $x->archive_entry_partial_links;

=head2 archive_liblz4_version

 # archive_liblz4_version
 $x->archive_liblz4_version;

=head2 archive_liblzma_version

 # archive_liblzma_version
 $x->archive_liblzma_version;

=head2 archive_libzstd_version

 # archive_libzstd_version (optional)
 $x->archive_libzstd_version;

=head2 archive_utility_string_sort

 # archive_utility_string_sort
 $x->archive_utility_string_sort;

=head2 archive_version_details

 # archive_version_details
 $x->archive_version_details;

=head2 archive_version_number

 # archive_version_number
 $x->archive_version_number;

=head2 archive_version_string

 # archive_version_string
 $x->archive_version_string;

=head2 archive_zlib_version

 # archive_zlib_version
 $x->archive_zlib_version;

=cut
