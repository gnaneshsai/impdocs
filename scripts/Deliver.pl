#!C:\Perl64\bin\perl.exe
use strict;
use warnings;

my $arry;
my $i = 0;
my $j = $.;
my $act = 'C:\SCM\Baselines\T2_Sw_Dev\20160418_deliver\BaselineDCAs.csv';
open (ACT, "$act") || die $!;
my @arr = <ACT>;
print '-'x 50,"\n";
print "activities included :","\n";
print @arr,"\n";
print '-'x 50,"\n";
my $int_view = '6s5g_T2_SW_Dev_int';
print"Integration view: $int_view","\n";
print '-'x 50,"\n";
print "Deliver to $int_view STATUS AS SHOWN BELOW","\n";
print '-'x 50,"\n";
#system( "cleartool deliver -preview -stream stream:T2_SW_Dev@\\t2_pvob -activities @arr -to $int_view");
system("cleartool deliver -force -stream stream:T2_SW_Dev@\\t2_pvob -to $int_view -target stream:T2_SrcCd_Main_Dev@\\t2_pvob -activities @arr");
#system("cleartool deliver -complete -force -stream stream:T2_SW_Dev@\\t2_pvob -to $int_view -target stream:T2_SrcCd_Main_Dev@\\t2_pvob -activities @arr");
close(ACT);

