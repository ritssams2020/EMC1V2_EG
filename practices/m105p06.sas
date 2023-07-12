/*************************************
* Validating Parameters: Practice #6 *
*************************************/

%macro customerlist(ctry);
title "Customers from &ctry";
proc sgplot data=mc1.customers noborder;
	vbar Group / filltype=gradient stat=percent;
	yaxis grid display=(noticks noline nolabel);
	where Country="&ctry";
run;
	
%mend customerlist;

%customerlist(AU)