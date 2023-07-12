/************************************************
* Generating Data-Dependent Code: Demo Solution *
************************************************/

/* Step 1-2 */

%let tab=mc1.storm_final;
%let col=Ocean;
proc sql noprint;
select distinct &col
    into :tabList separated by " "
    from &tab;
select distinct 
        cat('when ("', &col, '") output ', &col) 
    into :whenList separated by ";"
    from &tab;
quit;

proc sql;
select name, value
    from dictionary.macros
    where name in ("TABLIST", "WHENLIST");
quit;

%symdel tab col tablist whenlist;

/* Step 3 */

%macro splittable_sql(tab,col);
proc sql noprint;
select distinct &col
    into :tablist separated by " "
    from &tab;
select distinct 
        cat('when ("', &col, '") output ', &col) 
    into :whenlist separated by ";"
    from &tab;
quit;

data &tablist;
    set &tab;
    select(&col);
	    &whenlist;
        otherwise;
    end;
run;
%mend splittable_sql;

/* Step 4 */
%splittable_sql(sashelp.cars, Type)

/* Step 5 */
%splittable_sql(mc1.storm_final, Basin)
