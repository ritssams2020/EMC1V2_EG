/*************************************
* Defining and Calling a Macro: Demo *
*************************************/

title1 "Storm Frequency by Type";
title2 "NA Basin, 2016 Season, Max Wind > 80 MPH"; 
proc sgplot data=mc1.storm_final;
    vbar StormType / dataskin=pressed;
    where Basin="NA" and Season=2016 and MaxWindMPH>80; 
run;
title;

