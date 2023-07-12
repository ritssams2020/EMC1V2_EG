***********************************************************;
*  Activity 4.07                                          *;
*  1) Notice that there is a missing semicolon after the  *;
*     DATA statement, which causes a syntax error. If     *;
*     there is a syntax error in the first DATA step,     *;
*     then the %PUT statement should execute and write a  *;
*     custom error message to the log, and the remaining  *;
*     PROC steps should not execute.                      *;
*  2) Run the program and look at the log. Notice that    *;
*     although there was an error in the DATA step, SAS   *;
*     still attempted to execute PROC PRINT and PROC      *;
*     SGPLOT.                                             *;
*  3) Identify the syntax error in the macro %IF          *;
*     statement. Fix the error and run the program again  *;
*     to confirm that the %PUT statement is executed.     *;
***********************************************************;

data sports
    set sashelp.cars;
    where Type="Sports";
    AvgMPG=mean(MPG_City, MPG_Highway);
run;

%if &syserr ne 0 then do;
    %put ERROR: The rest of the program will not execute;
%end;
%else %do;
	title "Sports Cars";
	proc print data=sports noobs;	
	    var Make Model AvgMPG MSRP EngineSize;
	run;
	title;
	proc sgplot data=sports;
	    scatter x=MSRP y=EngineSize;
	run;
%end;
title;