#!/usr/bin/perl

use lib './lib';
use strict;
use Test::More tests => 8;

BEGIN { use_ok( 'Data::Validate::Common' ); }
BEGIN { use_ok( 'Data::Validate::Domain' ); }

my $validate = Data::Validate::Common->new();
isa_ok($validate, 'Data::Validate::Common');

my $mail = [
    'ich@hier.com',
    'ich+mail@hier.com',
    'ich-mail@hier.com',
    'ich_mail@hier.com',
    'ich.mail@hier.com',
];

foreach my $mail (@{$mail}) {
    is($validate->is_email($mail), $mail, 'testing: is_email '.$mail);
}
