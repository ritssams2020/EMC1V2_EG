/******************************************************
* Indirect References to Macro Variables: Practice #8 *
******************************************************/

%let code=1;
title "High Profit Products for Type&code Orders";
proc sql number;
select Product_ID format=z12.,
       Sum(Total_Retail_Price) format=dollar10.2 as GrossSales,
       Sum(Total_Retail_Price-CostPrice_Per_Unit) format=dollar10.2 as Profit
    from mc1.orders
    where Order_Type=&code 
    group by Product_ID
    having profit /grosssales > .95
    order by Profit desc;
quit;
title;
