label LOG_open = 'Transformed open';
if open eq . then LOG_open = .;
else do;
if open + 1 > 0 then LOG_open = log(open + 1);
else LOG_open = .;
end;
