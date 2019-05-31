CREATE TABLE `compcat` (
  `compCode` varchar(20) DEFAULT NULL,
  `Category` varchar(20) DEFAULT NULL,
  `Sub_category` varchar(50) DEFAULT NULL,
  `crawl_Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

