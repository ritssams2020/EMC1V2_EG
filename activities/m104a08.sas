***********************************************************;
*  Activity 4.08                                          *;
*  1) Review the program and notice that different DATA   *;
*     steps run, depending on the value of the loc        *;
*     parameter. The %AvgFuel macro call at the end of    *;
*     the program assigns Europe to the loc parameter.    *;
*  2) Run the program and view the log. Notice the MPRINT *;
*     messages displaying the final program that was      *;
*     compiled and executed.                              *;
*  3) Run the %AvgFuel macro call with usa as the         *;
*     parameter value. View the log. Which DATA step was  *;
*     compiled and executed?                              *;
***********************************************************;

%macro avgfuel(loc);
%if &loc= %then %do;
    %put ERROR: Provide a value for Origin.;
    %put ERROR- Valid values: Asia, Europe, USA;
    %return;
%end;

%else %if &loc=USA %then %do;
	data fuel_&loc;
		set sashelp.cars;
		where Origin="&loc";
		AvgMPG=mean(MPG_City, MPG_Highway);
		keep Make Model Type AvgMPG;
	run;
%end;

%else %do;
	data fuel_&loc;
		set sashelp.cars;
		where Origin="&loc";
		AvgKmL=mean(MPG_City, MPG_Highway)*.425;
		keep Make Model Type AvgKmL;
	run;
%end;

title1 "Fuel Efficiency";
title2 "Origin: &loc";
proc print data=fuel_&loc;
run;
title;
%mend avgfuel;

options mprint mlogic;
%avgfuel(Europe)

options nomprint nomlogic;
