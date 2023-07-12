/*************************************
* Iterative Processing: Solution #11 *
*************************************/

 /* Part b. */
%macro storms(years);
%let i=1;
%let yr=%scan(&years,&i);
%do %until(&yr eq );
    title "&yr Storms";
    proc means data=mc1.storm_final n min mean max maxdec=0;
        var MaxWindMPH MinPressure;
        where season=&yr;
    run;
    %let i=%eval(&i+1);
    %let yr=%scan(&years,&i);
%end;
title;
%mend storms;

 /* Part c. */
%storms(2011 2014)

