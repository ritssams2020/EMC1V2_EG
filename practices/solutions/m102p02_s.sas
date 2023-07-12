/**************************************************
* Creating and Using Macro Variables: Solution #2 *
**************************************************/

%let lib=mc1;
%let dsn=newhires;
%let var=Employee;
title "Listing of All &var.s From &lib..&dsn";
proc print data=&lib..&dsn;
    var &var._Name &var._ID;
run;
title;
