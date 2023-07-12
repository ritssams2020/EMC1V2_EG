/**********************************************
* Generating Data-Dependent Code: Solution #3 *
**********************************************/

%macro columnreport(tab);

%let tab=%upcase(&tab);

title "Analysis of Columns from &tab Table";
proc sql;
select Name, Label, Type, Length, Format
    from dictionary.columns
    where libname="%scan(&tab,1)" and
          memname="%scan(&tab,2)";
quit;
 
proc sql noprint;
select Name, Type
    into :col1-, :type1-
    from dictionary.columns
    where libname="%scan(&tab,1)" and 
          memname="%scan(&tab,2)";
quit;

%do i=1 %to &sqlobs;
title "Distribution of &&Col&i";
    %if &&type&i=num %then %do; 
		proc sgplot data=&tab;
			histogram &&col&i;
		run;
	%end;

    %else %do;
	    proc sgpie data=&tab;
			donut &&col&i;
		run;
    %end;
%end;
%mend columnreport;

%columnreport(mc1.storm_final)
%columnreport(mc1.customers)
 
 