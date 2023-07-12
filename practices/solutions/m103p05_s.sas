/**************************************************
* Using SQL to Create Maro Variables: Solution #5 *
**************************************************/

 /* Part a. */
%let year=2016;
%let basincode=NA;

proc sql;
select round(mean(MaxWindMPH)) as AvgWind
    from mc1.storm_final
    where Season=&year and Basin="&basincode";
quit;

 /* Part b. */
title1 "North Atlantic Basin Storms in &year Season";
title2 "Max Wind > Season Average of 79 MPH"; 
proc print data=mc1.storm_final noobs;
	var Name StartDate EndDate MaxWindMPH MinPressure;
	where MaxWindMPH>79 and Season=&year and Basin="&basincode"; 
run;
title;

proc sgplot data=mc1.storm_final;
    where MaxWindMPH>79 and Season=&year and Basin="&basincode"; 
	vbar StormType;
	yaxis display=(noline) grid;
run;

 /* Parts c. and d. */
proc sql noprint;
select round(mean(MaxWindMPH)) as AvgWind
    into :avgwind trimmed
    from mc1.storm_final
    where Season=&year and Basin="&basincode";
select BasinName 
   into :basinname
   from mc1.storm_basin_codes
   where basin="&basincode";
quit;

title1 "&basinname Storms in &year Season";
title2 "Max Wind > Season Average of &avgwind MPH"; 
proc print data=mc1.storm_final noobs;
	var Name StartDate EndDate MaxWindMPH MinPressure;
	where MaxWindMPH>&avgwind and Season=&year 
     and Basin="&basincode"; 
run;
title;

proc sgplot data=mc1.storm_final;
   where MaxWindMPH>&avgwind and Season=&year 
     and Basin="&basincode"; 
	vbar StormType;
	yaxis display=(noline) grid;
run;

 /* Part e. */
%let year=2015;
%let basincode=EP;

proc sql noprint;
select round(mean(MaxWindMPH)) as AvgWind
    into :avgwind trimmed
    from mc1.storm_final
    where Season=&year and Basin="&basincode";
select BasinName 
   into :basinname
   from mc1.storm_basin_codes
   where basin="&basincode";
quit;

title1 "&basinname Storms in &year Season";
title2 "Max Wind > Season Average of &avgwind MPH"; 
proc print data=mc1.storm_final noobs;
	var Name StartDate EndDate MaxWindMPH MinPressure;
	where MaxWindMPH>&avgwind and Season=&year and Basin="&basincode"; 
run;
title;

proc sgplot data=mc1.storm_final;
   where MaxWindMPH>&avgwind and Season=&year and Basin="&basincode"; 
	vbar StormType;
	yaxis display=(noline) grid;
run;
