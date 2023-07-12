/**************************************************
* Creating and Using Macro Variables: Practice #1 *
**************************************************/

title 'US Customers Ages 18 to 24'; 
proc print data=mc1.customers; 
    var Name Age Type; 
    where Country = 'US'
        and Age between 18 and 24;
run; 
title; 
