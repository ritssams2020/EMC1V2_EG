/********************************************
* Understanding Symbol Tables: Solution #4 *
********************************************/

 /* Part a. */
%let Zip=27513; 
%macro whereis; 
    %let state=%sysfunc(zipnamel(&Zip));
    %put The Zip Code &Zip is in &state;
    %put _user_;
%mend whereis;

%whereis
%symdel ZIP;


 /* Part b. */
%macro whereis; 
    %let Zip=10312; 
    %let state=%sysfunc(zipnamel(&Zip));
    %put The Zip Code &Zip is in &state;
    %put _user_;
%mend whereis;

%whereis
%symdel ZIP;


 /* Part c. */
%macro whereis(Zip); 
    %let state=%sysfunc(zipnamel(&Zip));
    %put The Zip Code &Zip is in &state;
    %put _user_;
%mend whereis;

%whereis(91219)
%symdel ZIP;
