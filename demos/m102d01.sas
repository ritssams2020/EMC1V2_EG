/***********************************************
* Creating and Using Macro Variables: Examples *
***********************************************/

/* Program without macro variables */
title "Trucks with Horsepower > 250";
proc print data=sashelp.cars;
    var Make Model MSRP Horsepower;
    where Type="Truck" and Horsepower>250;
run;

/* Program #1 with macro variables */
%let type=Truck;
%let hp=250;
title "Car Type: &type";
proc print data=sashelp.cars;
    var Make Model MSRP Horsepower;
    where Type="&type" and Horsepower>&hp;
run;

/* Program #2 with macro variables */
%let type=Truck;
%let hp=250;
title "&type.s with Horsepower > &hp";
footnote "Report Created on &sysday, &sysdate";
proc print data=sashelp.cars;
    var Make Model MSRP Horsepower;
    where Type="&type" and Horsepower>&hp;
run;
title;footnote;

