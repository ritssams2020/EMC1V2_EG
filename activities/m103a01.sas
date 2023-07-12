***********************************************************;
*  Activity 3.01                                          *;
*  1) Examine the TITLE statement. What text will appear  *;
*     as the title? Run the program and view the results. *;
*  2) Add % before the UPCASE function in the TITLE       *;
*     statement. Run the program. What text appears as    *;
*     the title?                                          *;
***********************************************************;

%let text=class list;
title "upcase(&text)";
proc print data=sashelp.class;
run;
title;