/*******************************
* Macro Functions: Solution #3 *
*******************************/
 
 /* Part a. */
%let birthdate=01Jan1990;
%put My age is %sysevalf((%sysfunc(today())-"&birthdate"d)/365.25);

 /* Part b. */
%put My age is %sysevalf((%sysfunc(today())-"&birthdate"d)/365.25, int);

