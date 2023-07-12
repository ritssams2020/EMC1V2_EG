/***********************
* Storing Macros: Demo *
***********************/

/* Section 1 */

data _null_;
    set mc1.country_codes;
    call symputx(CountryCode, CountryName);
run;

proc sql;
select * 
    from dictionary.macros
    order by Scope, Name;
quit;

/* Section 2 */

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

/* Section 3 */

proc catalog cat=work.sasmacr;
    delete deleteall.macro;
run;

