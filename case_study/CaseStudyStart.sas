 **********************************************************
*  Concepts used:                                        *
*  1) Create a macro function, store as AUTOCALL         *
*  2) Use %SYSFUNC                                       *
*  3) Create macro with a parameter                      *
*  4) Use %IF/%THEN based on macro parameter value       *
*  5) Use %PUT to generate custom messages in log        *
*  6) Create a series of macro variables                 *
*  7) Use %DO loop and indirect macro variable reference *
**********************************************************;

**********************************************************
* Be sure to first run cre8data.sas and libname.sas      *
**********************************************************;
 
 /*PART 1*/
 /*Run first two steps of the program to identify the top Supplier_ID and Supplier_Name*/ 

 /*This step creates a table that joins Orders with Products and calculates Profit per Order*/
 /*Include Retail Sales (order_type=1) only*/
proc sql;
create table OrderDetail as 
select Order_ID, o.Product_ID, Order_Type, Product_Category, 
       Product_Group, Product_Line, Product_Name, 
       (total_retail_price-(costprice_per_unit*quantity)) as Profit,
       Supplier_ID, Supplier_Name, Supplier_Country
    from mc1.orders as o 
        left join  mc1.products as p
	    on o.Product_ID=p.Product_ID
	where order_type=1;
quit;	

 /*This step summarizes profit and ranks suppliers*/
proc sql;
select Supplier_ID format=12.,
       Supplier_Name,
       Supplier_Country,
       sum(profit) as Profit
    from OrderDetail
	group by Supplier_ID, Supplier_Name, Supplier_Country
	order by Profit desc;
quit;

 /*This step prints the country_codes table to look up the country names*/
proc print data=mc1.country_codes;
run;

 /*PART 2*/

 /* In the remainder of the program, the Name, ID and Country for the top supplier 
      have been substituted in the appropriate places. Spaces have been replaced with 
	  underscores in the file name. TITLE2 indicates the type of orders included. */

 /* To modify the program to generate the report for the #2 supplier, update the supplier
	   name, ID, country and rank in the appropriate places. */
options nodate;
ods graphics on / imagefmt=png; 
ods pdf file="&path/case_study/1_Eclipse_Inc.pdf" style=meadow startpage=no nogtitle;

title "Orders for #1 Eclipse Inc, United States";	
title2 "Retail Sales Only";
 /*Create a summary bar chart by Product_Category*/
proc sgplot data=OrderDetail noautolegend ;
	hbar Product_Category / response=profit stat=sum group=Product_Group categoryorder=respdesc;
	where Supplier_ID=1303;
	format profit dollar8.;
run;
title;

 /*Create a summary report of orders and sales for the selected supplier*/
proc sql;
	select Product_Group, 
           count(order_id) as NumOrders "Number of Orders", 
           sum(profit) as TotalProfit "Total Profit" format=dollar8., 
           avg(profit) as AvgProfit "Average Profit per Order" format=dollar6.
	from OrderDetail
	where Supplier_ID=1303
	group by Product_Group
	order by calculated numorders desc;
quit;

footnote;
ods pdf close;
