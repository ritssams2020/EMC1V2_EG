/********************************************
* Defining and Calling a Macro: Solution #2 *
********************************************/

%macro orderstats (var=Total_Retail_Price, class=Customer_ID,
				   stats=mean, decimals=2); 
options nolabel; 
title 'Order Stats'; 
proc means data=mc1.orders maxdec=&decimals &stats; 
	var &var ;
	class &class; 
run; 
title;
options label;
%mend orderstats;

%orderstats()

%orderstats(var=CostPrice_Per_Unit, decimals=0,
            stats=mean median, class=order_type)
						 
