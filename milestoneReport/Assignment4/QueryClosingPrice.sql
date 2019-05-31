select comp_code, comp_name,
sum(closing1) as closing1,
sum(closing2) as closing2,
sum(closing3) as closing3,
sum(closing4) as closing4,
sum(closing5) as closing5,
sum(closing6) as closing6,
sum(closing7) as closing7,
sum(closing8) as closing8,
sum(closing9) as closing9,
sum(closing10) as closing10,

sum(closing11) as closing11, 
sum(closing12) as closing12,
sum(closing13) as closing13, 
sum(closing14) as closing14,
sum(closing15) as closing15,
sum(closing16) as closing16,
sum(closing17) as closing17,
sum(closing18) as closing18, 
sum(closing19) as closing19,
sum(closing20) as closing20,

sum(closing21) as closing21, 
sum(closing22) as closing22,
sum(closing23) as closing23, 
sum(closing24) as closing24,
sum(closing25) as closing25,
sum(closing26) as closing26, 
sum(closing27) as closing27,
sum(closing28) as closing28, 
sum(closing29) as closing29,
sum(closing30) as closing30,

sum(closing31) as closing31, 
sum(closing32) as closing32,
sum(closing33) as closing33, 
sum(closing34) as closing34,
sum(closing35) as closing35,
sum(closing36) as closing36, 
sum(closing37) as closing37,
sum(closing38) as closing38, 
sum(closing39) as closing39,
sum(closing40) as closing40,

sum(closing41) as closing41, 
sum(closing42) as closing42,
sum(closing43) as closing43, 
sum(closing44) as closing44,
sum(closing45) as closing45, 
sum(closing46) as closing46

from (

select comp_code, comp_name,
if(thedate = '2019-02-22', lastDone, 0) as closing1,

if(thedate = '2019-02-25', lastDone, 0) as closing2,
if(thedate = '2019-02-26', lastDone, 0) as closing3,
if(thedate = '2019-02-27', lastDone, 0) as closing4,
if(thedate = '2019-02-28', lastDone, 0) as closing5,
if(thedate = '2019-03-01', lastDone, 0) as closing6,

if(thedate = '2019-03-04', lastDone, 0) as closing7,
if(thedate = '2019-03-05', lastDone, 0) as closing8,
if(thedate = '2019-03-06', lastDone, 0) as closing9,
if(thedate = '2019-03-07', lastDone, 0) as closing10,
if(thedate = '2019-03-08', lastDone, 0) as closing11,

if(thedate = '2019-03-11', lastDone, 0) as closing12,
if(thedate = '2019-03-12', lastDone, 0) as closing13,
if(thedate = '2019-03-13', lastDone, 0) as closing14,
if(thedate = '2019-03-14', lastDone, 0) as closing15,
if(thedate = '2019-03-15', lastDone, 0) as closing16,

if(thedate = '2019-03-18', lastDone, 0) as closing17,
if(thedate = '2019-03-19', lastDone, 0) as closing18,
if(thedate = '2019-03-20', lastDone, 0) as closing19,
if(thedate = '2019-03-21', lastDone, 0) as closing20,
if(thedate = '2019-03-22', lastDone, 0) as closing21,

if(thedate = '2019-03-25', lastDone, 0) as closing22,
if(thedate = '2019-03-26', lastDone, 0) as closing23,
if(thedate = '2019-03-27', lastDone, 0) as closing24,
if(thedate = '2019-03-28', lastDone, 0) as closing25,
if(thedate = '2019-03-29', lastDone, 0) as closing26,

if(thedate = '2019-04-01', lastDone, 0) as closing27,
if(thedate = '2019-04-02', lastDone, 0) as closing28,
if(thedate = '2019-04-03', lastDone, 0) as closing29,
if(thedate = '2019-04-04', lastDone, 0) as closing30,
if(thedate = '2019-04-05', lastDone, 0) as closing31,

if(thedate = '2019-04-08', lastDone, 0) as closing32,
if(thedate = '2019-04-09', lastDone, 0) as closing33,
if(thedate = '2019-04-10', lastDone, 0) as closing34,
if(thedate = '2019-04-11', lastDone, 0) as closing35,
if(thedate = '2019-04-12', lastDone, 0) as closing36,

if(thedate = '2019-04-15', lastDone, 0) as closing37,
if(thedate = '2019-04-16', lastDone, 0) as closing38,
if(thedate = '2019-04-17', lastDone, 0) as closing39,
if(thedate = '2019-04-18', lastDone, 0) as closing40,
if(thedate = '2019-04-19', lastDone, 0) as closing41,

if(thedate = '2019-04-22', lastDone, 0) as closing42,
if(thedate = '2019-04-23', lastDone, 0) as closing43,
if(thedate = '2019-04-24', lastDone, 0) as closing44,
if(thedate = '2019-04-25', lastDone, 0) as closing45,
if(thedate = '2019-04-26', lastDone, 0) as closing46

from (
select distinct thedate, comp_code, comp_name, lastDone from upd_klse
) as stockData
group by thedate, comp_code, comp_name
) as pStockData
group by comp_code, comp_name
