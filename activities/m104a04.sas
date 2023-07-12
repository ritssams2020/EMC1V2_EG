***********************************************************;
*  Activity 4.04                                          *;
*  1) Notice that the %LET statement outside the %Test    *;
*     macro program sets the value of X to OutsideMacro.  *;
*     Then the %LET statement inside the %Test macro      *;
*     program sets the value of X to InsideMacro.         *;
*  2) Submit the program and examine the log. What is the *;
*     value of X before, during, and after macro          *;
*     execution?                                          *;
***********************************************************;

/* Assign a value to X & write to log */
%let X=OutsideMacro;
%put NOTE: &=X before TEST macro execution.;

/* Define the macro test */
%macro test;
    %let x=InsideMacro;
    %put NOTE: &=X during TEST macro execution.;
%mend;

/* Execute the test macro */
%test

/* Check the value to X after execution */
%put NOTE: &=X after TEST macro execution.;
