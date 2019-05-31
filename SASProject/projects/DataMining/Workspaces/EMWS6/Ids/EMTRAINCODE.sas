*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS6 "C:\JohnLaw\OneDrive\WQD Data Science\WQD7005\SASProject\projects\DataMining\Workspaces\EMWS6";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS6.Ids_DATA (label="")
/ view=EMWS6.Ids_DATA
;
set WQD7005.CLUSTERED_STOCK_TRAIN;
run;
