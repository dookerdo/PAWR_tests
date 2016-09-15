#!/usr/bin/perl -w
# USERNAME_AVAILABLE
# tests the PAWR function username_available

use lib "$ENV{HOME}/GIT/PAWR/lib";
use PAWR;
require LWP::UserAgent;


my $ua = LWP::UserAgent->new;
my $passfail = 0;
my $resp_hash;

$reddit = PAWR->new();

eval {
$resp = $reddit->username_available('schiftyfive');
$passfail = 1 unless ($resp eq 'false');
};

print("\n* TEST 1:: USERNAME_AVAILABLE seems to ");
if($@){
	print("\n$@\n");
	$passfail = 1;
	print("FAIL... maybe update comment link");
	exit 1;
}
else{
	print("PASS.\n");
}
exit $passfail;
