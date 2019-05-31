drop table tweetsData


create table tweetsData (

  user varchar(50),
  post_date varchar(50),
  post_text text CHARACTER SET utf8mb4,
  favorite_count varchar(10),
  crawl_timestamp timestamp default current_timestamp
)

select * from tweetsData
