***********************************************************;
*  Activity 5.03                                          *;
*  1) Run the PROC CATALOG step and confirm that PROPCASE *;
*     does not exist in work.sasmacr.                     *;
*  2) Create a new program and enter the following code.  *;
*     The %Propcase macro applies the PROPCASE function   *;
*     to the text parameter. Do not run the program, but  *;
*     save it as propcase.sas in the autocall folder.     *;
*     %macro propcase(text);                              *;
*         %sysfunc(propcase(&text))                       *;
*     %mend propcase;                                     *;
*  3) Open the libname.sas program. Add an OPTIONS        *;
*     statement and the SASAUTOS= option to include the   *;
*     autocall folder as an additional autocall library.  *;
*     Run the program and save it.                        *;
*  4) Return to the m105a03.sas program and uncomment the *;
*     %PUT statement. Run the program. Confirm that the   *;
*     %Propcase macro executes successfully and verify    *;
*     that it has been added to the work.sasmacr catalog. *;
***********************************************************;

*%put Testing the PROPCASE macro: %propcase(does PROPCASE WorK?);

proc catalog cat=work.sasmacr;
    contents;
run;
