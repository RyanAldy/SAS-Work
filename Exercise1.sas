data person_details;

input name $ age height;
informat height 4.2;

Giant = "No ";

if height > 3.00 then
	Giant = "Yes";


datalines;
Ryan 26 167
Michelle 26 165
Joe 18 160
John 25 177
Mark 55 180
Steven 30 175
Brett 24 175
Luke 22 178
Conor 24 165
David 40 350
;
run;

proc print data=person_details NOOBS;
var age height Giant;
title 'Person Details';
run;
