/***************************************
* Macro Iterative Processing: Examples *
***************************************/

/* Method 1 */

%macro allcylinders(start,stop);
    %do num=&start %to &stop;
        title "&num-Cylinder Cars";
        proc print data=sashelp.cars noobs;
            where Cylinders=&num;
            var Make Model Type Origin 
                MSRP MPG_City MPG_Highway;
        run;
    %end;
%mend allcylinders;

%allcylinders(3,6)

/* Method 2 */

%macro cylreport(num);
title "&num-Cylinder Cars";
proc print data=sashelp.cars noobs;
    where Cylinders=&num;
    var Make Model Type Origin 
        MSRP MPG_City MPG_Highway;
run;
%mend cylreport;

%macro allcylinders(start,stop);
    %do num=&start %to &stop;
        %cylreport(&num)
    %end;
%mend allcylinders;

%allcylinders(3,6)
