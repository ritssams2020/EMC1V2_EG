/************************
* Macro Functions: Demo *
************************/

%let year=2015;
%let windm=150;

title1 "&year Storms";
title2 "Winds Exceeding &windm M/H";
footnote "Report Created on &sysdate9 at &systime";
proc print data=mc1.storm_final noobs;
   where Season=&year and MaxWindMPH>=&windm;
run;
title;footnote;

