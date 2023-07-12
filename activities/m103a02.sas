***********************************************************;
*  Activity 3.02                                          *;
*  1) Run the program and examine the output and the log. *;
*     SAS does not have a %PROPCASE macro function, so it *;
*     does not successfully resolve and the title is      *;
*     incorrect.                                          *;
*  2) Modify the TITLE statement to use the %SYSFUNC      *;
*     macro function in combination with the PROPCASE     *;
*     function.                                           *;
*     title "%sysfunc(propcase(&dt)) Wheel Drive Cars";   *;
*  3) Run the program and confirm that the title is       *;
*     correct.                                            *;
***********************************************************;

%let dt=front;
data cars_subset;
    set sashelp.cars;
    where upcase(DriveTrain)="%upcase(&dt)";
run;

title "%propcase(&dt) Wheel Drive Cars";
footnote "Listing from %scan(&syslast,2) Table";
proc print data=&syslast;
run;
