/*************************************
* Iterative Processing: Solution #12 *
*************************************/

 /* Part a. */
%macro print(lib=mc1,tbl=storm_ocean_codes,rows=3);
title "First &rows Rows from Table: &lib..&tbl";
proc print data=&lib..&tbl(obs=&rows);
run;
title;
%mend print;
%print(lib=mc1,tbl=orders,rows=10)

 /* Part b. */
%macro printlib(lib,numrows);
%let lib=%upcase(&lib);
proc sql noprint;
select memname 
    into :tbl1- 
	from dictionary.tables
	where libname="&lib";
quit;
/* add the %DO loop here */
%do i= 1 %to &sqlobs;
    %if &numrows= %then 
        %print(lib=&lib,tbl=&&tbl&i);
    %else
        %print(lib=&lib,tbl=&&tbl&i,rows=&numrows);
%end;
%mend printlib;

 /* Part c. */
%printlib(mc1,10)

 /* Part d. */
%printlib(mc1)


