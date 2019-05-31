
create table Newsdata (
title text,
link text,
description text,
pubDate varchar(100),
crawl_timestamp timestamp default current_timestamp
)