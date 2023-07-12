/***************************************************
* Indirect References to Macro Variables: Examples *
***************************************************/

%let year=2017;
%let cat=2;
%let basin=SI;

/* Create a series of macro variables */

proc sql noprint;
select MinWind
    into :wind1-
    from mc1.storm_cat;
quit;

data _null_;
    set mc1.storm_basin_codes;
    call symputx(Basin, BasinName);
run;

/* Generate report with indirect references */

title1 "&&&basin &year Category &cat+ Storms";
proc print data=mc1.storm_final;
	where Season=&year and 
	      MaxWindMPH>&&wind&cat and 
	      Basin="&basin";
run;
title;


