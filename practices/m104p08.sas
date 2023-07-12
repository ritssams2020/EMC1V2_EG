/**************************************
* Conditional Processing: Practice #8 *
**************************************/

proc sql;
create table profit as
select o.product_id, Product_Name, Product_Category, 
    (Total_Retail_Price-(CostPrice_per_Unit*Quantity)) 
        as Profit format=dollar12.2 
    from mc1.orders as o inner join mc1.products as p 
	on o.product_id=p.product_id;
quit;
	
proc sgplot data=profit noautolegend;
    hbar Product_Category / response=Profit fillType=gradient categoryorder=respdesc;
run;