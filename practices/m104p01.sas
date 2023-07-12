/********************************************
* Defining and Calling a Macro: Practice #1 *
********************************************/

%let type=Gold;
title "&type Customers"; 
proc sql number;
select Name, Age_Group, Type 
    from mc1.customers 
    where Type contains "&type"; 
quit; 
title;

