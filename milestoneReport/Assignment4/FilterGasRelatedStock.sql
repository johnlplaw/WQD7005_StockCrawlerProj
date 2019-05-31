select 
thedate, 
sum(GASMSIA) as GASMSIA,
sum(PETGAS) as PETGAS,
sum(PETGAS_CR) as PETGAS_CR,
sum(PETGAS_CS) as PETGAS_CS,
sum(SIGGAS) as SIGGAS
from (

select 
thedate,
if(comp_code = 'GASMSIA', lastDone, 0) as GASMSIA,
if(comp_code = 'PETGAS', lastDone, 0) as PETGAS,
if(comp_code = 'PETGAS-CR', lastDone, 0) as PETGAS_CR,
if(comp_code = 'PETGAS-CS', lastDone, 0) as PETGAS_CS,
if(comp_code = 'SIGGAS', lastDone, 0) as SIGGAS

from(

select distinct thedate, comp_code, lastDone  from upd_klse
where comp_code in ('GASMSIA','PETGAS','PETGAS-CR','PETGAS-CS','SIGGAS')

) SrcTbl

) p_SrcTbl
group by thedate