/************************************************
* Conditional Processing in Open Code: Examples *
************************************************/

/* Starter program */

data sports;
    set sashelp.cars;
    where Type="Sports";
    AvgMPG=mean(MPG_City, MPG_Highway);
run;

title "Sports Cars";
proc print data=sports noobs;	
    var Make Model AvgMPG MSRP EngineSize;
run;
title;
proc sgplot data=sports;
    scatter x=MSRP y=EngineSize;
run;

/* Program with macro conditional processing */

data sports;
    set sashelp.cars;
    where Type="Sports";
    AvgMPG=mean(MPG_City, MPG_Highway);
run;

%if &syserr ne 0 %then %do;
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
	
	
	

