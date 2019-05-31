CREATE TABLE `upd_tweetsdata` (
  `user` varchar(50) DEFAULT NULL,
  `post_date` date DEFAULT NULL,
  `post_time` varchar(50) DEFAULT NULL,
  `post_text` text CHARACTER SET utf8mb4,
  `favorite_count` int(11) DEFAULT NULL,
  `crawl_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

