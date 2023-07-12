/********************************************************
* Indirect References to Macro Variables: Demo Solution *
********************************************************/

/* Steps 1-2 */
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

/* Step 3 */
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

title1 "&&&basin &year Category &cat+ Storms";
proc print data=mc1.storm_final noobs;
	where Basin="&basin" and
		  MaxWindMPH>=&&wind&cat and
		  Season=&year;
run;
title;

/* Step 4 */
%let year=2014;
%let cat=3;
%let basin=NA;

proc sql noprint;
select MinWind
    into :wind1-
    from mc1.storm_cat;
quit;

data _null_;
    set mc1.storm_basin_codes;
    call symputx(Basin, BasinName);
run;

title1 "&&&basin &year Category &cat+ Storms";
proc print data=mc1.storm_final noobs;
	where Basin="&basin" and
		  MaxWindMPH>=&&wind&cat and
		  Season=&year;
run;
title;

/* Steps 5-8 */
%let year=2014;
%let cat=3;
%let basin=NA;

proc sql noprint;
select MinWind, Damage
    into :wind1-, :damage1-
    from mc1.storm_cat;
quit;

data _null_;
    set mc1.storm_basin_codes;
    call symputx(Basin, BasinName);
run;

title1 "&&&basin &year Category &cat+ Storms";
footnote "Category &cat storms typically cause %lowcase(&&damage&cat)";
proc print data=mc1.storm_final noobs;
	where Basin="&basin" and
		  MaxWindMPH>=&&wind&cat and
		  Season=&year;
run;
title;footnote;
