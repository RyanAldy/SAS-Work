data demo_demographics;
input Initials $ Gender $ Age Hourly_Pay DOB;
informat DOB DDMMYY10.;
format DOB DDMMYY10.;
datalines;
TK M 23 12.35 12/05/1994
JH M 24 34.32 30/01/1993
LC F 26 34.65 06/08/1991
MN F 45 26.76 04/11/1972
ZT M 18 11.22 11/02/1999
DY F 30 40.44 12/12/1986
;
run;
proc print data=demo_demographics NOOBS;
title 'Example Demographics Data';
format DOB DDMMYY10.;
run;