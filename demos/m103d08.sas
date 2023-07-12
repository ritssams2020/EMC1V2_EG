/***********************************************
* Indirect References to Macro Variables: Demo *
***********************************************/

%let year=2016;
%let cat=2;
%let basin=SI;

proc sql noprint;
select MinWind
    into :wind1-
    from mc1.storm_cat;
quit;

data _null_;
    set mc1.storm_basin_codes;
    call symputx(Basin, BasinName);
run;

title1 "&basin &year Category &cat+ Storms";
proc print data=mc1.storm_final noobs;
	where Basin="&basin" and
		  MaxWindMPH>=&&wind&cat and
		  Season=&year;
run;
title;
