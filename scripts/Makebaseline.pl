#!C:\Perl64\bin\perl.exe
use strict;
use warnings;

my $arry;
my $i = 0;
my $j = $.;
my $act = 'C:\SCM\Baselines\T2_Sw_Dev\20160415\BaselineDCAs.csv';
open (ACT, "$act") || die $!;
my @arr = <ACT>;
print '-'x 50,"\n";
print "activities included :","\n";
print @arr,"\n";
print '-'x 50,"\n";
my $baseline = 'T2_SW_Dev_04_15_2016';
print"Baseline name: $baseline","\n";
print '-'x 50,"\n";
print "BASELINE $baseline STATUS AS SHOWN BELOW","\n";
print '-'x 50,"\n";
system("cleartool mkbl -full -activities @arr $baseline");
close(ACT);
