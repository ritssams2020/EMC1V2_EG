/********************************
* Storing Macros: Demo Solution *
********************************/

/* Steps 1-3 */

data _null_;
    set mc1.country_codes;
    call symputx(CountryCode, CountryName);
run;

proc sql;
select * 
    from dictionary.macros
    order by Scope, Name;
quit;

/* Step 4 */

proc sql;
select *
    from dictionary.macros
    where Scope='GLOBAL' and 
          Name not like 'SYS%' and 
          Name not like 'SQL%' and
          Name not like 'SASWORK%' and
          Name not like 'GRAPH%' and
          Name not like 'STUDIO%' and
          Name not like 'OLD%' and
          Name not like '^_%' escape '^' and
          Name ne 'CLIENTMACHINE' and
          Name ne 'USERDIR';
quit;

/* Step 5 */

proc sql noprint;
select Name
    into :Vars separated by ' '
    from dictionary.macros
    where Scope='GLOBAL' and 
          Name not like 'SYS%' and 
          Name not like 'SQL%' and
          Name not like 'SASWORK%' and
          Name not like 'GRAPH%' and
          Name not like 'STUDIO%' and
          Name not like 'OLD%' and
          Name not like '^_%' escape '^' and
          Name ne 'CLIENTMACHINE' and
          Name ne 'USERDIR';
quit;
%put &=vars;

/* Step 6 */

%macro deleteall;
proc sql noprint;
select Name
    into :Vars separated by ' '
    from dictionary.macros
    where Scope='GLOBAL' and 
          Name not like 'SYS%' and 
          Name not like 'SQL%' and
          Name not like 'SASWORK%' and
          Name not like 'GRAPH%' and
          Name not like 'STUDIO%' and
          Name not like 'OLD%' and
          Name not like '^_%' escape '^' and
          Name ne 'CLIENTMACHINE' and
          Name ne 'USERDIR';
quit;
%symdel &vars;
%put NOTE: Macro variables deleted from global table: &vars;
%mend deleteall; 

/* Steps 7-8: 
   7. Save this program as deleteall.sas in the autocall folder 
   8. Add the following statement in the libname.sas program:
      options sasautos=("&path/autocall", sasautos);
*/

/* Step 9 */

proc catalog cat=work.sasmacr;
    delete deleteall.macro;
run;

/* Step 10 */

data _null_;
    set mc1.country_codes;
    call symputx(CountryCode, CountryName);
run;

%deleteall

proc sql;
select * 
    from dictionary.macros
    order by Scope, Name;
quit;




