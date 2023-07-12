/************************************************
* Using SQL to Create Macro Variables: Examples *
************************************************/

/* Create macro variable Total */
proc sql;
select count(*) 
    into :total
    from sashelp.cars;
quit;

%put &=total &=sqlobs;

/* Create macro variable Total with leading spaces removed */
proc sql;
select count(*) 
    into :total trimmed
    from sashelp.cars;
quit;

%put &=total &=sqlobs;

/* Create a series of macro variables */
proc sql noprint;
select distinct Origin 
    into :origin1-:origin3
    from sashelp.cars;
quit;

%put &=origin1 &=origin2 &=origin3; 

proc sql noprint;
select distinct Type 
    into :type1-
    from sashelp.cars;
quit;

%put &=type1 &=type2 &=type3 &=type4 &=type5 &=type6 &=sqlobs;

/* Create a macro variable storing a delimited list */
proc sql noprint;
select distinct Origin 
    into :originlist separated by ", "
    from sashelp.cars;
quit;

%put &=originlist &=sqlobs;
