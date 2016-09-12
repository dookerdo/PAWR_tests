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
$resp_hash = $reddit->get_link_info("52ewbi");

print $resp_hash->{'title'};

};
print("\n* TEST 1:: GET_LINK_INFO FULL seems to ");
if($@){
	$passfail = 1;
	print("FAIL... maybe update comment link");
	exit 1;
}
else{
	print("PASS.\n");
}
exit $passfail;
