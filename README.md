# WQD7005_StockCrawlerProj
This is a project for WQD7005 Data mining course. The coding is extracting stock market data from thestar.com.my website and save the data into MYSQL database.  

File description:

Util program
1. config.properties
2. UtilPropery.py

Main KLSE data
1. Stock_crawl_Directhtml.py
2. Stock_crawl_withChromeDriver.py
3. Stock_PAA_SAX.py
4. compcode.txt

Other Sources
(Tweeter)
1. TweetApiKey.py
2. TweetKLSEAPI.py
3. twitter_credentials.json

(New feeds)
1. NewsFeedAccess_crawl.py

(company background & financial)
1. StockFundamental_crawl.py
2. compcode2.txt


Mysql create table script (in folder mysql_script)
1. Create_Comcat.sql
2. Create_funcdamental.sql
3. Create_klse.sql
4. Create_newsdata.sql
5. Create_tweetdata.sql

Mysql data
1. compcat.csv 
2. upd_fundamental.csv
3. upd_klse.csv
4. upd_newsdata.csv
5. upd_tweetsdata.csv


Chrome Driver for window
1. chromedriver_win32.zip
