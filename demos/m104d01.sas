/*****************************************
* Defining and Calling a Macro: Examples *
*****************************************/

/* Create and call a macro program */
%let dsn=sashelp.cars;
%let obs=5;
%macro printtable / des="Print a table";
proc print data=&dsn(obs=&obs);
run;
%mend printtable;

%printtable

/* Print the contents of work.sasmacr */
proc catalog cat=work.sasmacr;
    contents;
run;

/* Create and call a macro program with positional parameters */
%macro printtable(dsn,obs);
proc print data=&dsn(obs=&obs);
run; 
%mend printtable;

%printtable(sashelp.cars,5)

