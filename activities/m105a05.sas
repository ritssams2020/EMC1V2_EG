***********************************************************;
*  Activity 5.05                                          *;
*  1) Open sashelp.cars to view the table and columns.    *;
*  2) In the program, select the SplitTable macro         *;
*     definition and submit the selected code.            *;
*  3) Highlight each %SplitTable macro call, one at a     *;
*     time, and submit it.                                *;
*  4) Which macro calls fail and why?                     *;
***********************************************************;

%macro splittable(tab,col);
proc sql noprint;
select distinct &col
    into :table1-
    from &tab;
quit;

data 
    %do i=1 %to &sqlobs;
        &&table&i
    %end;
;
    set &tab;
    select(&col);
    %do i=1 %to &sqlobs;
        when ("&&table&i") output &&table&i;
    %end;
    otherwise;
    end;
run;
%mend splittable;

%splittable(sashelp.cars,Origin)

%splittable(sashelp.crs,Origin)

%splittable(sashelp.cars,Price)

%splittable(sashelp.cars,DriveTrain)

%splittable(sashelp.cars,Make)

%splittable(sashelp.cars,Cylinders)




