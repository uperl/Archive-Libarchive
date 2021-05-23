package Archive::Libarchive::API;

use strict;
use warnings;

# ABSTRACT: Comprehensive API documentation for Archive::Libarchive
# VERSION

# NOTE: This document is autogenerated from the template
# maint/tt/Doc.pm.tt
# Please see maint/README.md for details on updating.

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
 my $int = $ar->compression;

=head2 compression_name

 # archive_compression_name
 my $string = $ar->compression_name;

=head2 copy_error

 # archive_copy_error
 $ar->copy_error;

=head2 errno

 # archive_errno
 my $int = $ar->errno;

=head2 error_string

 # archive_error_string
 my $string = $ar->error_string;

=head2 file_count

 # archive_file_count
 my $int = $ar->file_count;

=head2 filter_bytes

 # archive_filter_bytes
 my $sint64 = $ar->filter_bytes;

=head2 filter_code

 # archive_filter_code
 my $int = $ar->filter_code;

=head2 filter_count

 # archive_filter_count
 my $int = $ar->filter_count;

=head2 filter_name

 # archive_filter_name
 my $string = $ar->filter_name;

=head2 format

 # archive_format
 my $int = $ar->format;

=head2 format_name

 # archive_format_name
 my $string = $ar->format_name;

=head2 position_compressed

 # archive_position_compressed
 my $sint64 = $ar->position_compressed;

=head2 position_uncompressed

 # archive_position_uncompressed
 my $sint64 = $ar->position_uncompressed;

=head2 seek_data

 # archive_seek_data
 my $sint64 = $ar->seek_data;

=head1 Archive::Libarchive::ArchiveRead

=head2 add_callback_data

 # archive_read_add_callback_data
 my $int = $r->add_callback_data;

=head2 add_passphrase

 # archive_read_add_passphrase
 my $int = $r->add_passphrase;

=head2 append_callback_data

 # archive_read_append_callback_data
 my $int = $r->append_callback_data;

=head2 append_filter

 # archive_read_append_filter
 my $int = $r->append_filter;

=head2 append_filter_program

 # archive_read_append_filter_program
 my $int = $r->append_filter_program;

=head2 append_filter_program_signature

 # archive_read_append_filter_program_signature
 my $int = $r->append_filter_program_signature;

=head2 close

 # archive_read_close
 my $int = $r->close;

=head2 data_block

 # archive_read_data_block
 my $int = $r->data_block;

=head2 data_into_fd

 # archive_read_data_into_fd
 my $int = $r->data_into_fd;

=head2 data_skip

 # archive_read_data_skip
 my $int = $r->data_skip;

=head2 extract

 # archive_read_extract
 my $int = $r->extract;

=head2 extract2

 # archive_read_extract2
 my $int = $r->extract2;

=head2 extract_set_progress_callback

 # archive_read_extract_set_progress_callback
 $r->extract_set_progress_callback;

=head2 extract_set_skip_file

 # archive_read_extract_set_skip_file
 $r->extract_set_skip_file;

=head2 format_capabilities

 # archive_read_format_capabilities
 my $int = $r->format_capabilities;

=head2 has_encrypted_entries

 # archive_read_has_encrypted_entries
 my $int = $r->has_encrypted_entries;

=head2 header_position

 # archive_read_header_position
 my $sint64 = $r->header_position;

=head2 open

 # archive_read_open
 my $int = $r->open;

=head2 open1

 # archive_read_open1
 my $int = $r->open1;

=head2 open2

 # archive_read_open2
 my $int = $r->open2;

=head2 open_FILE

 # archive_read_open_FILE
 my $int = $r->open_FILE;

=head2 open_fd

 # archive_read_open_fd
 my $int = $r->open_fd;

=head2 open_file

 # archive_read_open_file
 my $int = $r->open_file;

=head2 open_filename

 # archive_read_open_filename
 my $int = $r->open_filename;

=head2 open_filename_w

 # archive_read_open_filename_w
 my $int = $r->open_filename_w;

=head2 open_filenames

 # archive_read_open_filenames
 my $int = $r->open_filenames;

=head2 prepend_callback_data

 # archive_read_prepend_callback_data
 my $int = $r->prepend_callback_data;

=head2 set_callback_data

 # archive_read_set_callback_data
 my $int = $r->set_callback_data;

=head2 set_callback_data2

 # archive_read_set_callback_data2
 my $int = $r->set_callback_data2;

=head2 set_close_callback

 # archive_read_set_close_callback
 my $int = $r->set_close_callback;

=head2 set_filter_option

 # archive_read_set_filter_option
 my $int = $r->set_filter_option;

=head2 set_format

 # archive_read_set_format
 my $int = $r->set_format;

=head2 set_format_option

 # archive_read_set_format_option
 my $int = $r->set_format_option;

=head2 set_open_callback

 # archive_read_set_open_callback
 my $int = $r->set_open_callback;

=head2 set_option

 # archive_read_set_option
 my $int = $r->set_option;

=head2 set_options

 # archive_read_set_options
 my $int = $r->set_options;

=head2 set_passphrase_callback

 # archive_read_set_passphrase_callback
 my $int = $r->set_passphrase_callback;

=head2 set_read_callback

 # archive_read_set_read_callback
 my $int = $r->set_read_callback;

=head2 set_seek_callback

 # archive_read_set_seek_callback
 my $int = $r->set_seek_callback;

=head2 set_skip_callback

 # archive_read_set_skip_callback
 my $int = $r->set_skip_callback;

=head2 set_switch_callback

 # archive_read_set_switch_callback
 my $int = $r->set_switch_callback;

=head2 support_compression_all

 # archive_read_support_compression_all
 my $int = $r->support_compression_all;

=head2 support_compression_bzip2

 # archive_read_support_compression_bzip2
 my $int = $r->support_compression_bzip2;

=head2 support_compression_compress

 # archive_read_support_compression_compress
 my $int = $r->support_compression_compress;

=head2 support_compression_gzip

 # archive_read_support_compression_gzip
 my $int = $r->support_compression_gzip;

=head2 support_compression_lzip

 # archive_read_support_compression_lzip
 my $int = $r->support_compression_lzip;

=head2 support_compression_lzma

 # archive_read_support_compression_lzma
 my $int = $r->support_compression_lzma;

=head2 support_compression_none

 # archive_read_support_compression_none
 my $int = $r->support_compression_none;

=head2 support_compression_program

 # archive_read_support_compression_program
 my $int = $r->support_compression_program;

=head2 support_compression_program_signature

 # archive_read_support_compression_program_signature
 my $int = $r->support_compression_program_signature;

=head2 support_compression_rpm

 # archive_read_support_compression_rpm
 my $int = $r->support_compression_rpm;

=head2 support_compression_uu

 # archive_read_support_compression_uu
 my $int = $r->support_compression_uu;

=head2 support_compression_xz

 # archive_read_support_compression_xz
 my $int = $r->support_compression_xz;

=head2 support_filter_all

 # archive_read_support_filter_all
 my $int = $r->support_filter_all;

=head2 support_filter_by_code

 # archive_read_support_filter_by_code (optional)
 my $int = $r->support_filter_by_code;

=head2 support_filter_bzip2

 # archive_read_support_filter_bzip2
 my $int = $r->support_filter_bzip2;

=head2 support_filter_compress

 # archive_read_support_filter_compress
 my $int = $r->support_filter_compress;

=head2 support_filter_grzip

 # archive_read_support_filter_grzip
 my $int = $r->support_filter_grzip;

=head2 support_filter_gzip

 # archive_read_support_filter_gzip
 my $int = $r->support_filter_gzip;

=head2 support_filter_lrzip

 # archive_read_support_filter_lrzip
 my $int = $r->support_filter_lrzip;

=head2 support_filter_lz4

 # archive_read_support_filter_lz4
 my $int = $r->support_filter_lz4;

=head2 support_filter_lzip

 # archive_read_support_filter_lzip
 my $int = $r->support_filter_lzip;

=head2 support_filter_lzma

 # archive_read_support_filter_lzma
 my $int = $r->support_filter_lzma;

=head2 support_filter_lzop

 # archive_read_support_filter_lzop
 my $int = $r->support_filter_lzop;

=head2 support_filter_none

 # archive_read_support_filter_none
 my $int = $r->support_filter_none;

=head2 support_filter_program

 # archive_read_support_filter_program
 my $int = $r->support_filter_program;

=head2 support_filter_program_signature

 # archive_read_support_filter_program_signature
 my $int = $r->support_filter_program_signature;

=head2 support_filter_rpm

 # archive_read_support_filter_rpm
 my $int = $r->support_filter_rpm;

=head2 support_filter_uu

 # archive_read_support_filter_uu
 my $int = $r->support_filter_uu;

=head2 support_filter_xz

 # archive_read_support_filter_xz
 my $int = $r->support_filter_xz;

=head2 support_filter_zstd

 # archive_read_support_filter_zstd (optional)
 my $int = $r->support_filter_zstd;

=head2 support_format_7zip

 # archive_read_support_format_7zip
 my $int = $r->support_format_7zip;

=head2 support_format_all

 # archive_read_support_format_all
 my $int = $r->support_format_all;

=head2 support_format_ar

 # archive_read_support_format_ar
 my $int = $r->support_format_ar;

=head2 support_format_by_code

 # archive_read_support_format_by_code
 my $int = $r->support_format_by_code;

=head2 support_format_cab

 # archive_read_support_format_cab
 my $int = $r->support_format_cab;

=head2 support_format_cpio

 # archive_read_support_format_cpio
 my $int = $r->support_format_cpio;

=head2 support_format_empty

 # archive_read_support_format_empty
 my $int = $r->support_format_empty;

=head2 support_format_gnutar

 # archive_read_support_format_gnutar
 my $int = $r->support_format_gnutar;

=head2 support_format_iso9660

 # archive_read_support_format_iso9660
 my $int = $r->support_format_iso9660;

=head2 support_format_lha

 # archive_read_support_format_lha
 my $int = $r->support_format_lha;

=head2 support_format_mtree

 # archive_read_support_format_mtree
 my $int = $r->support_format_mtree;

=head2 support_format_rar

 # archive_read_support_format_rar
 my $int = $r->support_format_rar;

=head2 support_format_rar5

 # archive_read_support_format_rar5 (optional)
 my $int = $r->support_format_rar5;

=head2 support_format_raw

 # archive_read_support_format_raw
 my $int = $r->support_format_raw;

=head2 support_format_tar

 # archive_read_support_format_tar
 my $int = $r->support_format_tar;

=head2 support_format_warc

 # archive_read_support_format_warc
 my $int = $r->support_format_warc;

=head2 support_format_xar

 # archive_read_support_format_xar
 my $int = $r->support_format_xar;

=head2 support_format_zip

 # archive_read_support_format_zip
 my $int = $r->support_format_zip;

=head2 support_format_zip_seekable

 # archive_read_support_format_zip_seekable
 my $int = $r->support_format_zip_seekable;

=head2 support_format_zip_streamable

 # archive_read_support_format_zip_streamable
 my $int = $r->support_format_zip_streamable;

=head1 Archive::Libarchive::ArchiveWrite

=head2 add_filter

 # archive_write_add_filter
 my $int = $w->add_filter;

=head2 add_filter_b64encode

 # archive_write_add_filter_b64encode
 my $int = $w->add_filter_b64encode;

=head2 add_filter_by_name

 # archive_write_add_filter_by_name
 my $int = $w->add_filter_by_name;

=head2 add_filter_bzip2

 # archive_write_add_filter_bzip2
 my $int = $w->add_filter_bzip2;

=head2 add_filter_compress

 # archive_write_add_filter_compress
 my $int = $w->add_filter_compress;

=head2 add_filter_grzip

 # archive_write_add_filter_grzip
 my $int = $w->add_filter_grzip;

=head2 add_filter_gzip

 # archive_write_add_filter_gzip
 my $int = $w->add_filter_gzip;

=head2 add_filter_lrzip

 # archive_write_add_filter_lrzip
 my $int = $w->add_filter_lrzip;

=head2 add_filter_lz4

 # archive_write_add_filter_lz4
 my $int = $w->add_filter_lz4;

=head2 add_filter_lzip

 # archive_write_add_filter_lzip
 my $int = $w->add_filter_lzip;

=head2 add_filter_lzma

 # archive_write_add_filter_lzma
 my $int = $w->add_filter_lzma;

=head2 add_filter_lzop

 # archive_write_add_filter_lzop
 my $int = $w->add_filter_lzop;

=head2 add_filter_none

 # archive_write_add_filter_none
 my $int = $w->add_filter_none;

=head2 add_filter_program

 # archive_write_add_filter_program
 my $int = $w->add_filter_program;

=head2 add_filter_uuencode

 # archive_write_add_filter_uuencode
 my $int = $w->add_filter_uuencode;

=head2 add_filter_xz

 # archive_write_add_filter_xz
 my $int = $w->add_filter_xz;

=head2 add_filter_zstd

 # archive_write_add_filter_zstd (optional)
 my $int = $w->add_filter_zstd;

=head2 close

 # archive_write_close
 my $int = $w->close;

=head2 data_block

 # archive_write_data_block
 my $ssize_t = $w->data_block;

=head2 fail

 # archive_write_fail
 my $int = $w->fail;

=head2 finish_entry

 # archive_write_finish_entry
 my $int = $w->finish_entry;

=head2 get_bytes_in_last_block

 # archive_write_get_bytes_in_last_block
 my $int = $w->get_bytes_in_last_block;

=head2 get_bytes_per_block

 # archive_write_get_bytes_per_block
 my $int = $w->get_bytes_per_block;

=head2 open2

 # archive_write_open2 (optional)
 my $int = $w->open2;

=head2 open_fd

 # archive_write_open_fd
 my $int = $w->open_fd;

=head2 open_filename

 # archive_write_open_filename
 my $int = $w->open_filename;

=head2 open_filename_w

 # archive_write_open_filename_w
 my $int = $w->open_filename_w;

=head2 set_bytes_in_last_block

 # archive_write_set_bytes_in_last_block
 my $int = $w->set_bytes_in_last_block;

=head2 set_bytes_per_block

 # archive_write_set_bytes_per_block
 my $int = $w->set_bytes_per_block;

=head2 set_filter_option

 # archive_write_set_filter_option
 my $int = $w->set_filter_option;

=head2 set_format

 # archive_write_set_format
 my $int = $w->set_format;

=head2 set_format_7zip

 # archive_write_set_format_7zip
 my $int = $w->set_format_7zip;

=head2 set_format_ar_bsd

 # archive_write_set_format_ar_bsd
 my $int = $w->set_format_ar_bsd;

=head2 set_format_ar_svr4

 # archive_write_set_format_ar_svr4
 my $int = $w->set_format_ar_svr4;

=head2 set_format_by_name

 # archive_write_set_format_by_name
 my $int = $w->set_format_by_name;

=head2 set_format_cpio

 # archive_write_set_format_cpio
 my $int = $w->set_format_cpio;

=head2 set_format_cpio_newc

 # archive_write_set_format_cpio_newc
 my $int = $w->set_format_cpio_newc;

=head2 set_format_filter_by_ext

 # archive_write_set_format_filter_by_ext
 my $int = $w->set_format_filter_by_ext;

=head2 set_format_filter_by_ext_def

 # archive_write_set_format_filter_by_ext_def
 my $int = $w->set_format_filter_by_ext_def;

=head2 set_format_gnutar

 # archive_write_set_format_gnutar
 my $int = $w->set_format_gnutar;

=head2 set_format_iso9660

 # archive_write_set_format_iso9660
 my $int = $w->set_format_iso9660;

=head2 set_format_mtree

 # archive_write_set_format_mtree
 my $int = $w->set_format_mtree;

=head2 set_format_mtree_classic

 # archive_write_set_format_mtree_classic
 my $int = $w->set_format_mtree_classic;

=head2 set_format_option

 # archive_write_set_format_option
 my $int = $w->set_format_option;

=head2 set_format_pax

 # archive_write_set_format_pax
 my $int = $w->set_format_pax;

=head2 set_format_pax_restricted

 # archive_write_set_format_pax_restricted
 my $int = $w->set_format_pax_restricted;

=head2 set_format_raw

 # archive_write_set_format_raw
 my $int = $w->set_format_raw;

=head2 set_format_shar

 # archive_write_set_format_shar
 my $int = $w->set_format_shar;

=head2 set_format_shar_dump

 # archive_write_set_format_shar_dump
 my $int = $w->set_format_shar_dump;

=head2 set_format_ustar

 # archive_write_set_format_ustar
 my $int = $w->set_format_ustar;

=head2 set_format_v7tar

 # archive_write_set_format_v7tar
 my $int = $w->set_format_v7tar;

=head2 set_format_warc

 # archive_write_set_format_warc
 my $int = $w->set_format_warc;

=head2 set_format_xar

 # archive_write_set_format_xar
 my $int = $w->set_format_xar;

=head2 set_format_zip

 # archive_write_set_format_zip
 my $int = $w->set_format_zip;

=head2 set_option

 # archive_write_set_option
 my $int = $w->set_option;

=head2 set_options

 # archive_write_set_options
 my $int = $w->set_options;

=head2 set_passphrase

 # archive_write_set_passphrase
 my $int = $w->set_passphrase;

=head2 set_passphrase_callback

 # archive_write_set_passphrase_callback
 my $int = $w->set_passphrase_callback;

=head2 set_skip_file

 # archive_write_set_skip_file
 my $int = $w->set_skip_file;

=head2 write_header

 # archive_write_header
 my $int = $w->write_header;

=head2 zip_set_compression_deflate

 # archive_write_zip_set_compression_deflate
 my $int = $w->zip_set_compression_deflate;

=head2 zip_set_compression_store

 # archive_write_zip_set_compression_store
 my $int = $w->zip_set_compression_store;

=head1 Archive::Libarchive::DiskRead

=head2 disk_can_descend

 # archive_read_disk_can_descend
 my $int = $dr->disk_can_descend;

=head2 disk_current_filesystem

 # archive_read_disk_current_filesystem
 my $int = $dr->disk_current_filesystem;

=head2 disk_current_filesystem_is_remote

 # archive_read_disk_current_filesystem_is_remote
 my $int = $dr->disk_current_filesystem_is_remote;

=head2 disk_current_filesystem_is_synthetic

 # archive_read_disk_current_filesystem_is_synthetic
 my $int = $dr->disk_current_filesystem_is_synthetic;

=head2 disk_descend

 # archive_read_disk_descend
 my $int = $dr->disk_descend;

=head2 disk_entry_from_file

 # archive_read_disk_entry_from_file
 my $int = $dr->disk_entry_from_file;

=head2 disk_gname

 # archive_read_disk_gname
 my $string = $dr->disk_gname;

=head2 disk_open

 # archive_read_disk_open
 my $int = $dr->disk_open;

=head2 disk_open_w

 # archive_read_disk_open_w
 my $int = $dr->disk_open_w;

=head2 disk_set_atime_restored

 # archive_read_disk_set_atime_restored
 my $int = $dr->disk_set_atime_restored;

=head2 disk_set_behavior

 # archive_read_disk_set_behavior
 my $int = $dr->disk_set_behavior;

=head2 disk_set_gname_lookup

 # archive_read_disk_set_gname_lookup
 my $int = $dr->disk_set_gname_lookup;

=head2 disk_set_matching

 # archive_read_disk_set_matching
 my $int = $dr->disk_set_matching;

=head2 disk_set_metadata_filter_callback

 # archive_read_disk_set_metadata_filter_callback
 my $int = $dr->disk_set_metadata_filter_callback;

=head2 disk_set_standard_lookup

 # archive_read_disk_set_standard_lookup
 my $int = $dr->disk_set_standard_lookup;

=head2 disk_set_symlink_hybrid

 # archive_read_disk_set_symlink_hybrid
 my $int = $dr->disk_set_symlink_hybrid;

=head2 disk_set_symlink_logical

 # archive_read_disk_set_symlink_logical
 my $int = $dr->disk_set_symlink_logical;

=head2 disk_set_symlink_physical

 # archive_read_disk_set_symlink_physical
 my $int = $dr->disk_set_symlink_physical;

=head2 disk_set_uname_lookup

 # archive_read_disk_set_uname_lookup
 my $int = $dr->disk_set_uname_lookup;

=head2 disk_uname

 # archive_read_disk_uname
 my $string = $dr->disk_uname;

=head1 Archive::Libarchive::DiskWrite

=head2 disk_gid

 # archive_write_disk_gid
 my $sint64 = $dw->disk_gid;

=head2 disk_set_group_lookup

 # archive_write_disk_set_group_lookup
 my $int = $dw->disk_set_group_lookup;

=head2 disk_set_options

 # archive_write_disk_set_options
 my $int = $dw->disk_set_options;

=head2 disk_set_skip_file

 # archive_write_disk_set_skip_file
 my $int = $dw->disk_set_skip_file;

=head2 disk_set_standard_lookup

 # archive_write_disk_set_standard_lookup
 my $int = $dw->disk_set_standard_lookup;

=head2 disk_set_user_lookup

 # archive_write_disk_set_user_lookup
 my $int = $dw->disk_set_user_lookup;

=head2 disk_uid

 # archive_write_disk_uid
 my $sint64 = $dw->disk_uid;

=head1 Archive::Libarchive::Entry

=head2 acl_add_entry

 # archive_entry_acl_add_entry
 my $int = $e->acl_add_entry;

=head2 acl_add_entry_w

 # archive_entry_acl_add_entry_w
 my $int = $e->acl_add_entry_w;

=head2 acl_clear

 # archive_entry_acl_clear
 $e->acl_clear;

=head2 acl_count

 # archive_entry_acl_count
 my $int = $e->acl_count;

=head2 acl_from_text

 # archive_entry_acl_from_text (optional)
 my $int = $e->acl_from_text;

=head2 acl_from_text_w

 # archive_entry_acl_from_text_w (optional)
 my $int = $e->acl_from_text_w;

=head2 acl_next

 # archive_entry_acl_next
 my $int = $e->acl_next;

=head2 acl_reset

 # archive_entry_acl_reset
 my $int = $e->acl_reset;

=head2 acl_text

 # archive_entry_acl_text
 my $string = $e->acl_text;

=head2 acl_text_w

 # archive_entry_acl_text_w
 my $wstring = $e->acl_text_w;

=head2 acl_to_text

 # archive_entry_acl_to_text (optional)
 my $string = $e->acl_to_text;

=head2 acl_to_text_w

 # archive_entry_acl_to_text_w (optional)
 my $wstring = $e->acl_to_text_w;

=head2 acl_types

 # archive_entry_acl_types (optional)
 my $int = $e->acl_types;

=head2 atime

 # archive_entry_atime
 my $time_t = $e->atime;

=head2 atime_is_set

 # archive_entry_atime_is_set
 my $int = $e->atime_is_set;

=head2 atime_nsec

 # archive_entry_atime_nsec
 my $long = $e->atime_nsec;

=head2 birthtime

 # archive_entry_birthtime
 my $time_t = $e->birthtime;

=head2 birthtime_is_set

 # archive_entry_birthtime_is_set
 my $int = $e->birthtime_is_set;

=head2 birthtime_nsec

 # archive_entry_birthtime_nsec
 my $long = $e->birthtime_nsec;

=head2 clear

 # archive_entry_clear
 my $archive_entry = $e->clear;

=head2 clone

 # archive_entry_clone
 my $archive_entry = $e->clone;

=head2 copy_fflags_text

 # archive_entry_copy_fflags_text
 my $string = $e->copy_fflags_text;

=head2 copy_fflags_text_w

 # archive_entry_copy_fflags_text_w
 my $wstring = $e->copy_fflags_text_w;

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
 my $time_t = $e->ctime;

=head2 ctime_is_set

 # archive_entry_ctime_is_set
 my $int = $e->ctime_is_set;

=head2 ctime_nsec

 # archive_entry_ctime_nsec
 my $long = $e->ctime_nsec;

=head2 dev

 # archive_entry_dev
 my $dev_t = $e->dev;

=head2 dev_is_set

 # archive_entry_dev_is_set
 my $int = $e->dev_is_set;

=head2 devmajor

 # archive_entry_devmajor
 my $dev_t = $e->devmajor;

=head2 devminor

 # archive_entry_devminor
 my $dev_t = $e->devminor;

=head2 digest

 # archive_entry_digest (optional)
 my $ = $e->digest;

=head2 fflags

 # archive_entry_fflags
 $e->fflags;

=head2 fflags_text

 # archive_entry_fflags_text
 my $string = $e->fflags_text;

=head2 filetype

 # archive_entry_filetype
 my $mode_t = $e->filetype;

=head2 gid

 # archive_entry_gid
 my $sint64 = $e->gid;

=head2 gname

 # archive_entry_gname
 my $string = $e->gname;

=head2 gname_utf8

 # archive_entry_gname_utf8
 my $string_utf8 = $e->gname_utf8;

=head2 hardlink

 # archive_entry_hardlink
 my $string = $e->hardlink;

=head2 hardlink_utf8

 # archive_entry_hardlink_utf8
 my $string_utf8 = $e->hardlink_utf8;

=head2 ino

 # archive_entry_ino
 my $sint64 = $e->ino;

=head2 ino64

 # archive_entry_ino64
 my $sint64 = $e->ino64;

=head2 ino_is_set

 # archive_entry_ino_is_set
 my $int = $e->ino_is_set;

=head2 is_data_encrypted

 # archive_entry_is_data_encrypted
 my $int = $e->is_data_encrypted;

=head2 is_encrypted

 # archive_entry_is_encrypted
 my $int = $e->is_encrypted;

=head2 is_metadata_encrypted

 # archive_entry_is_metadata_encrypted
 my $int = $e->is_metadata_encrypted;

=head2 mac_metadata

 # archive_entry_mac_metadata
 my $opaque = $e->mac_metadata;

=head2 mode

 # archive_entry_mode
 my $mode_t = $e->mode;

=head2 mtime

 # archive_entry_mtime
 my $time_t = $e->mtime;

=head2 mtime_is_set

 # archive_entry_mtime_is_set
 my $int = $e->mtime_is_set;

=head2 mtime_nsec

 # archive_entry_mtime_nsec
 my $long = $e->mtime_nsec;

=head2 nlink

 # archive_entry_nlink
 my $uint = $e->nlink;

=head2 pathname

 # archive_entry_pathname
 my $string = $e->pathname;

=head2 pathname_utf8

 # archive_entry_pathname_utf8
 my $string_utf8 = $e->pathname_utf8;

=head2 perm

 # archive_entry_perm
 my $mode_t = $e->perm;

=head2 rdev

 # archive_entry_rdev
 my $dev_t = $e->rdev;

=head2 rdevmajor

 # archive_entry_rdevmajor
 my $dev_t = $e->rdevmajor;

=head2 rdevminor

 # archive_entry_rdevminor
 my $dev_t = $e->rdevminor;

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
 my $sint64 = $e->size;

=head2 size_is_set

 # archive_entry_size_is_set
 my $int = $e->size_is_set;

=head2 sourcepath

 # archive_entry_sourcepath
 my $string = $e->sourcepath;

=head2 sourcepath_w

 # archive_entry_sourcepath_w
 my $wstring = $e->sourcepath_w;

=head2 sparse_add_entry

 # archive_entry_sparse_add_entry
 $e->sparse_add_entry;

=head2 sparse_clear

 # archive_entry_sparse_clear
 $e->sparse_clear;

=head2 sparse_count

 # archive_entry_sparse_count
 my $int = $e->sparse_count;

=head2 sparse_next

 # archive_entry_sparse_next
 my $int = $e->sparse_next;

=head2 sparse_reset

 # archive_entry_sparse_reset
 my $int = $e->sparse_reset;

=head2 stat

 # archive_entry_stat
 my $ = $e->stat;

=head2 strmode

 # archive_entry_strmode
 my $string = $e->strmode;

=head2 symlink

 # archive_entry_symlink
 my $string = $e->symlink;

=head2 symlink_type

 # archive_entry_symlink_type (optional)
 my $int = $e->symlink_type;

=head2 symlink_utf8

 # archive_entry_symlink_utf8
 my $string_utf8 = $e->symlink_utf8;

=head2 uid

 # archive_entry_uid
 my $sint64 = $e->uid;

=head2 uname

 # archive_entry_uname
 my $string = $e->uname;

=head2 uname_utf8

 # archive_entry_uname_utf8
 my $string_utf8 = $e->uname_utf8;

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
 my $int = $e->update_gname_utf8;

=head2 update_hardlink_utf8

 # archive_entry_update_hardlink_utf8
 my $int = $e->update_hardlink_utf8;

=head2 update_link_utf8

 # archive_entry_update_link_utf8
 my $int = $e->update_link_utf8;

=head2 update_pathname_utf8

 # archive_entry_update_pathname_utf8
 my $int = $e->update_pathname_utf8;

=head2 update_symlink_utf8

 # archive_entry_update_symlink_utf8
 my $int = $e->update_symlink_utf8;

=head2 update_uname_utf8

 # archive_entry_update_uname_utf8
 my $int = $e->update_uname_utf8;

=head2 xattr_add_entry

 # archive_entry_xattr_add_entry
 $e->xattr_add_entry;

=head2 xattr_clear

 # archive_entry_xattr_clear
 $e->xattr_clear;

=head2 xattr_count

 # archive_entry_xattr_count
 my $int = $e->xattr_count;

=head2 xattr_next

 # archive_entry_xattr_next
 my $int = $e->xattr_next;

=head2 xattr_reset

 # archive_entry_xattr_reset
 my $int = $e->xattr_reset;

=head1 Archive::Libarchive::EntryLinkResolver

=head2 set_strategy

 # archive_entry_linkresolver_set_strategy
 $lr->set_strategy;

=head1 Archive::Libarchive::Match

=head2 exclude_entry

 # archive_match_exclude_entry
 my $int = $m->exclude_entry;

=head2 exclude_pattern

 # archive_match_exclude_pattern
 my $int = $m->exclude_pattern;

=head2 exclude_pattern_from_file

 # archive_match_exclude_pattern_from_file
 my $int = $m->exclude_pattern_from_file;

=head2 exclude_pattern_from_file_w

 # archive_match_exclude_pattern_from_file_w
 my $int = $m->exclude_pattern_from_file_w;

=head2 exclude_pattern_w

 # archive_match_exclude_pattern_w
 my $int = $m->exclude_pattern_w;

=head2 excluded

 # archive_match_excluded
 my $int = $m->excluded;

=head2 include_date

 # archive_match_include_date
 my $int = $m->include_date;

=head2 include_date_w

 # archive_match_include_date_w
 my $int = $m->include_date_w;

=head2 include_file_time

 # archive_match_include_file_time
 my $int = $m->include_file_time;

=head2 include_file_time_w

 # archive_match_include_file_time_w
 my $int = $m->include_file_time_w;

=head2 include_gid

 # archive_match_include_gid
 my $int = $m->include_gid;

=head2 include_gname

 # archive_match_include_gname
 my $int = $m->include_gname;

=head2 include_gname_w

 # archive_match_include_gname_w
 my $int = $m->include_gname_w;

=head2 include_pattern

 # archive_match_include_pattern
 my $int = $m->include_pattern;

=head2 include_pattern_from_file

 # archive_match_include_pattern_from_file
 my $int = $m->include_pattern_from_file;

=head2 include_pattern_from_file_w

 # archive_match_include_pattern_from_file_w
 my $int = $m->include_pattern_from_file_w;

=head2 include_pattern_w

 # archive_match_include_pattern_w
 my $int = $m->include_pattern_w;

=head2 include_time

 # archive_match_include_time
 my $int = $m->include_time;

=head2 include_uid

 # archive_match_include_uid
 my $int = $m->include_uid;

=head2 include_uname

 # archive_match_include_uname
 my $int = $m->include_uname;

=head2 include_uname_w

 # archive_match_include_uname_w
 my $int = $m->include_uname_w;

=head2 owner_excluded

 # archive_match_owner_excluded
 my $int = $m->owner_excluded;

=head2 path_excluded

 # archive_match_path_excluded
 my $int = $m->path_excluded;

=head2 path_unmatched_inclusions

 # archive_match_path_unmatched_inclusions
 my $int = $m->path_unmatched_inclusions;

=head2 path_unmatched_inclusions_next

 # archive_match_path_unmatched_inclusions_next
 my $int = $m->path_unmatched_inclusions_next;

=head2 path_unmatched_inclusions_next_w

 # archive_match_path_unmatched_inclusions_next_w
 my $int = $m->path_unmatched_inclusions_next_w;

=head2 set_inclusion_recursion

 # archive_match_set_inclusion_recursion (optional)
 my $int = $m->set_inclusion_recursion;

=head2 time_excluded

 # archive_match_time_excluded
 my $int = $m->time_excluded;

=head1 NOT IMPLEMENTED

The following methods are not currently implemented.  The reason for this
is usually for one of 1) the method doesn't make sense in the context of
Perl 2) the methods have been renamed, and this is the old name kept for
compatibility in C<libarchive> 3) the methods have deprecated and will
be removed in a future version of C<libarchive> 4) we haven't gotten around
to writing bindings for them.

=over 4

=item archive_bzlib_version

=item archive_entry_acl

=item archive_entry_gname_w

=item archive_entry_hardlink_w

=item archive_entry_linkify

=item archive_entry_partial_links

=item archive_entry_pathname_w

=item archive_entry_symlink_w

=item archive_entry_uname_w

=item archive_free

=item archive_liblz4_version

=item archive_liblzma_version

=item archive_libzstd_version

=item archive_read_finish

=item archive_read_next_header

=item archive_read_open_memory2

=item archive_utility_string_sort

=item archive_version_details

=item archive_version_number

=item archive_version_string

=item archive_write_finish

=item archive_write_open_file

=item archive_write_open_memory

=item archive_write_set_compression_bzip2

=item archive_write_set_compression_compress

=item archive_write_set_compression_gzip

=item archive_write_set_compression_lzip

=item archive_write_set_compression_lzma

=item archive_write_set_compression_none

=item archive_write_set_compression_program

=item archive_write_set_compression_xz

=item archive_zlib_version

=back

=cut
