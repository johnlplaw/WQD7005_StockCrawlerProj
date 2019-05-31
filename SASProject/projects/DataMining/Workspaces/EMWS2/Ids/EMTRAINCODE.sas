*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS2 "C:\JohnLaw\OneDrive\WQD Data Science\WQD7005\SASProject\projects\DataMining\Workspaces\EMWS2";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS2.Ids_DATA (label="")
/ view=EMWS2.Ids_DATA
;
set WQD7005.MILESTONE4_TRAIN;
run;
