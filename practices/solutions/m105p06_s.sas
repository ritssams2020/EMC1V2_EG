/*************************************
* Validating Parameters: Solution #6 *
*************************************/

%macro customerlist(ctry) / minoperator; 
%if %superq(ctry)= %then %do; 
    title "All Customers"; 
    proc sgplot data=mc1.customers noborder; 
        vbar Group / filltype=gradient stat=percent; 
        yaxis grid display=(noticks noline nolabel); 
    run; 
    %return;
    title;
%end; 

%let ctry=%upcase(&ctry); 
proc sql noprint; 
select distinct Country 
    into :CtryList separated by " " 
    from mc1.customers; 
quit; 

%if not(%superq(ctry) in %superq(CtryList)) %then %do; 
    %put ERROR: &ctry is an invalid country code; 
    %put ERROR- Valid country codes include &CtryList;
    %return; 
%end; 

title "Customers from &ctry"; 
proc sgplot data=mc1.customers noborder; 
    vbar Group / filltype=gradient stat=percent; 
    yaxis grid display=(noticks noline nolabel); 
    where Country="&ctry";
run;
title; 
%mend customerlist; 

%customerlist() 
%customerlist(AU) 
%customerlist(in) 
%customerlist(zz)
