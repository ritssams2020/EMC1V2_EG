***********************************************************;
*  Activity 4.02                                          *;
*  1) Run the program and verify in the log that the      *;
*     %PrintTable macro compiled successfully.            *;
*  2) Add a line of code at the bottom of the program to  *;
*     call the %PrintTable macro.                         *;
*         %printtable                                     *;
*  3) Highlight the macro call and run the selected code. *;
*     Based on only what you see in the log, can you tell *;
*     where in the SAS program the error occurred?        *;
***********************************************************;

options mcompilenote=all;

%macro printtable;
proc print data=&dsn(obs=&obs);
run;
%mend printtable;

%let dsn=sashelp.clas;
%let obs=5;
