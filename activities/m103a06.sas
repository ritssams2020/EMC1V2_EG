***********************************************************;
*  Activity 3.06                                          *;
*  1) Highlight the %LET statement and PROC MEANS step    *;
*     and run the selection. Examine the output data.     *;
*  2) Complete the CALL SYMPUTX statement to create a     *;
*     macro variable named AvgMSRP and load the value of  *;
*     the Mean column from the CarsStat table.            *;
*  3) Run the completed program. What is the value of the *;
*     second title?                                       *;
***********************************************************;

%let make=Honda;

proc means data=sashelp.cars noprint maxdec=0;
	where Make="&make";
	var MSRP;
	output out=CarsStat Mean=Mean;
run;

/* Complete the CALL SYMPUTX statement */
data _null_;
	set CarsStat;
	call symputx(        );
run;

title "&make Cars";
title2 "Average MSRP: &avgmsrp";
proc print data=sashelp.cars noobs;
	where Make="&make";
run;
title;
