/* proc import datafile='C:\Users\Admin\Documents\SAS\titanic_100.csv'
				      out=titanic_data
				      replace;

getnames=YES;
*/

data titanic_data;
infile 'C:\Users\Admin\Documents\SAS\titanic_100.csv' dsd firstobs=2;
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

data titanic_data_nm;

set titanic_data;

if Age = . then
	delete;	

if Age > 0 then do;
Age = round(Age);
output;
end;

run;

proc print data=titanic_data_nm NOOBS;
title 'Titanic Data';
run;

proc export
OUTFILE="C:\Users\Admin\Documents\SAS\titanic_output.csv"
REPLACE;