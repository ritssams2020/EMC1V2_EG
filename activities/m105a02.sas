***********************************************************;
*  Activity 5.02                                          *;
*  1) Highlight the PROC CATALOG step and run the         *;
*     selected code. Notice in the report that the        *;
*     DATATYP macro program is not listed.                *;
*  2) Run the %LET and %PUT statements that call the      *;
*     %Datatyp macro. View the log and confirm the macro  *;
*     runs successfully.                                  *;
*  3) Highlight the PROC CATALOG step again and run the   *;
*     selected code. Is DATATYP included in the report?   *;
***********************************************************;

proc catalog catalog=work.sasmacr;
	contents;
run;

%let val1=ABC;
%let val2=123;

%put The data type of Val1 is %datatyp(&val1);
%put The data type of Val2 is %datatyp(&val2);




