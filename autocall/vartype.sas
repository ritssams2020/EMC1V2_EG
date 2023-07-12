%macro vartype(dsname,varname);

	/* The OPEN function accesses the table (&DSNAME) and returns a 
	data set ID that is assigned to the macro variable DSID. 
	The data set ID is required for the other functions used. */
	
   %let dsid = %sysfunc(open(&dsname));

	/* The VARNUM function searches the data set ID (&DSID) for the 
	specified variable (&VARNAME) and returns the variable ID, 
	which is assigned to the macro variable VARID. If the variable 
	is not found, VARID will be 0. The variable ID value is used in 
	the next function. */
	
   %let varid = %sysfunc(varnum(&dsid,&varname));

	/* The VARTYPE function identifies a column based on the data 
	set ID and variable ID. The function returns C for character 
	or N for numeric and stores the value in the VAR macro variable. */
	
   %let val = %sysfunc(vartype(&dsid,&varid));

	/* The CLOSE function closes the selected data set. */
	
   %let rc = %sysfunc(close(&dsid));

	/* Write the value of macro variable VAL (C or N) to the 
	input stack */
	
    &val

%mend;