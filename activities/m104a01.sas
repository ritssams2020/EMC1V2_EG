***********************************************************;
*  Activity 4.01                                          *;
*  1) Notice that there is a missing semicolon after the  *;
*     PROC PRINT statement. Run the program and confirm   *;
*     that an error is generated in the log. Do not       *;
*     correct the error.                                  *;
*  2) Modify the code to create a macro program named     *;
*     PrintTable. Run the program and notice that there   *;
*     are no notes, warnings, or errors in the log.       *;
*  3) Add the following OPTIONS statements at the start   *;
*     of the program to set the MCOMPILENOTE=ALL option.  *;
*         options mcompilenote=all;                       *;
*  4) Submit the program. The log includes a note         *;
*     indicating that the PrintTable macro compiled       *;
*     without errors.                                     *;
*  5) Why does the macro program compile successfully     *;
*     even though there is a syntax error in the PROC     *;
*     PRINT step?                                         *;
***********************************************************;

%let dsn=sashelp.cars;
%let obs=5;

proc print data=&dsn(obs=&obs)
run;
