/*******************************
* Macro Functions: Solution #2 *
*******************************/

%let product=%nrstr(R&D);
title "Product Names Containing '&product'";
footnote "Report Produced %sysfunc(date(), date9.) %sysfunc(time(),timeampm9.)";
proc print data=mc1.products;
	where Product_Name contains "&product";
	var Product_Name Product_ID Supplier_Name;
run;
title;
footnote;