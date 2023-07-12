/**************************************************
* Using SQL to Create Maro Variables: Practice #5 *
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
title2 "Max Wind > Season Average of XX MPH"; 
proc print data=mc1.storm_final noobs;
	var Name StartDate EndDate MaxWindMPH MinPressure;
	where MaxWindMPH>XX and Season=&year and Basin="&basincode"; 
run;
title;

proc sgplot data=mc1.storm_final;
    where MaxWindMPH>XX and Season=&year and Basin="&basincode"; 
	vbar StormType;
	yaxis display=(noline) grid;
run;

