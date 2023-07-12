/**************************************
* Conditional Processing: Solution #9 *
**************************************/

%macro SalesSummary(ot) / minoperator;
%if not (&ot in 1 2 3) %then %do;
	%put ERROR: &ot is not a valid order type. Order type values include 1 (Retail), 2 (Catalog), and 3 (Internet).;
%end;

%else %do;
	%if &ot=1 %then %let otdesc=Retail;
	%else %if &ot=2 %then %let otdesc=Catalog;
	%else %if &ot=3 %then %let otdesc=Internet;
	
	title "Total Retail Price by Year for &OTDesc Sales";
	proc means data=mc1.orders sum mean median maxdec=0;
		where Order_Type=&ot;
		var Total_Retail_Price;
		class Order_Date;
		format Order_Date year4.;
	run;
%end;
%mend SalesSummary;

%SalesSummary(1)
%SalesSummary(2)
%SalesSummary(3)
%SalesSummary(4)