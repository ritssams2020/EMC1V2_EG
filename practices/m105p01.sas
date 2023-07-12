/**********************************************
* Generating Data-Dependent Code: Practice #1 *
**********************************************/

title "Group: GOLD HIGH ACTIVITY";
proc print data=mc1.customers;
	where upcase(Type)="GOLD HIGH ACTIVITY";
run;
