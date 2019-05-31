data EMWS3.MdlComp3_EMRANK;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree4" MODEL "Tree4" MODELDESCRIPTION "Probability Tree" TARGETLABEL "Replacement: updownInd";
set EMWS3.Tree4_EMRANK;
where upcase(TARGET) = upcase("REP_updownInd");
run;
data EMWS3.MdlComp3_EMSCOREDIST;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree4" MODEL "Tree4" MODELDESCRIPTION "Probability Tree" TARGETLABEL "Replacement: updownInd";
set EMWS3.Tree4_EMSCOREDIST;
where upcase(TARGET) = upcase("REP_updownInd");
run;
data EMWS3.MdlComp3_EMOUTFIT;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree4" MODEL "Tree4" MODELDESCRIPTION "Probability Tree" TARGETLABEL "Replacement: updownInd";
set WORK.Tree4_OUTFIT;
where upcase(TARGET) = upcase("REP_updownInd");
run;
data EMWS3.MdlComp3_EMCLASSIFICATION;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree4" MODEL "Tree4" MODELDESCRIPTION "Probability Tree" TARGETLABEL "Replacement: updownInd";
set EMWS3.Tree4_EMCLASSIFICATION;
where upcase(TARGET) = upcase("REP_updownInd");
run;
data EMWS3.MdlComp3_EMEVENTREPORT;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree4" MODEL "Tree4" MODELDESCRIPTION "Probability Tree" TARGETLABEL "Replacement: updownInd";
set EMWS3.Tree4_EMEVENTREPORT;
where upcase(TARGET) = upcase("REP_updownInd");
run;
data work.MdlComp3_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Reg4" MODEL "Reg4" MODELDESCRIPTION "Logistic Regression - log" TARGETLABEL "Replacement: updownInd";
set EMWS3.Reg4_EMRANK;
where upcase(TARGET) = upcase("REP_updownInd");
run;
data EMWS3.MdlComp3_EMRANK;
set EMWS3.MdlComp3_EMRANK work.MdlComp3_TEMP;
run;
data work.MdlComp3_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Reg4" MODEL "Reg4" MODELDESCRIPTION "Logistic Regression - log" TARGETLABEL "Replacement: updownInd";
set EMWS3.Reg4_EMSCOREDIST;
where upcase(TARGET) = upcase("REP_updownInd");
run;
data EMWS3.MdlComp3_EMSCOREDIST;
set EMWS3.MdlComp3_EMSCOREDIST work.MdlComp3_TEMP;
run;
data work.MdlComp3_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Reg4" MODEL "Reg4" MODELDESCRIPTION "Logistic Regression - log" TARGETLABEL "Replacement: updownInd";
set WORK.Reg4_OUTFIT;
where upcase(TARGET) = upcase("REP_updownInd");
run;
data EMWS3.MdlComp3_EMOUTFIT;
set EMWS3.MdlComp3_EMOUTFIT work.MdlComp3_TEMP;
run;
data work.MdlComp3_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Reg4" MODEL "Reg4" MODELDESCRIPTION "Logistic Regression - log" TARGETLABEL "Replacement: updownInd";
set EMWS3.Reg4_EMCLASSIFICATION;
where upcase(TARGET) = upcase("REP_updownInd");
run;
data EMWS3.MdlComp3_EMCLASSIFICATION;
set EMWS3.MdlComp3_EMCLASSIFICATION work.MdlComp3_TEMP;
run;
data work.MdlComp3_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Reg4" MODEL "Reg4" MODELDESCRIPTION "Logistic Regression - log" TARGETLABEL "Replacement: updownInd";
set EMWS3.Reg4_EMEVENTREPORT;
where upcase(TARGET) = upcase("REP_updownInd");
run;
data EMWS3.MdlComp3_EMEVENTREPORT;
set EMWS3.MdlComp3_EMEVENTREPORT work.MdlComp3_TEMP;
run;
