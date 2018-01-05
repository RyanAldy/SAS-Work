/* proc import datafile='C:\Users\Admin\Documents\SAS\titanic_output.csv'
				      out=titanic_data
				      replace;

getnames=YES;
*/

%LET title = "Titanic Data";
%LET my_dataset = %STR(&SYSLAST);

%MACRO scatter_test (data, var1, var2);
	TITLE 'My Graph';
	PROC gplot  DATA=&data;
	   PLOT &var1*&var2;
	   title &var1 'and' &var2;
	RUN;
%MEND scatter_test;


data titanic_data;
infile 'C:\Users\Admin\Documents\SAS\titanic_output.csv' dsd firstobs=2;
input Pass_id
	Survived 
	pclass
	name :$60.
	sex $
	age
	sibsp
	parch
	ticket :$30.
	Fare
	Cabin :$15.
	Embarked $;

run;


data titanic_data_new;

set titanic_data;

/* Adds new column social_status to Dataset */

if Cabin = " " and Fare < 20  then social_status = "L";
else if Cabin NE " " and Fare > 50 then social_status = "H";
else social_status = "M";

run;

/* Call Macro */
%scatter_test(titanic_data_new, age, social_status)


proc print data=&my_dataset NOOBS;
title &title &SYSDATE9;
run;


proc freq data=titanic_data_new;
title 'Social status comparison of Titanic survivors';
tables social_status*Survived;
run;

proc gchart data=titanic_data_new;
title1 'Social Status and Age';
vbar age / discrete group=social_status patternID=group;
run;



