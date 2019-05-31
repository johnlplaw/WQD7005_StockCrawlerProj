select 
k.thedate, k.thetime, k.comp_name, k.comp_code, k.stock_code, c.Category, c.Sub_category, k.open, k.low, k.high, k.lastDone, k.chg, k.chgPercent, k.vol, k.buy, k.buyval, k.sell, k.sellval, k.crawl_Timestamp, k.v_updownpercent,
(
case when k.v_updownpercent > 0 then 'up'
when k.v_updownpercent < 0 then 'down'
when k.v_updownpercent = 0 then 'unchange'
end
) as updownInd
from upd_klse
k
inner join compcat c
on k.comp_code = c.compCode
where c.category = 'main'
and c.Sub_category = 'energy';