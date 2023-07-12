***********************************************************;
*  Activity 3.07                                          *;
*  1) Notice that wind values have been replaced with     *;
*     &wind&cat. Run the program and review the log.      *;
*  2) Change &wind&cat to &&wind&cat. Run the program and *;
*     review the log. Does the program run successfully?  *;
***********************************************************;

proc sql noprint;
select MinWind
    into :wind1-
    from mc1.storm_cat;
quit;

%let cat=4;
%put NOTE: Category &cat storms >= &wind&cat MPH;
