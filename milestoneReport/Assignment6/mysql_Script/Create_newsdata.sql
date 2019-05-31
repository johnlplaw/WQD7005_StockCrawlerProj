CREATE TABLE `upd_newsdata` (
  `title` text,
  `link` text,
  `description` text,
  `pubDate` date DEFAULT NULL,
  `pubTime` varchar(100) DEFAULT NULL,
  `crawl_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

