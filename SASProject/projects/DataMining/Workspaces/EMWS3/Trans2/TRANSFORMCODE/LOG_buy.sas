label LOG_buy = 'Transformed buy';
if buy eq . then LOG_buy = .;
else do;
if buy + 1 > 0 then LOG_buy = log(buy + 1);
else LOG_buy = .;
end;
