#!/usr/bin/perl -w
# GET_SUBREDDIT_TESTER
# tests the function get_subreddit from the PAWR module
#


use lib "$ENV{HOME}/GIT/PAWR/lib";
use PAWR;
require LWP::UserAgent;

my $ua = LWP::UserAgent->new;
my $passfail = 0;

##TEST 1 GET PAGE JSON
$response = $ua->get("http://www.reddit.com/r/test/hot.json");
if($response->is_success){
	print("* TEST 1:: HTTP JSON QUERY - PASS...");
}
else{
	print("* TEST 1:: HTTP JSON QUERY - FAIL...");
	$passfail = 1;
}
print("\n\n");

$reddit = PAWR->new();
@subreddits = ("test","what");

foreach(@subreddits){
	push(@post,$reddit->get_subreddit({'sort'=>'hot','limit'=>10,'subreddit'=>"$_"}));
}
my $is_okay = 0;

foreach(@post){
	$url = $_->{'url'};
	if($url =~ m/http:*/){
		print("* TEST 2:: REDDIT PAGE URL'S READABLE - PASS... : $url\n\n");
		last;
	}
	else{
		print("* TEST 2:: REDDIT PAGE URL'S READABLE - FAIL... Check url: $url"); 
		$passfail = 1;
	}
}

print("GET_SUBREDDIT seems to "); 

if($passfail == 0){
	print("PASS.\n");
	exit 0;
}
else{
	print("FAIL.\n");
	exit 1;
}
