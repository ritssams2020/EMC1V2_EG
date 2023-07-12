/*******************************
* Macro Functions: Solution #1 *
*******************************/

 /* Part a. */
%let fullname=AnTHoNY MilLeR;
%put &fullname;

%let fullname=%upcase(&fullname);
%put &fullname in proper case is %sysfunc(propcase(&fullname)).;

 /* Part b. */
%let first=%sysfunc(propcase(%scan(&fullname,1)));
%let last=%sysfunc(propcase(%scan(&fullname,-1)));
%put &=fullname &=first &=last;

 /* Part c. */
%symdel fullname first last;
%put _user_;
