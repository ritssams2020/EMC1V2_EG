/***************************************
* Generating Data-Dependent Code: Demo *
***************************************/

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