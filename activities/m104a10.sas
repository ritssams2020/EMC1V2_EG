***********************************************************;
*  Activity 4.10                                          *;
*     Complete the query to generate a macro variable     *;
*     named List that includes a space-delimited list of  *;
*     the distinct values of Cylinders.                   *;
***********************************************************;

proc sql noprint;
select distinct Cylinders
    
    from sashelp.cars
    where Cylinders ne .;
quit;

%put &=list;
