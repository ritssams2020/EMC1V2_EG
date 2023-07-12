/****************************************
* Conditional Processing: Demo Solution *
****************************************/

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

/* Step 2 */
 
%macro stormchart(basin, season, cat);
%local maxwind;
%if &cat=5 %then %let maxwind=157;
%else %if &cat=4 %then %let maxwind=130;
%else %if &cat=3 %then %let maxwind=111;
%else %if &cat=2 %then %let maxwind=96;
%else %if &cat=1 %then %let maxwind=74;

title1 "Storm Frequency by Type";
title2 "&basin Basin, &season Season";
footnote "Max Wind > &maxwind MPH";
proc sgplot data=mc1.storm_final;
    vbar StormType / dataskin=pressed;
    where Basin="&basin" and Season=&season and MaxWindMPH>&maxwind; 
run;
title;footnote;
%mend stormchart;

options mcompilenote=all mlogic mprint;
%stormchart(NA,2016,3)
%stormchart(EP,2015)

/* Step 3 */

%macro stormchart(basin, season, cat);
%local maxwind;
%if &cat=5 %then %let maxwind=157;
%else %if &cat=4 %then %let maxwind=130;
%else %if &cat=3 %then %let maxwind=111;
%else %if &cat=2 %then %let maxwind=96;
%else %if &cat=1 %then %let maxwind=74;

title1 "Storm Frequency by Type";
title2 "&basin Basin, &season Season";
%if &cat ne  %then %do;
   	footnote "Max Wind > &maxwind MPH"; 
%end;
%else %do;
   	footnote "All Storms Included";
%end;
proc sgplot data=mc1.storm_final;
    vbar StormType / dataskin=pressed;
    where Basin="&basin" and Season=&season 
    %if &cat ne %then %do;
         and MaxWindMPH>&maxwind
    %end;
    ;
run;
title;footnote;
%mend stormchart;

options mcompilenote=all mlogic mprint;
%stormchart(EP,2015)
%stormchart(SI,2014,2)

/* Step 4 */

options nomprint nomlogic;