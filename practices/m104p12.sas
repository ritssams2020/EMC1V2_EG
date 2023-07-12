/*************************************
* Iterative Processing: Practice #12 *
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
%mend printlib;
