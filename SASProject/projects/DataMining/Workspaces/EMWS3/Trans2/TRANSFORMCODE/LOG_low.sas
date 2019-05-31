label LOG_low = 'Transformed low';
if low eq . then LOG_low = .;
else do;
if low + 1 > 0 then LOG_low = log(low + 1);
else LOG_low = .;
end;
