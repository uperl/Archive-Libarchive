package Archive::Libarchive::Entry::LinkResolver;

use strict;
use warnings;
use 5.020;
use Archive::Libarchive::Lib;
use experimental qw( signatures );

# ABSTRACT: Libarchive entry link resolver class
# VERSION

my $ffi = Archive::Libarchive::Lib->ffi;

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 CONSTRUCTOR

=head2 new

 my $r = Archive::Libarchive::Entry::LinkResolver->new;
 
Create a new entry link resolver object.

=cut

$ffi->mangler(sub ($name) { "archive_entry_linkresolver_$name"  });

$ffi->attach( new => [] => 'opaque' => sub {
  my($xsub, $class) = @_;
  my $ptr = $xsub->();
  bless \$ptr, $class;
});

$ffi->attach( [ free => 'DESTROY' ] => ['archive_entry_linkresolver'] => 'void' );

require Archive::Libarchive::Lib::Entry::LinkResolver unless $Archive::Libarchive::no_gen;

1;
