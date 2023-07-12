/*************************************
* Validating Parameters: Practice #4 *
*************************************/

%macro custtype(type);
    title "&Type Activity Customers by Country";
    proc freq data=mc1.customers order=freq;
        where upcase(Type) contains "&type";
        tables Country;
    run;
    title;
%mend custtype;

%custtype(MEDIUM)