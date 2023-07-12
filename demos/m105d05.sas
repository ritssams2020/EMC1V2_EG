options mprint;

%macro splittable(tab,col);

options sasautos=("&path/autocall",sasautos);

/* Ensure parameter values are uppercase */
%let tab=%upcase(&tab);
%let col=%upcase(&col);

/* If only a table name is provided, add prefix WORK. */
%if %scan(&tab,2)= %then %do;
    %let tab=WORK.&tab;
%end;

/* Check if the table exists */
%if %sysfunc(exist(&tab))=0 %then %do;
	%put ERROR: &tab does not exist.;
	%put ERROR- Macro will stop executing.;
	%return;
%end;

/* Check if the column exists in the selected table */
%else %if %varexist(&tab,&col)=0 %then %do;
	proc sql noprint;
	select Name
	    into :varlist separated by ", "
		from dictionary.columns
		where libname="%scan(&tab,1)" and 
		      memname="%scan(&tab,2)";
	quit;
	%put ERROR: Column &col does not exist in &tab..;
	%put ERROR- Columns in &tab include &varlist..;
	%put ERROR- Macro will stop executing.;
	%return;
%end;

/* Create macro variables if COL is numeric */
%else %if %vartype(&tab,&col)=N %then %do;
proc sql noprint;
select distinct &col, cats("&col._", &col)
    into :val1-, :table1-
    from &tab
    where &col is not missing;
quit;
%end;

/* Create macro variables if COL is character */
%else %if %vartype(&tab,&col)=C %then %do;
proc sql noprint;
select distinct &col format=$quote34., 
                compress(&col,,'nk')
    into :val1-, :table1-
    from &tab
    where &col is not missing;
quit;
%end;
	
/* Build DATA step */
	data 
	    %do i=1 %to &sqlobs;
	        &&table&i
	    %end;
	;
	    set &tab;
	    select(&col);
	    %do i=1 %to &sqlobs;
	        when (&&val&i) output &&table&i;
	    %end;
	    otherwise;
	    end;
	run;

%mend splittable;

options mprint;
/* (1) Column with valid table names */
%splittable(mc1.storm_final,Ocean)

/* (2) Table does not exist */
%splittable(false, ID)

/* (3) Column does not exist */
%splittable(sashelp.cars, Test)

/* (4) Column includes values with invalid characters */
%splittable(sashelp.cars, Make)

/* (5) Column is numeric */
%splittable(mc1.orders, Order_Type)

options nomprint;
