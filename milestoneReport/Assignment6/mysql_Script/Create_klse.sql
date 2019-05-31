CREATE TABLE `upd_klse` (
  `thedate` date DEFAULT NULL,
  `thetime` char(20) DEFAULT NULL,
  `comp_name` text,
  `comp_code` char(50) DEFAULT NULL,
  `stock_code` char(50) DEFAULT NULL,
  `open` double(18,8) DEFAULT NULL,
  `low` double(18,8) DEFAULT NULL,
  `high` double(18,8) DEFAULT NULL,
  `lastDone` double(18,8) DEFAULT NULL,
  `chg` double(18,8) DEFAULT NULL,
  `chgPercent` double(18,8) DEFAULT NULL,
  `vol` double(18,8) DEFAULT NULL,
  `buy` double(18,8) DEFAULT NULL,
  `buyval` double(18,8) DEFAULT NULL,
  `sell` double(18,8) DEFAULT NULL,
  `sellval` double(18,8) DEFAULT NULL,
  `crawl_Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `v_updownpercent` double(18,8) GENERATED ALWAYS AS ((((`lastDone` - `open`) / `open`) * 100)) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

