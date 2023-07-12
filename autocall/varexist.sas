%macro varexist(dsname,varname);

	/* The OPEN function accesses the table and returns a 
	data set ID that is assigned to the macro variable DSID */
	
	%let dsid = %sysfunc(open(&dsname));
	
	/* The VARNUM function searches the table for the specified
	variable and returns the variable number, which is assigned
	to the macro variable VAL. If the variable is not found, VARNUM
	returns 0. */
	
	%let val = %sysfunc(varnum(&dsid,&varname));
	
	/* Use the CLOSE function to close the table */
	
	%let rc = %sysfunc(close(&dsid));
	
	/* Create macro variable EXIST that is 1 if the 
	column was found in the table and 0 otherwise. */
	
	%if &val>0 %then %do;
	    %let exist=1;
	%end;
	%else %do;
	    %let exist=0;
	%end;
	
	/* Write the value of macro variable EXIST to the 
	input stack */
	
	&exist

%mend;