#!/usr/bin/env perl
use v5.14;
use AnyEvent::I3;

my $ws = i3->get_workspaces->recv;
exit unless ref $ws eq 'ARRAY';

my ($focused) = grep $_->{focused}, @$ws;
my $num = $focused->{num};

system 'i3-input', '-F', qq(rename workspace to "$num: %s"), '-P', 'New name: ';
