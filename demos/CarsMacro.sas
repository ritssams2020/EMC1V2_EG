/******************************************************
* How would you insert the current date and time?     *
*                                                     *
*  Automatic macro variables and macro functions can  *
*  be used to substitute these values automatically.  *
******************************************************/

title1 "Cars List";
title2 "Created at %sysfunc(time(),timeampm8.) on %sysfunc(today(),worddate.) ";
footnote "Environment: SAS &sysver on &sysscp &sysscpl"; 

proc print data=sashelp.cars;
run;
title;footnote;

/******************************************************
* How would you replace Truck with Wagon or SUV?      *
*                                                     *
*  Change the value of Truck in the %LET statement    *
*  and it will be substituted into the program.       *
******************************************************/

%let cartype=Truck;
title "&cartype.s Cars by Origin";
proc freq data=sashelp.cars;
	where Type="&cartype";
	table Origin;
run;

title "Average Highway MPG for &cartype.s";
proc means data=sashelp.cars mean maxdec=1;
    where Type="&cartype";
    var MPG_Highway;
    class Origin;
run;
title;

/******************************************************
* How would you conditionally run either the PRINT    *
* step or write a custom error message to the log     * 
* depending on the outcome of the DATA step?          *
*                                                     *
*  %IF/%THEN statements can execute code based on a   *
*  condtion.                                          *    
******************************************************/

data mpg;
	set sashelp.cars;
	AvgMPG=mean(MPG_Highway, MPG_City);
run;

%if &syserr=0 %then %do;
    proc print data=mpg;
    run;
%end;

%else %do;
    %put ERROR: MPG table was not created successfully.;
%end;

/******************************************************
* How would you repeat the PRINT step for             *
* 4, 6, and 8 cylinders?                              *
*                                                     *
*  %DO loops generate repetitive code.                *
******************************************************/
%macro cylinder;

%do i=4 %to 8 %by 2;

    title "&i-Cylinder Cars";
    proc print data=sashelp.cars;
        where Cylinders=&i;
    run;
    
%end;
title;
%mend cylinder;
%cylinder

/******************************************************
* How can you verify all values of Type are included  *
* in the DATA step? What if you want to split the     *
* CARS table by Origin instead?                       *
*                                                     *
*  A generalized macro program can recreate the DATA  *
*  step based on the values of a selected column from *
*  a particular table.                                *
******************************************************/
 
%macro SplitTable(table,col);
proc sql noprint;
select distinct &col
   into :Table1-
   from &table;
quit;

data 
	%do i=1 %to &sqlobs;
	   &&Table&i
	%end;
;
    set &table;
    select(&col);
        %do i=1 %to &sqlobs;
            when ("&&Table&i") output &&Table&i;
        %end;
   end;
run;
%mend SplitTable;

%SplitTable(sashelp.cars, type)
%SplitTable(sashelp.cars, origin)


