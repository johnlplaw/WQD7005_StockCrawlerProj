drop _temp_;
if (P_REP_updownIndup ge 0.33374689826302) then do;
_temp_ = dmran(1234);
b_REP_updownInd = floor(1 + 13*_temp_);
end;
else
if (P_REP_updownIndup ge 0.25324675324675) then do;
_temp_ = dmran(1234);
b_REP_updownInd = floor(14 + 3*_temp_);
end;
else
if (P_REP_updownIndup ge 0.08333333333333) then do;
b_REP_updownInd = 17;
end;
else
do;
_temp_ = dmran(1234);
b_REP_updownInd = floor(18 + 3*_temp_);
end;
