#!perl

use strict;
use warnings;

use Test::More 'no_plan';

my $R = 'Config::MySQL::Reader';
my $W = 'Config::MySQL::Writer';

use_ok($_) for $R, $W;

my $data = {
    'mysqld' => {
        'a' => 1,
        'b' => 'b',
        'c' => undef,
    },
};

is_deeply( $R->read_string( $W->write_string($data) ),
    $data, 'we can round-trip hashy data' );

is_deeply( $R->read_string( $W->new->write_string($data) ),
    $data, 'we can round-trip hashy data, object method' );

my $ordered_data = [
    'mysqld' => [
        'a' => 1,
        'b' => 'b',
        'c' => undef,
    ],
];

my $expected = <<'END_INI';
[mysqld]
a = 1
b = b
c
END_INI

is( $W->write_string($ordered_data), $expected, 'stringifying data' );

