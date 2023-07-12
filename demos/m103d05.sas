/**********************************************************
* Using the DATA Step to Create Macro Variables: Examples *
**********************************************************/

/* Unsuccessful attempt to assign macro variables conditionally with %LET */
%let make=Honda;

data &make;
    set sashelp.cars end=lastrow;
    where upcase(Make)="%upcase(&make)";
    retain HybridFlag;
    if Type="Hybrid" then HybridFlag=1;
    if lastrow then do;
        if HybridFlag=1 then do;
            %let Foot=&make Offers Hybrid Cars;
        end;
        else do;
            %let Foot=&make Does Not Have a Hybrid Car;
        end;
    end;
run;

/* Assign macro variable conditionally with CALL SYMPUTX */
data &make;
    set sashelp.cars end=lastrow;
    where upcase(Make)="%upcase(&make)";
    retain HybridFlag;
    if Type="Hybrid" then HybridFlag=1;
    if lastrow then do;
        if HybridFlag=1 then do;
            call symputx("foot", "&make Offers Hybrid Cars");
        end;
        else do;
            call symputx("foot", "&make Does Not Have a Hybrid Car");
        end;
    end;
run;

/* Create a macro variable based on a column value in the data */
%let make=Honda;

data &make;
    set sashelp.cars end=lastrow;
    where upcase(Make)="%upcase(&make)";
    if Type="Hybrid" then HybridCount+1;
    if lastrow=1 then do;
        call symputx("hybridnum", HybridCount);
    end;
run;

/* Create macro variables and assign values based on columns in the data */
data _null_;
    set mc1.storm_basin_codes;
    call symputx(Basin, BasinName);
run;

data _null_;
    set mc1.storm_cat;
    call symputx(cats('wind',Category),MinWind);
run;
