data pay_details;

input Initials $ Gender $ Age Hourly_pay DOB;
informat DOB DDMMYY10.;
format DOB DDMMYY10.;

datalines;
TK M 23 12.35 12/05/1994
JH M 24 34.32 30/01/1993
LC F 26 34.65 06/08/1991
MN F 45 26.76 04/11/1972
ZT M 18 11.22 11/02/1999
DY F 30 40.44 12/12/1986
RA M 26 40.00 13/12/1991
MC F 26 40.00 31/10/1991
BA M 24 32.00 07/11/1993
CS M 24 30.00 15/03/1994
;
run;
proc print data=pay_details NOOBS;
title 'Example Pay Data UK';
run;

proc print data=pay_details NOOBS;
title 'Example Pay Data Japan';
format DOB YYMMDD10.;
run;

proc print data=pay_details NOOBS;
title 'Example Pay Data US';
format DOB MMDDYY10.;
run;

proc export
OUTFILE="C:\Users\Admin\Documents\SAS\SAS_output.csv"
REPLACE;

proc print data=pay_details NOOBS;
ID Initials;
var Gender Age;
run; 
