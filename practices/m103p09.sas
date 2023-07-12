/******************************************************
* Indirect References to Macro Variables: Practice #9 *
******************************************************/

%let code=LU;
title "Customers Residing in &code";
proc print data=mc1.customers;
    id ID;
    var Name Age_Group;
    where Country="&code";
run;
title;
