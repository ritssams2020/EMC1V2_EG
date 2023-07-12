/*********************************
* Macro Functions: Demo Solution *
*********************************/

/* Step 1 */

%let year=2015;
%let windm=150;

title1 "&year Storms";
title2 "Winds Exceeding &windm M/H ";
footnote "Report Created on &sysdate9 at &systime";
proc print data=mc1.storm_final noobs;
   where Season=&year and MaxWindMPH>=&windm;
run;
title;footnote;

/* Step 2 */

%let year=2015;
%let windm=150;

title1 "&year Storms";
title2 "Winds Exceeding &windm M/H or %sysevalf(&WindM*1.61) KM/H";
footnote "Report Created on &sysdate9 at &systime";
proc print data=mc1.storm_final noobs;
   where Season=&year and MaxWindMPH>=&windm;
run;
title;footnote;

/* Step 3 */

%let year=2015;
%let windm=150;

title1 "&year Storms";
title2 "Winds Exceeding &WindM M/H or %sysevalf(&WindM*1.61) KM/H";
footnote "Report Created on %sysfunc(today(), date9.) at %sysfunc(time(), timeampm.)";
proc print data=mc1.storm_final noobs;
   where Season=&year and MaxWindMPH>=&windm;
run;
title;footnote;

/* Steps 4-6 */

%let year=2015;
%let windm=150;
%let dtfoot=%str(footnote "Report Created on %sysfunc(today(), date9.) at %sysfunc(time(), timeampm.)";);
title1 "&year Storms";
title2 "Winds Exceeding &windm M/H or %sysevalf(&windm*1.61) KM/H";
&dtfoot
proc print data=mc1.storm_final noobs;
   where MaxWindMPH>=&windm and Season=&year;
run;
title;footnote;

