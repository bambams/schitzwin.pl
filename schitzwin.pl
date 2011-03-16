# 
# schitzwin.pl is an irssi script that logs your message to a window.
# Copyright (C) 2010 Brandon McCaig
# 
# This file is part of schitzwin.pl.
# 
# schitzwin.pl is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
# 
# schitzwin.pl is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with schitzwin.pl.  If not, see <http://www.gnu.org/licenses/>.
# 

# Print own messages to window named "schitzo".

use strict;
use warnings;

use Irssi;
use vars qw($VERSION %IRSSI);

$VERSION = '0.01';
%IRSSI = (
    authors => 'Brandon McCaig',
    contact => 'bamccaig@gmail.com',
    name => 'schitzwin',
    description => 'Print own messages to window named "schitzo"',
    license => 'GPLv2+',
    url => 'http://castopulence.org/schitzwin/',
    changed => 'Wed Mar 16 13:59:52 EDT 2011'
);

sub sig_print_own
{
    my ($server, $msg, $target, $orig_target) = @_;
    my $window = Irssi::window_find_name('schitzo') or return;

    $msg =~ s/%/%%/g;

    $window->print("$target: $msg", MSGLEVEL_CLIENTCRAP);
}

if(!Irssi::window_find_name('schitzo'))
{
    Irssi::print('Create a window named "schitzo"');
}

Irssi::signal_add('message own_public', 'sig_print_own');
Irssi::signal_add('message own_private', 'sig_print_own');

