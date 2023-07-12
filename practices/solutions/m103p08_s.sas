/******************************************************
* Indirect References to Macro Variables: Solution #8 *
******************************************************/

 /* Parts c-d. */
proc sql noprint;
select Order_Type
    into :type1-
    from mc1.order_type_codes;
quit;
%put &=type1 &=type2 &=type3;

 /* Part e. */
%let code=1;
title "High Profit Products for &&type&code Orders";
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

 /* Part f. */
%let code=3;
title "High Profit Products for &&type&code Orders";
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
