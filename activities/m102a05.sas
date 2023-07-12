***********************************************************;
*  Activity 2.05                                          *;
*  1) Modify the TITLE statement reference to &type by    *;
*     adding a period before the 's'.                     *;
*  2) Replace the hardcoded text sashelp in the FOOTNOTE  *;
*     and PROC statements with a reference to the Lib     *;
*     macro variable (&lib).                              *;
*  3) Run the program and examine the log and the error   *;
*     statements. Why did the program fail to run?        *;
***********************************************************;

options symbolgen;
%let type=Truck;
%let hp=250;
%let lib=SASHELP;

title "&types with Horsepower > &hp";
footnote "Data Source: SASHELP.CARS";
proc print data=sashelp.cars;
    var Make Model MSRP Horsepower;
    where Type="&type" and Horsepower>&hp;
run;
title;footnote;
options nosymbolgen;
