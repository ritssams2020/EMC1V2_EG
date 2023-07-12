/************************************************************
* Using the DATA Step to Create Maro Variables: Solution #6 *
************************************************************/

 /* Part b. */
%let dept=Administration;
data staff;
	keep Employee_ID Department Job_Title Salary;
	set mc1.newhires;
	where Department="&dept";
run;

title "New Staff: &dept Department";
proc print data=staff;
	sum salary;
run;
title;

 /* Part c. */
%let dept=Sales;
data staff;
	keep Employee_ID Department Job_Title Salary;
	set mc1.newhires;
	where Department="&dept";
run;

title "New Staff: &dept Department";
proc print data=staff;
	sum salary;
run;
title;

 /* Part d. */
%let dept=Sales;
data staff;
	keep Employee_ID Department Job_Title Salary;
	set mc1.newhires end=last;
	where Department="&dept";
	total+salary;
	if last=1 then 
		call symputx("avg",put(total/_n_,dollar9.));
run;

footnote "Average Salary: &avg";
title "New Staff: &dept Department";
proc print data=staff;
	sum salary;
run;
title;footnote;
