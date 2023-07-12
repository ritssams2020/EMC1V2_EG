/**************************************************
* Creating and Using Macro Variables: Practice #2 *
**************************************************/

title "Listing of All Employees From mc1.newhires";
proc print data=mc1.newhires;
    var Employee_Name Employee_ID;
run;
title;
