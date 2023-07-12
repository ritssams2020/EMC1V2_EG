/**************************************
* Conditional Processing: Solution #8 *
**************************************/

libname orion "&path/practices";
%put &=syslibrc;

%if &syslibrc ne 0 %then %do;
	%put ERROR: Because of the error in the LIBNAME statement, the rest of the program will not execute.;
%end;

%else %do;
	proc sql;
	create table orion.profit as
	select o.product_id, Product_Name, Product_Category, 
	       (Total_Retail_Price-(CostPrice_per_Unit*Quantity)) 
	           as Profit format=dollar12.2 
		from mc1.orders as o inner join mc1.products as p 
		on o.product_id=p.product_id;
	quit;
	
	proc sgplot data=orion.profit noautolegend;
		hbar Product_Category / response=Profit fillType=gradient categoryorder=respdesc;
	run;
%end;

