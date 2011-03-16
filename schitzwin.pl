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

