/*************************************
* Iterative Processing: Practice #10 *
*************************************/

title "Order Type: 1";
proc means data=mc1.orders sum mean maxdec=2;
    where Order_Type=1;
    var Total_Retail_Price CostPrice_Per_Unit;
run;
