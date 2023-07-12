/**************************************************
* Using SQL to Create Maro Variables: Solution #4 *
**************************************************/

 /* Part b. */
%let start=01Jan2019;
%let stop=31Jan2019;
proc sql noprint;
select mean(Quantity) format 4.2 as Qty, 
       mean(Total_Retail_Price) format=dollar7.2 as Price
	from mc1.orders
	where Order_Date between "&start"d and "&stop"d;
quit;

title1 " Orders from &start to &stop";
title2 "Average Quantity: 1.43   Average Price: 137.72";
proc print data=mc1.orders;
	where Order_Date between "&start"d and "&stop"d;
	var Order_ID Order_Date Quantity Total_Retail_Price;
	sum Quantity Total_Retail_Price;
	format Total_Retail_Price dollar8.;
run;
title;

 /* Part c. */
%let start=01Jan2019;
%let stop=31Jan2019;
proc sql noprint;
select mean(Quantity) format 4.2, 
       mean(Total_Retail_Price) format=dollar7.2
	into :qty, :price
	from mc1.orders
	where Order_Date between "&start"d and "&stop"d;
quit;

title1 " Orders from &start to &stop";
title2 "Average Quantity: &qty   Average Price: &price";
proc print data=mc1.orders;
	where Order_Date between "&start"d and "&stop"d;
	var Order_ID Order_Date Quantity Total_Retail_Price;
	sum Quantity Total_Retail_Price;
	format Total_Retail_Price dollar8.;
run;
title;

 /* Part d. */
%let start=01Feb2019;
%let stop=28Feb2019;
proc sql noprint;
select mean(Quantity) format 4.2, 
       mean(Total_Retail_Price) format=dollar7.2
	into :qty, :price 
	from mc1.orders
	where Order_Date between "&start"d and "&stop"d;
quit;

title1 " Orders from &start to &stop";
title2 "Average Quantity: &qty   Average Price: &price";
proc print data=mc1.orders;
	where Order_Date between "&start"d and "&stop"d;
	var Order_ID Order_Date Quantity Total_Retail_Price;
	sum Quantity Total_Retail_Price;
	format Total_Retail_Price dollar8.;
run;
title;