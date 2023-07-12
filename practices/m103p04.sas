/**************************************************
* Using SQL to Create Maro Variables: Practice #4 *
**************************************************/

%let start=01Jan2019;
%let stop=31Jan2019;
proc sql;
	select mean(Quantity) format 4.2 as Qty, 
	       mean(Total_Retail_Price) format=dollar7.2 as Price
	from mc1.orders
	where Order_Date between "&start"d and "&stop"d;
quit;

title1 "Orders from &start to &stop";
title2 "Average Quantity: xxx   Average Price: yyy";
proc print data=mc1.orders;
	where Order_Date between "&start"d and "&stop"d;
	var Order_ID Order_Date Quantity Total_Retail_Price;
	sum Quantity Total_Retail_Price;
	format Total_Retail_Price dollar8.;
run;
title;