#!/usr/bin/perl -w
# GET_USER_SUBMITTED_TEST
# tests the PAWR function get_user_submitted

use lib "$ENV{HOME}/GIT/PAWR/lib";
use PAWR;
require LWP::UserAgent;

my $ua = LWP::UserAgent->new;
my $passfail = 0;

$reddit = PAWR->new();

eval {
$resp_hash = $reddit->get_user_submitted({username =>"perl_bot"});
unless(${$resp_hash}[0]->{id} =~ m/([\w\d]{2,8})/){$passfail = 1}
};

print("\n* TEST 1:: GET_USER_OVERVIEW FULL seems to ");
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
