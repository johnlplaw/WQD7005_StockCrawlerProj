drop table fundamental;

create table fundamental
(
theDate VARCHAR(50),
stock_code VARCHAR(50),
comp_code VARCHAR(100),
net_Turnover_Net_Sales VARCHAR(20),
EBITDA VARCHAR(20),
EBIT VARCHAR(20),
Net_Profit VARCHAR(20),
Intangibles VARCHAR(20),
Fixed_Assets VARCHAR(20),
Long_Term_Investment VARCHAR(20),
Stocks_Inventories VARCHAR(20),
Cash VARCHAR(20),
Current_Liabilities VARCHAR(20),
Long_Term_Debt VARCHAR(20),
Provisions VARCHAR(20),
Minorities VARCHAR(20),
Total_Shareholders_Equity VARCHAR(20),
Operating_Margin VARCHAR(20),
Return_on_Equity_Capital VARCHAR(20),
Net_Profit_Margin VARCHAR(20),
Current_Ratio VARCHAR(20),
Debt_to_Capital_at_Book VARCHAR(20),
crawl_Timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

select * from fundamental



