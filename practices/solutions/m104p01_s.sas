/********************************************
* Defining and Calling a Macro: Solution #1 *
********************************************/

 /* Part b. */
%macro customers(type); 
title "&type Customers"; 
proc sql number;
select Name, Age_Group, Type 
    from mc1.customers 
    where Type contains "&type"; 
quit; 
title;
%mend customers;

%customers(Gold)
%customers(High Activity)
 
 /* Part c. */
%macro customers(type); 
%let type=%upcase(&type);
title "&type Customers"; 
proc sql number;
select Name, Age_Group, Type 
    from mc1.customers 
    where upcase(Type) contains "&type";
; 
quit; 
title;
%mend customers;

%customers(High Activity)

 /* Part d. */
%macro customers(type=inactive); 
%let type=%upcase(&type);
title "&type Customers"; 
proc sql number;
select Name, Age_Group, Type 
    from mc1.customers 
    where upcase(Type) contains "&type"; 
quit; 
title;
%mend customers;

%customers(type=High Activity)
%customers()
