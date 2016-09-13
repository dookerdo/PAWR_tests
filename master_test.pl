#!/usr/bin/perl -w
#MASTER TEST - attempts to test all PAWR modules
#
print("INITIATING TEST...\n\n");

@tests = ("get_link_info_test.pl",
	"get_subreddit_test.pl",
	"get_user_info_test.pl");
foreach(@tests){
	sleep(4);
	chomp;
	system("perl $_");
}

print("\n\nTESTS COMPLETED.");

