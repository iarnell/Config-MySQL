#!perl

use strict;
use warnings;

use Test::More;    # last test to print

use_ok('Config::MySQL::Reader');

my $hashref = Config::MySQL::Reader->read_file('t/my.cnf');
isa_ok( $hashref, 'HASH', 'return of Config::MySQL::Reader->read_file' );

my $expected = {
    'mysqld' => {
        'datadir'      => '/var/lib/mysql',
        'skip-locking' => undef,
    },
    'mysqldump' => {
        'quick'              => undef,
        'max_allowed_packet' => '16M',
    },
};

is_deeply( $hashref, $expected, 'Config structure matches expected' );

done_testing;
