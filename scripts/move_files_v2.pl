#!C:\Perl64\bin\perl.exe
use strict;
use warnings;
my $start = time;
my $i = 0;
my $j = 0;
my @arr; 
my $file = 'C:\Gnanesh\SCM\CodePromotions\04152016\Movement_related_errorDCA_rem.csv';
open (FILE, "$file") || die $!;
my $pre = <FILE>;
my @valp = (split /,/, $pre);
print '-'x 150,"\n";
print "IF THE VALUE EXITED WITH VALUE 1 REQUIRE TO RECHECK","\n";
print '-'x 150,"\n";
system("cleartool setact $valp[1]") ;
system ("cleartool chact -fcset $valp[0] -tcset $valp[1] $valp[2]");
if ($? == -1)
												{
												printf  "failed to execute: $!","\n";
												}
												elsif($? & 127)	
												{
												printf "child died with signal %d, %s coredump\n", ($? & 127),  ($? & 128) ? 'with' : 'without';
												}	
												else{
												print "line number:$.","\n","Status in moving $valp[2] to $valp[1]","\n";	
												printf "exited with value %d\n", $? >> 8;
												print '-'x 150,"\n";
												if(($?>> 8) == 1)
													 {
													  $arr[$i] = $.;
													  $i++;
													  $j++;
													 }
												}	



my $prevdest = $valp[1];
while ( my $cur = <FILE> )
                {
                               
                    my @valc = (split /,/, $cur);
								my $src =$valc[0];
                                my $dest = $valc[1];
                                my $fpath = $valc[2] ;
                                my $destp = $valp[1];
                                $pre = $cur;
                                if($dest =~ m/$destp/)
                                                {
												if($dest ne $prevdest)
												{
													system ("cleartool setact $dest");
												}
                                                $prevdest = $valc[1];
												system("cleartool chact -fcset $src -tcset $dest $fpath");
												
												if ($? == -1)
												{
												printf  "failed to execute: $!","\n";
												
												}
												elsif($? & 127)	
												{
												printf "child died with signal %d, %s coredump\n", ($? & 127),  ($? & 128) ? 'with' : 'without';
												}
												else{
												print "line number:$.","\n","Status in moving $fpath to $dest","\n";
												printf "exited with value %d\n", $? >> 8;
												print '-'x 150,"\n";
													 if(($?>> 8) == 1)
													 {
													  $arr[$i] = $.;
													  $i++;
													  $j++;
													 }
												}	

													 
													
												
																									                                                              
                                                }
												
                                elsif($dest !~ m/$destp/)    
                                                {
												if($dest ne $prevdest)
												{
													system ("cleartool setact $dest");
												}
                                                $prevdest = $valc[1];
												system("cleartool chact -fcset $src -tcset $dest $fpath");
												
												if ($? == -1)
												{
												printf  "failed to execute: $!","\n";
												
												}
												elsif($? & 127)	
												{
												printf "child died with signal %d, %s coredump\n", ($? & 127),  ($? & 128) ? 'with' : 'without';

												}
												else{
												print "line number:$.","\n","Status in moving $fpath to $dest","\n";	
												printf "exited with value %d\n", $? >> 8;
												print '-'x 150,"\n";
												if(($?>> 8) == 1)
													 {
													  $arr[$i] = $.;
													  $i++;
													  $j++;
													 }
												}	

                                                
												}
												
								                                              
											 
                }
				END { 
	my $finish = time;	
	my $total = $finish - $start;
	my $sec = time - $^T;
	#print "$total seconds taken","\n";
	print "Script took  $sec seconds to run","\n";
	print " $i failed in processing ","at the line numbers @arr","\n";
 
}


 
close (FILE);
