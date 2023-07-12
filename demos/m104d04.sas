/*********************************************************
* Conditional Processing in a Macro Definition: Examples *
*********************************************************/

%macro avgfuel(loc);
%let loc=%upcase(&loc);
%if &loc= %then %do;
    %put ERROR: Please provide a value for Origin.;
    %put ERROR- Valid values include Asia, Europe, and USA.;
%end;
%else %do;
data fuel_&loc;
    set sashelp.cars;
    where upcase(Origin)="&loc";
    %if &loc=USA %then %do;
        AvgMPG=mean(MPG_City, MPG_Highway);
        keep Make Model Type AvgMPG;
    %end;
    %else %do;
        AvgKmL=mean(MPG_City, MPG_Highway)*.425;
        keep Make Model Type AvgKmL;
    %end;
    format 
	    %if &loc=USA %then %do;
	        AvgMGP
	    %end;
	    %else %do;
	        AvgKmL
    %end;
    4.1;
run;
%end;
%mend avgfuel;

%avgfuel()
%avgfuel(Asia)
%avgfuel(europe)
%avgfuel(usa)
