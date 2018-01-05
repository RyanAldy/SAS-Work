/* proc import datafile='C:\Users\Admin\Documents\SAS\titanic_output.csv'
				      out=titanic_data
				      replace;

getnames=YES;
*/

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

proc print data=titanic_data_new NOOBS;
where Age <= 18;
var Sex Age Parch Survived;
run;

proc univariate data=titanic_data_new;
run;

/* Not available in WPS */
/* proc sgplot data=titanic_data_new;
vbar Age;
run; */

proc export
OUTFILE="C:\Users\Admin\Documents\SAS\titanic_output_cleaned.csv"
REPLACE;

proc univariate data=titanic_data_new;
histogram Age / vscale = count;


proc freq data=titanic_data_new;
tables Sex*Survived;
run;

proc freq data=titanic_data_new;
tables Sex*Survived*Parch;
run;

