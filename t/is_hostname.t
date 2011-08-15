#!/usr/bin/perl

use lib './lib';
use strict;
use Test::More tests => 7;

BEGIN { use_ok( 'Data::Validate::Common' ); }
BEGIN { use_ok( 'Data::Validate::Domain' ); }

my $validate = Data::Validate::Common->new();
isa_ok($validate, 'Data::Validate::Common');

my $domains = [
    'www.hier.com',
    'ww-w.hier.me',
    'ww.w.hier.geek.nz',
    'xn--w.hier.travel',
];

foreach my $domain (@{$domains}) {
    is($validate->is_domain($domain), $domain, 'testing: is_domain '.$domain);
}
