/*************************************
* Iterative Processing: Practice #11 *
*************************************/

%macro storms(yr);
title "&yr Storms";
proc means data=mc1.storm_final n min mean max maxdec=0;
    var MaxWindMPH MinPressure;
    where season=&yr;
run;
%mend storms;

%storms(2015)