/*******************************
* Conditional Processing: Demo *
*******************************/

%macro stormchart(basin, season, maxwind);
title1 "Storm Frequency by Type";
title2 "&basin Basin, &season Season";
footnote "Max Wind > &maxwind MPH";
proc sgplot data=mc1.storm_final;
    vbar StormType / dataskin=pressed;
    where Basin="&basin" and Season=&season and MaxWindMPH>&maxwind; 
run;
title;footnote;
%mend stormchart;

options mcompilenote=all;
%stormchart(NA,2016,80)


/* Copy and paste %IF statements for step 2c. */
/*  
%if &cat=5 %then %let maxwind=157;
%else %if &cat=4 %then %let maxwind=130;
%else %if &cat=3 %then %let maxwind=111;
%else %if &cat=2 %then %let maxwind=96;
%else %if &cat=1 %then %let maxwind=74;
*/