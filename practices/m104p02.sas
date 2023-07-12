/********************************************
* Defining and Calling a Macro: Practice #2 *
********************************************/

options nolabel; 
title 'Order Stats'; 
proc means data=mc1.orders maxdec=2 mean; 
	var Total_Retail_Price; 
	class Customer_ID; 
run; 
title;
options label;
