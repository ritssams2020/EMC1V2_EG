/**********************************************
* Generating Data-Dependent Code: Solution #1 *
**********************************************/

%macro grouplist(tab,col);
proc sql noprint;
select distinct upcase(&col)
    into :val1-
    from &tab;
quit;

%do i=1 %to &sqlobs;
title "Group: &&val&i";
proc print data=&tab noobs;
    where upcase(&col)="&&val&i";
run;
%end;
%mend grouplist;

%grouplist(mc1.customers, Type)
%grouplist(sashelp.cars, DriveTrain)
