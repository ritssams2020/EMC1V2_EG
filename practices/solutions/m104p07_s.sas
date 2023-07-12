/**************************************
* Conditional Processing: Solution #7 *
**************************************/

%macro customerlist(country);
proc print data=mc1.customers noobs;
	%if &country= %then %do;
		title "All Customers";
		var ID Name Country Type Age_Group;
	%end;
	%else %do;
		title "Customers from Country: &country";
		where Country="&country";
		var ID Name Type Age_Group;
	%end;
run;
	
%mend customerlist;
%customerlist()
%customerlist(AU)