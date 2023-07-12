/********************************************
* Defining and Calling a Macro: Solution #3 *
********************************************/

 /* Part a. */
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

 /* Part b. */
%prodlist(%nrstr(clothes&shoes))

 /* Part c. */
%macro prodlist(prodline);
%let prodline=%qupcase(&prodline);
title "Listing of %qsysfunc(propcase(&prodline, %str( &)))";
proc print data=mc1.products;
    where upcase(Product_Line)="&prodline";
    var Product_ID Product_name Product_Line;
run;
title;
%mend prodlist;

%prodlist(%nrstr(clothes&shoes))