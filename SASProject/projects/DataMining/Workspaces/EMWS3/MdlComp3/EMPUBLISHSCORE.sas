drop _temp_;
if (P_REP_updownIndup ge 0.99925484753492) then do;
b_REP_updownInd = 1;
end;
else
if (P_REP_updownIndup ge 0.98209361440504) then do;
b_REP_updownInd = 2;
end;
else
if (P_REP_updownIndup ge 0.92017965306507) then do;
b_REP_updownInd = 3;
end;
else
if (P_REP_updownIndup ge 0.69291352308345) then do;
b_REP_updownInd = 4;
end;
else
if (P_REP_updownIndup ge 0.53300409727175) then do;
b_REP_updownInd = 5;
end;
else
if (P_REP_updownIndup ge 0.44966386191775) then do;
b_REP_updownInd = 6;
end;
else
if (P_REP_updownIndup ge 0.2635759081816) then do;
b_REP_updownInd = 7;
end;
else
if (P_REP_updownIndup ge 0.14348249160239) then do;
b_REP_updownInd = 8;
end;
else
if (P_REP_updownIndup ge 0.1099294435753) then do;
b_REP_updownInd = 9;
end;
else
if (P_REP_updownIndup ge 0.07669362745352) then do;
b_REP_updownInd = 10;
end;
else
if (P_REP_updownIndup ge 0.02040867679993) then do;
b_REP_updownInd = 11;
end;
else
if (P_REP_updownIndup ge 0.00155827308033) then do;
b_REP_updownInd = 12;
end;
else
do;
_temp_ = dmran(1234);
b_REP_updownInd = floor(13 + 8*_temp_);
end;
