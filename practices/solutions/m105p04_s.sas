/*************************************
* Validating Parameters: Solution #4 *
*************************************/

%macro custtype(type) / minoperator;
%if  &type= %then %do;
    %put ERROR: Missing TYPE;
    %put ERROR: Valid TYPE values are HIGH, MEDIUM, LOW;
%end;
%else %do;
	%let type=%upcase(&type);
	%if &type in HIGH MEDIUM LOW %then %do;
	    title "&Type Activity Customers by Country";
	    proc freq data=mc1.customers order=freq;
	        where upcase(Type) contains "&type";
	        tables Country;
	    run;
	    title;
	%end;
	%else %do;
	    %put ERROR: Invalid TYPE: &type;
	    %put ERROR: Valid TYPE values are HIGH, MEDIUM, LOW;
	%end;
%end;
%mend custtype;

%custtype(HIGH)
%custtype(low)
%custtype(med)
%custtype()
