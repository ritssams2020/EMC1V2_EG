/**************************************
* Conditional Processing: Practice #9 *
**************************************/

%macro SalesSummary(ot);
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
%mend SalesSummary;

%SalesSummary(1)