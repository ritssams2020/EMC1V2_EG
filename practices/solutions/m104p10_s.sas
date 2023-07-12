/*************************************
* Iterative Processing: Solution #10 *
*************************************/

 /* Part b. */
%macro orders;
%do i=1 %to 3;
    title "Order Type: &i";
    proc means data=mc1.orders sum mean maxdec=2;
        where Order_Type=&i;
        var Total_Retail_Price CostPrice_Per_Unit;
    run;
%end;
%mend orders;

%orders


 /* Part c. */
%macro orders;
data _null_;
    set mc1.order_type_codes end=last;
    call symputx(cats("type",Order_type_code), Order_type);
    if last=1 then call symputx("numTypes", _n_);
run;
%do i=1 %to &numTypes;
    title "Order Type: &&type&i";
    proc means data=mc1.orders sum mean maxdec=2;
        where Order_Type=&i;
        var Total_Retail_Price CostPrice_Per_Unit;
    run;
%end;
%mend orders;

%orders

