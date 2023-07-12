/*******************************************
* Generating Data-Dependent Code: Examples *
*******************************************/

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
%splittable(sashelp.cars,origin)

