***********************************************************;
*  Activity 5.06                                          *;
*  1) Review the program and notice that the query is     *;
*     reading all columns from the dictionary.columns     *;
*     table for sashelp.cars. Run the program and observe *;
*     the information available in the generated report.  *;
*  2) Modify the query to create a macro variable named   *;
*     Varlist that is a comma-delimited list of values in *;
*     the Name column.                                    *;
*  3) Add &Varlist after the colon in the %PUT statement. *;
*     Run the program and verify that the log lists the   *;
*     column names.                                       *;
*  4) Modify the program to examine the columns in        *;
*     sashelp.class. Run the program. How many columns    *;
*     are listed in the log?                              *;
***********************************************************;

options nolabel;
proc sql;
select *
	from dictionary.columns
	where libname="SASHELP" and 
		  memname="CARS";
quit;

%put NOTE: Columns in SASHELP.CARS include: ;

options label;


