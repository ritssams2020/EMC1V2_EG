/********************************************
* Defining and Calling a Macro: Practice #3 *
********************************************/

%macro prodlist(prodline);
%let prodline=%upcase(&prodline);
title "Listing of %sysfunc(propcase(&prodline, %str( &)))";
proc print data=mc1.products;
    where upcase(Product_Line)="&prodline";
    var Product_ID Product_name Product_Line;
run;
title;
%mend prodlist;

%prodlist(clothes&shoes)