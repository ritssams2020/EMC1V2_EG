***********************************************************;
*  Activity 3.04                                          *;
*  1) Run the program with Acura as the value of Make.    *;
*     First, examine the output data and confirm that the *;
*     value of HybridFlag is missing for the last row     *;
*     because there are no hybrid cars. Second, confirm   *;
*     that the footnote for the report is correct.        *;
*  2) Modify the %LET statement to assign Honda as the    *;
*     value of the Make macro variable. Run the program   *;
*     and view the output data. Confirm that the value of *;
*     HybridFlag is 1 for the last row.                   *;
*  3) Examine the report. Is the footnote correct?        *;
***********************************************************;

%let make=Acura;

data &make(keep=Make Model Type MSRP HybridFlag);
    set sashelp.cars end=lastrow;
    where upcase(Make)="%upcase(&make)";
    retain HybridFlag;
    if Type="Hybrid" then HybridFlag=1;
    if lastrow then do;
        if HybridFlag=1 then do;
            %let foot=&make Offers Hybrid Cars;
        end;
        else do;
            %let foot=&make Does Not Have a Hybrid Car;
        end;
    end;
run;

title "&make Cars";
footnote "&foot";
proc print data=&make noobs;
	var Model Type MSRP;
run;
title;footnote;
