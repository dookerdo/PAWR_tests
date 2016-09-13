#!/usr/bin/perl -w
# GET_LINK_INFO_TEST
# tests the PAWR function get_link_info

use lib "$ENV{HOME}/GIT/PAWR/lib";
use PAWR;
require LWP::UserAgent;

my $ua = LWP::UserAgent->new;
my $passfail = 0;

$reddit = PAWR->new();

eval {
$resp_hash = $reddit->get_user_info("test");

unless($resp_hash->{id} =~ m/[\w\d]/){ $passfail = 1;}	
};

print("\n* TEST 1:: GET_USER_INFO FULL seems to ");
if($@){
	$passfail = 1;
	print("FAIL... maybe update comment link");
	exit 1;
}
else{
	print("PASS.\n");
}
exit $passfail;
