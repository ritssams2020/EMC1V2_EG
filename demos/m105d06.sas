 /**********************************************************/
 /* Validating Parameters: Alternate Demo                  */
 /*                                                        */
 /* Below is an alternative to using VAREXIST and VARTYPE  */
 /* autocall macros. These examples reference autocall     */
 /* macros VARATTRSL or VARATTRSG and VARATTRSDLET. These  */
 /* macro programs use the DICTIONARY.COLUMNS table to     */
 /* create local or global macro variables that store      */
 /* column attributes.                                     */
 /*--------------------------------------------------------*/

 /* ------------------------------------------------------ */
 /* Set up autocall library                                */
 /*--------------------------------------------------------*/
options mautosource mautolocdisplay
        sasautos=("&path\autocall",sasautos);

 /*---------------------------------------------------------*/
 /* LOCAL Variables VERSION                                 */
 /* Using %LOCAL statement and variables that are placed    */
 /* in the SPLITTABLE Macro's Local Symbol Table:           */ 
 /*                                                         */
 /* This version uses the VARATTRL autocall macro that      */
 /* creates macro variables storing column attributes for   */
 /*	the specified column and table. Variables are stored in */
 /* in the SPLITTABLE macro's local symbol table by         */
 /* using a %LOCAL statement in the SPLITTABLE macro.       */ 
 /*---------------------------------------------------------*/
%macro splittable2(lib,dsn,col);
%let lib=%upcase(&lib);
%let dsn=%upcase(&dsn);
%let col=%upcase(&col);
%local vtype vlength vpos vlabel vformat vexist;

%varattrsl
    /* Check if the table exists */
    %if %sysfunc(exist(&lib..&dsn))=0 %then %do;
	    %put; %put;
        %put ERROR: Table &lib..&dsn does not exist.;
        %put ERROR- Macro will stop executing.;
		%put; %put;
        %return;
    %end;
    /* Check if the column exists in the selected table */
    %else %if &vexist=0 %then %do;
        proc sql noprint;
        select Name into :varlist separated by ", "
            from dictionary.columns
            where libname="&lib"
            and memname="&dsn";
        quit;
		%put; %put;
        %put ERROR: Column &col does not exist in &lib..&dsn..;
        %put ERROR- Columns in &lib..&dsn include:;
        %put ERROR- &=varlist;
        %put ERROR- Macro will stop executing.;
		%put; %put;
        %return;
    %end;
	/* If the column is a numeric type, then generate
	   not quoted values to use on the WHEN clauses. */
    %if &vtype=num %then %do;
        proc sql noprint;
        select distinct &col, cats("&col._", &col)
            into :Val1-, :Table1-
            from &&lib..&dsn
            where &col is not missing;
        quit;
    %end;
	/* If the column is a character type, then generate
	   quoted values to use on the WHEN clauses. */
	%else %if &vtype=char %then %do;
        proc sql noprint;
        select distinct &col format=$quote34., compress(&col,,'nk')
            into :val1-, :table1-
            from &lib..&dsn
            where &col is not missing;
        quit;
    %end;
	/* Build the Data Step */
	data 
    %do i=1 %to &sqlobs;
        &&Table&i
    %end;
    ;
        set &lib..&dsn;
        select(&col);
            %do i=1 %to &sqlobs;
            when (&&val&i) output &&table&i;
            %end;
            otherwise;
        end;
    run;
%mend splittable2;

 /* Test the SplitTable Macro */
%splittable2(mc1,customer,id)        /* bad data set */
%splittable2(mc1,customers,bogus)    /* bad column   */

 /* Run the SplitTable Macro with good data */
%splittable2(mc1,customers,country)  /* good character column */
%splittable2(mc1,customers,age)      /* good number column */
%splittable2(sashelp,cars,make)      /* good character column */
%splittable2(sashelp,cars,cylinders) /* good number column */

%put _user_;






 /*---------------------------------------------------------*/
 /* GLOBAL Variables VERSION                                */
 /*                                                         */ 
 /* This version uses the VARATTRG autocall macro that      */
 /* creates macro variables storing column attributes for   */
 /* the specified column and table. Variables are stored in */
 /* global macro variables.                                 */
 /*                                                         */
 /* In this way, there is no dependency on the values used  */
 /* by the VARATTRG autocall macro coming from macro        */
 /* variables named lib, dsn, and col (those used by the    */
 /* SPLITTABLE parameters). This makes the VARATTRG more    */
 /* flexible to use with other calling macro definitions,   */
 /* as long as the proper values are passed into the        */
 /* autocall macro, then it will deliver proper values to   */
 /* the global symbol table attribute variables.            */ 
 /*---------------------------------------------------------*/
%macro splittable2(lib,dsn,col);
%let lib=%upcase(&lib);
%let dsn=%upcase(&dsn);
%let col=%upcase(&col);

%varattrsg(&lib,&dsn,&col)
    /* Check if the table exists */
    %if %sysfunc(exist(&lib..&dsn))=0 %then %do;
	    %put; %put;
        %put ERROR: Table &lib..&dsn does not exist.;
        %put ERROR- Macro will stop executing.;
 		%put; %put;
		%varattrsdlet
        %return;
    %end;
    /* Check if the column exists in the selected table */
    %else %if &vexist=0 %then %do;
        proc sql noprint;
        select Name into :varlist separated by ", "
            from dictionary.columns
            where libname="&lib"
            and memname="&dsn";
        quit;
		%put; %put;
        %put ERROR: Column &col does not exist in &lib..&dsn..;
        %put ERROR- Columns in &lib..&dsn include:;
        %put ERROR- &=varlist;
        %put ERROR- Macro will stop executing.;
		%put; %put;
        %varattrsdlet
        %return;
    %end;
	/* If the column is a numeric type, then generate
	   not quoted values to use on the WHEN clauses. */
    %if &vtype=num %then %do;
        proc sql noprint;
        select distinct &col, cats("&col._", &col)
            into :Val1-, :Table1-
            from &&lib..&dsn
            where &col is not missing;
        quit;
    %end;
	/* If the column is a character type, then generate
	   quoted values to use on the WHEN clauses. */
	%else %if &vtype=char %then %do;
        proc sql noprint;
        select distinct &col format=$quote34., compress(&col,,'nk')
            into :val1-, :table1-
            from &lib..&dsn
            where &col is not missing;
        quit;
    %end;
	/* Build the Data Step */
	data 
    %do i=1 %to &sqlobs;
        &&Table&i
    %end;
    ;
        set &lib..&dsn;
        select(&col);
        %do i=1 %to &sqlobs;
            when (&&val&i) output &&table&i;
        %end;
            otherwise;
        end;
    run;
	%varattrsdlet
%mend splittable2;

%splittable2(mc1,customer,id)        /* bad data set */
%splittable2(mc1,customers,bogus)    /* bad column   */

 /* Run the SplitTable Macro with good data */
%splittable2(mc1,customers,country)  /* good character column */
%splittable2(mc1,customers,age)      /* good number column */
%splittable2(sashelp,cars,make)      /* good character column */
%splittable2(sashelp,cars,cylinders) /* good number column */

%put _user_;

