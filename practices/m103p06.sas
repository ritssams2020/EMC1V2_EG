/************************************************************
* Using the DATA Step to Create Maro Variables: Practice #6 *
************************************************************/

data staff;
	keep Employee_ID Department Job_Title Salary;
	set mc1.newhires;
	where Department="Administration";
run;

title "New Staff: Administration Department";
proc print data=staff;
	sum salary;
run;
title;