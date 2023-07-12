/**************************************
* Conditional Processing: Practice #7 *
**************************************/

%macro customerlist(country);
proc print data=mc1.customers noobs;
run;
%mend customerlist;




