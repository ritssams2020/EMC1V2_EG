***********************************************************;
*  Activity 5.04                                          *;
*  1) Notice that the program includes two SELECT         *;
*     statements. Run the program. The first report       *;
*     includes the distinct values of Origin. The second  *;
*     report includes a separate WHEN statement for each  *;
*     value of Origin.                                    *;
*  2) Change the value of the Col macro variable to Type. *;
*     Run the program again and observe the two reports.  *;
*  3) What syntax can be used to create macro variables   *;
*     that store the distinct values as a delimited list? *;
***********************************************************;

%let tab=sashelp.cars;
%let col=Origin;
proc sql;
select distinct &col
    from &tab;
select distinct cat('when ("', &col, '") output ', &col) 
    from &tab;
quit;
