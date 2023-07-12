/***************************************
* Macro Iterative Processing: Examples *
***************************************/

/* Processing a list of values with indirect references */

%macro allcylinders;
proc sql noprint;
select distinct Cylinders
    into :val1-
    from sashelp.cars
    where Cylinders ne .;
quit;

%local i;
%do i=1 %to &sqlobs;
title "&&val&i-Cylinder Cars";
proc print data=sashelp.cars noobs;
    where Cylinders=&&val&i;
    var Make Model Type Origin 
        MSRP MPG_City MPG_Highway;
run;
%end;
%mend allcylinders;

%allcylinders

/* Processing a list of values with conditional loop */

%macro cyllist(list);
%local i;
%let i=1;
%do %while (%scan(&list, &i) ne );
    %let num=%scan(&list, &i);
        title "&num-Cylinder Cars";
        proc print data=sashelp.cars noobs;
            where Cylinders=&num;
            var Make Model Type Origin 
                MSRP MPG_City MPG_Highway;
        run;
    %let i=%sysevalf(&i+1);
    %end;
%mend cyllist;

%cyllist(3 4 5 6 8 10 12)
