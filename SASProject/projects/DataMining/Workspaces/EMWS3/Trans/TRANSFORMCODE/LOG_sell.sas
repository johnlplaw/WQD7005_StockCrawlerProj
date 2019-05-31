label LOG_sell = 'Transformed sell';
if sell eq . then LOG_sell = .;
else do;
if sell + 1 > 0 then LOG_sell = log(sell + 1);
else LOG_sell = .;
end;
