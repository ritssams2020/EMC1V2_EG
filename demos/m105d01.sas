/***************************
* Storing Macros: Examples *
***************************/

*options sasautos=("&path/autocall", SASAUTOS);

%macro printtable(dsn=sashelp.cars,obs=5)
        /des='Print a table. Parms: DSN= OBS=';
proc print data=&dsn(obs=&obs);
run; 
%mend printtable;

proc catalog catalog=work.sasmacr;
    contents;
run;

