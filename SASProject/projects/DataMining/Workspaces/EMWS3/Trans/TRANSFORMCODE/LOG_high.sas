label LOG_high = 'Transformed high';
if high eq . then LOG_high = .;
else do;
if high + 1 > 0 then LOG_high = log(high + 1);
else LOG_high = .;
end;
