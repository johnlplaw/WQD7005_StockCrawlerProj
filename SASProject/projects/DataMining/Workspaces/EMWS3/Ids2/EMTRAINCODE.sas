*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS3 "C:\JohnLaw\OneDrive\WQD Data Science\WQD7005\SASProject\projects\DataMining\Workspaces\EMWS3";
*------------------------------------------------------------*;
* Ids2: Creating DATA data;
*------------------------------------------------------------*;
data EMWS3.Ids2_DATA (label="")
/ view=EMWS3.Ids2_DATA
;
set WQD7005.LAB2SCORE_TRAIN;
run;
