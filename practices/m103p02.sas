/*******************************
* Macro Functions: Practice #2 *
*******************************/

%let d=&sysdate9;
%let t=&systime;
title1 "Product Names containing 'Jacket'";
footnote "Report Produced &d &t";
proc print data=mc1.products;
	where Product_Name contains "Jacket";
	var Product_Name Product_ID Supplier_Name;
run;
title;footnote;