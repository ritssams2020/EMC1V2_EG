/**********************************************
* Defining and Calling a Macro: Demo Solution *
**********************************************/

/* Step 1 */

title1 "Storm Frequency by Type";
title2 "NA Basin, 2016 Season, Max Wind > 80 MPH"; 
proc sgplot data=mc1.storm_final;
    vbar StormType / dataskin=pressed;
    where Basin="NA" and Season=2016 and MaxWindMPH>80; 
run;
title;

/* Step 2 */

%let Basin=NA;
%let Season=2016;
%let MaxWind=80;

title1 "Storm Frequency by Type";
title2 "&Basin Basin, &Season Season, Max Wind > &MaxWind MPH"; 
proc sgplot data=mc1.storm_final;
    vbar StormType / dataskin=pressed;
    where Basin="&Basin" and Season=&Season and MaxWindMPH>&MaxWind; 
run;
title;

/* Step 3 */

%let Basin=EP;
%let Season=2015;
%let MaxWind=125;

title1 "Storm Frequency by Type";
title2 "&Basin Basin, &Season Season, Max Wind > &MaxWind MPH"; 
proc sgplot data=mc1.storm_final;
    vbar StormType / dataskin=pressed;
    where Basin="&Basin" and Season=&Season and MaxWindMPH>&MaxWind; 
run;
title;

/* Step 4 */

options mcompilenote=all;
%macro StormChart(Basin, Season, MaxWind);
title1 "Storm Frequency by Type";
title2 "&Basin Basin, &Season Season, Max Wind > &MaxWind MPH"; 
proc sgplot data=mc1.storm_final;
    vbar StormType / dataskin=pressed;
    where Basin="&Basin" and Season=&Season and MaxWindMPH>&MaxWind; 
run;
title;
%mend;

/* Step 5 */
options mprint;
%StormChart(EP,2015,125)
options nomprint;

