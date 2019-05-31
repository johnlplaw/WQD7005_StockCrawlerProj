select 
comp_code, comp_name, avg(open) as open, avg(low) as low, avg(high) as high, 
avg(lastDone) as lastDone, avg(vol) as vol, avg(buyval) as buyval, 
avg(sellval) as sellVal, avg(chg) as chg, 
sum(
  case when (lastDone - open) > 0 then lastDone - open
  else 0
  end
) as uppricesum,
sum(
  case when (lastDone - open) < 0 then open - lastDone
  else 0
  end
) as downpricesum,
sum(
  case when (lastDone > open) then 1
  else 0
  end
) as upcnt,
sum(
  case when (lastDone < open) then 1
  else 0
  end
) as downcnt,
sum(
  case when (lastDone = open) then 1
  else 0
  end
) as unchgcnt

from (

select 
distinct k.thedate, k.comp_code, k.comp_name, k.open, k.low, 
k.high, k.lastDone, k.vol, k.buyval, k.sellval, 
k.chg, k.v_updownpercent 
from upd_klse k
inner join compcat c
on k.comp_code = c.compCode
where c.category = 'main'

) as t

group by comp_code, comp_name