package Config::MySQL::Reader;

use warnings;
use strict;

use base 'Config::INI::Reader';

=head1 NAME

Config::MySQL::Reader - Read MySQL-style configuration files

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

If F<my.cnf> contains

    [mysqld]
    datadir=/var/lib/mysql
    skip-locking

    [mysqldump]
    quick
    max_allowed_packet = 16M

Then when your program contains

    my $config = Config::MySQL::Reader->read_file('my.cnf');

C<$config> will contain

    {
        'mysqld' => {
            'datadir'      => '/var/lib/mysql',
            'skip-locking' => undef,
        },
        'mysqldump' => {
            'quick'              => undef,
            'max_allowed_packet' => '16M',
        },
    }

=head1 DECSRIPTION

This module extends L<Config::INI::Reader> to support reading
MySQL-style configuration files.  Although deceptively similar to
standard C<.INI> files, they can include bare boolean options with no
value assignment.

=head1 METHODS FOR READING CONFIG

=head2 read_file, read_string, and read_handle

See L<Config::INI::Reader/"METHODS FOR READING CONFIG"> for usage details.

=head1 OVERRIDDEN METHODS

=head2 parse_value_assignment

Copes with MySQL-style boolean properties that have no value assignment.

=cut

sub parse_value_assignment {
    return ( $1, $2 ) if $_[1] =~ /^\s*([^=\s][^=]*?)(?:\s*=\s*(.*?)\s*)?$/;
    return;
}

=head2 can_ignore

Handle C<!include> and C<!includedir> directives.

=cut

sub can_ignore {
    my ( $self, $line ) = @_;
    if ( $line =~ /^\s*(\!include(?:dir)?)\s+(.*?)\s*$/ ) {
        push @{$self->{data}{$self->starting_section}{$1}}, $2;
        return 1;
    }
    $self->SUPER::can_ignore($line);
}

=head1 SEE ALSO

=over

=item L<Config::INI>

=item L<MySQL::Config>

=item L<Config::Extend::MySQL>

=back

=head1 AUTHOR

Iain Arnell, C<< <iarnell at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-config-ini-mysql at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Config-MySQL>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Config::MySQL::Reader


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Config-MySQL>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Config-MySQL>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Config-MySQL>

=item * Search CPAN

L<http://search.cpan.org/dist/Config-MySQL/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2010 Iain Arnell.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1;    # End of Config::MySQL::Reader
