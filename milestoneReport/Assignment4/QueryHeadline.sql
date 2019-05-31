
select * from upd_newsdata where ( title like '%gas%' ) 

select distinct post_date,post_time ,post_text  from upd_tweetsdata 
where post_text like '%gas%' 
order by post_date, post_time
