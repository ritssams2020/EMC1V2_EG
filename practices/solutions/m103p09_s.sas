/******************************************************
* Indirect References to Macro Variables: Solution #9 *
******************************************************/

 /* Part b. */
data _null_;
    set mc1.country_codes;
    call symputx(CountryCode,CountryName);
run;

 /* Part c. */
%let code=LU;
title "Customers Residing in &&&code";
proc print data=mc1.customers;
    id ID;
    var Name Age_Group;
    where Country="&code";
run;
title;

 /* Part d. */
%let code=ZA;
title "Customers Residing in &&&code";
proc print data=mc1.customers;
    id ID;
    var Name Age_Group;
    where Country="&code";
run;
title;
