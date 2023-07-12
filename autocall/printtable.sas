%macro printtable(dsn=sashelp.cars,obs=5)
        /des='Print a table. Parms: DSN= OBS=';
    proc print data=&dsn(obs=&obs);
    run; 
%mend printtable;
