create database MDSKLSE;
use MDSKLSE;

--drop table KLSE2;

create table KLSE2 (

thedate date,
comp_name text,
comp_code char(50),
open char(10),
low char(10),
high char(10),
lastDone char(10),
chg char(10),
chgPercent char(10),
vol char(10),
buy char(30),
sell char(30),
crawl_Timestamp timestamp
);

select * from KLSE2