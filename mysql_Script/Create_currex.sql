CREATE TABLE `upd_currex` (
  `thedate` date DEFAULT NULL,
  `thewkday` varchar(50) DEFAULT NULL,
  `thetime` varchar(50) DEFAULT NULL,
  `curName` varchar(50) DEFAULT NULL,
  `currCode` varchar(50) DEFAULT NULL,
  `unit` int(10) DEFAULT NULL,
  `buyingVal` double(10,4) DEFAULT NULL,
  `invBuyingVal` double(10,4) DEFAULT NULL,
  `sellingVal` double(10,4) DEFAULT NULL,
  `invSellingVal` double(10,4) DEFAULT NULL,
  `middleRate` double(10,4) DEFAULT NULL,
  `invMiddleRate` double(10,4) DEFAULT NULL,
  `crawl_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

