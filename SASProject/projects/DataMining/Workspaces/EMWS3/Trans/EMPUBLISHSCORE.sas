*------------------------------------------------------------*;
* Computed Code;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TRANSFORM: buy , log(buy + 1);
*------------------------------------------------------------*;
label LOG_buy = 'Transformed buy';
if buy eq . then LOG_buy = .;
else do;
if buy + 1 > 0 then LOG_buy = log(buy + 1);
else LOG_buy = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: high , log(high + 1);
*------------------------------------------------------------*;
label LOG_high = 'Transformed high';
if high eq . then LOG_high = .;
else do;
if high + 1 > 0 then LOG_high = log(high + 1);
else LOG_high = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: lastDone , log(lastDone + 1);
*------------------------------------------------------------*;
label LOG_lastDone = 'Transformed lastDone';
if lastDone eq . then LOG_lastDone = .;
else do;
if lastDone + 1 > 0 then LOG_lastDone = log(lastDone + 1);
else LOG_lastDone = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: low , log(low + 1);
*------------------------------------------------------------*;
label LOG_low = 'Transformed low';
if low eq . then LOG_low = .;
else do;
if low + 1 > 0 then LOG_low = log(low + 1);
else LOG_low = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: open , log(open + 1);
*------------------------------------------------------------*;
label LOG_open = 'Transformed open';
if open eq . then LOG_open = .;
else do;
if open + 1 > 0 then LOG_open = log(open + 1);
else LOG_open = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: sell , log(sell + 1);
*------------------------------------------------------------*;
label LOG_sell = 'Transformed sell';
if sell eq . then LOG_sell = .;
else do;
if sell + 1 > 0 then LOG_sell = log(sell + 1);
else LOG_sell = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: vol , log(vol + 1);
*------------------------------------------------------------*;
label LOG_vol = 'Transformed vol';
if vol eq . then LOG_vol = .;
else do;
if vol + 1 > 0 then LOG_vol = log(vol + 1);
else LOG_vol = .;
end;
