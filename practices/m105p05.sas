/*************************************
* Validating Parameters: Practice #5 *
*************************************/

%macro stormchart(basin, season);
title1 "Storm Frequency by Type";
title2 "&basin Basin, &season Season";
proc sgplot data=mc1.storm_final noborder;
	vbar StormType / filltype=gradient;
    where Basin="&basin" and Season=&season;
    yaxis grid;
run;
title;
%mend stormchart;

%stormchart(NA,2015)