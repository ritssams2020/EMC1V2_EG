/************************************
* Macro Variable Scope: Practice #6 *
************************************/

%macro number_of_rows(table);
options nonotes;
data _null_;
    call symputx("numrows", number);
    stop;
    set &table nobs=number;
run;
%mend number_of_rows;

%number_of_rows(mc1.customers)
%put mc1.customers has &numrows rows.;

%symdel numrows;
options notes;


