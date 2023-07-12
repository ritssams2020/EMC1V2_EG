/**********************************************
* Generating Data-Dependent Code: Practice #3 *
**********************************************/

%let tab=SASHELP.CARS;

title "Analysis of Columns from &tab Table";
proc sql;
select Name, Label, Type, Length, Format
   from dictionary.columns
   where libname="%scan(&tab,1)" and 
		 memname="%scan(&tab,2)";
quit;
 
/* Numeric Column */
proc sgplot data=&tab;
	histogram MSRP;
run;

/* Character Column */
proc sgpie data=&tab;
    donut Type;
run;