/**************************************************
* Creating and Using Macro Variables: Solution #1 *
**************************************************/

 /* Part b. */
%let Country=US;
title "&Country Customers Ages 18 to 24";
proc print data=mc1.customers;
    var Name Age Type;
    where Country = "&Country"
        and Age between 18 and 24;
run;
title;

 /* Part c. */
%let Country=FR;
title "&Country Customers Ages 18 to 24";
proc print data=mc1.customers;
    var Name Age Type;
    where Country = "&Country"
        and Age between 18 and 24;
run;
title;

 /* Part d. */
%let Country=AU;
%let age1=25;
%let age2=34;
title "&Country Customers Ages &age1 to &age2";
proc print data=mc1.customers;
    var Name Age Type;
    where Country = "&Country"
        and Age between &age1 and &age2;
run; 
title;
