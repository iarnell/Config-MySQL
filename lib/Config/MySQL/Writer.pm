package Config::MySQL::Writer;

use warnings;
use strict;

use parent 'Config::INI::Writer';

=head1 NAME

Config::MySQL::Writer - Write MySQL-style configuration files

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 stringify_value_assignment

=cut

sub stringify_value_assignment {
    my ( $self, $name, $value ) = @_;
    return "$name\n" unless defined $value;
    $self->SUPER::stringify_value_assignment($name,$value);
}

=head1 AUTHOR

Iain Arnell, C<< <iarnell at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-config-ini-mysql at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Config-MySQL>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Config::MySQL::Writer


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

1;    # End of Config::MySQL::Writer
