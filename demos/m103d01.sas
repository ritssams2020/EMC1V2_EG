/****************************
* Macro Functions: Examples *
****************************/

/* Program without macro functions */

%let dt=front;
data cars_subset;
    set sashelp.cars;
    where upcase(DriveTrain)="&dt";
run;

title "&dt Wheel Drive Cars";
footnote "Listing from CARS_SUBSET Table";
proc print data=&syslast;
run;
title;footnote;

/* Program with macro functions */

%let dt=front;
data cars_subset;
    set sashelp.cars;
    where upcase(DriveTrain)="%upcase(&dt)";
run;

title "%sysfunc(propcase(&dt)) Wheel Drive Cars";
footnote "Listing from %scan(&syslast,2) Table";
proc print data=&syslast;
run;
title;footnote;





