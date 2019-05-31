from lxml import html
import requests
import mysql.connector
import time
from UtilProperty import ReadProperty
import pathlib

klseData = [];
totalComp = 0;

#KLSE Data class
class KLSEData:
    #Constructor
    def __init__(self,
                 date, time, compname, compCode, stockCode, openTxt,
                 lowTxt, highTxt, lastDoneTxt, chgTxt, chgPercentTxt,
                 volTxt, buyTxt, buyTxtVal, sellTxt, sellTxtVal):
        self.date = date
        self.time = time
        self.compname = compname
        self.compCode = compCode
        self.stockCode = stockCode
        self.openTxt = openTxt
        self.lowTxt = lowTxt
        self.highTxt = highTxt
        self.lastDoneTxt = lastDoneTxt
        self.chgTxt = chgTxt
        self.chgPercentTxt = chgPercentTxt
        self.volTxt = volTxt
        self.buyTxt = buyTxt
        self.buyTxtVal = buyTxtVal
        self.sellTxt = sellTxt
        self.sellTxtVal = sellTxtVal

    # To return entire info of the class
    def toString(self):
        return '"' + self.date + '","' + self.time + '","' + self.compname + '","' + self.compCode + '","' + self.stockCode + '","' + self.openTxt + '","' \
               + self.lowTxt + '","' + self.highTxt + '","' + self.lastDoneTxt + '","' + self.chgTxt + '","' + self.chgPercentTxt + '","' + self.volTxt + '","' \
               + self.buyTxt + '","' + self.buyTxtVal + '","' + self.sellTxt + '","' + self.sellTxtVal + '"\n'

# Handling the DB transaction
class DBHandling:

    def __init__(self):
        readProperty = ReadProperty()
        dicMySql = readProperty.getPropertiesDic('MySQL')
        self.mydb = mysql.connector.connect(
            host=dicMySql['host'],
            user=dicMySql['user'],
            passwd=dicMySql['passwd'],
            database=dicMySql['database']
        )

    def insertIntoDB(self, data):
        mycursor = self.mydb.cursor()

        sql = "INSERT INTO upd_klse( " \
              "thedate, thetime, " \
              "comp_name, comp_code, stock_code, open, low, high, " \
              "lastDone, chg, chgPercent, vol, buy, " \
              "buyval, sell, sellval, crawl_Timestamp) VALUES ( " \
              " %s, %s, " \
                "%s, %s, %s, %s, %s, %s, " \
                "%s, %s, %s, %s, %s, " \
                "%s, %s, %s, SYSDATE())"

        val = (str(data.date), str(data.time), str(data.compname),
               str(data.compCode), str(data.stockCode), str(data.openTxt), str(data.lowTxt), str(data.highTxt), str(data.lastDoneTxt),
               str(data.chgTxt), str(data.chgPercentTxt), str(data.volTxt), str(data.buyTxt), str(data.buyTxtVal),
               str(data.sellTxt), str(data.sellTxtVal) )

        mycursor.execute(sql, val)
        self.mydb.commit()

    def checkDBCount(self):
        mycursor = self.mydb.cursor()

        sql = "select count(1) from klse3"
        countrow = mycursor.execute(sql)

        print("number of rows: ", mycursor.fetchone())


# KlSE Crawler main class
class KLSECrawler:
    def __init__(self, starting_url, param, depth):
        self.starting_url = starting_url
        self.depth = depth
        self.param = param
        self.apps = []

    def crawl(self):
        self.get_app_from_link(self.starting_url, self.param )
        return

    def resetNA(self, text):
        if text == '-':
            return '0.0'
        else :
            return text
    def removeComma(self, text):
        return text.replace(",","")

    def get_app_from_link(self, link, param):

        print(link+param)
        start_page = requests.get(link+param)
        tree = html.fromstring(start_page.text)

        datestr = tree.xpath('//*[@id="slcontent_0_ileft_0_datetxt"]/text()')[0]
        timestr = tree.xpath('//*[@id="slcontent_0_ileft_0_timetxt"]/text()')[0]

        datetimestr = datestr[10:-2] + ' ' + timestr
        conv = time.strptime(datetimestr,"%d %b %Y %I:%M %p")
        pubDate = time.strftime("%Y-%m-%d", conv)
        pubTime = time.strftime("%H:%M:%S", conv)
        newDate = time.strftime("%Y-%m-%d", conv)
        newTime = time.strftime("%H:%M:%S", conv)

        compname = tree.xpath('//*[@id="slcontent_0_ileft_0_compnametxt"]/text()')[0]
        stockCode = tree.xpath('//*[@id="slcontent_0_ileft_0_info"]/ul/div[1]/li[2]/text()')[0]
        stockCode = stockCode[3:]

        openTxt = tree.xpath('//*[@id="slcontent_0_ileft_0_opentext"]/text()')[0]
        openTxt = self.resetNA(openTxt)

        lowTxt = tree.xpath('//*[@id="slcontent_0_ileft_0_lowtext"]/text()')[0]
        lowTxt = self.resetNA(lowTxt)

        highTxt = tree.xpath('//*[@id="slcontent_0_ileft_0_hightext"]/text()')[0]
        highTxt = self.resetNA(highTxt)

        lastDoneTxt = tree.xpath('//*[@id="slcontent_0_ileft_0_lastdonetext"]/text()')[0]

        tmpChgTxt = tree.xpath('//*[@id="slcontent_0_ileft_0_chgtext"]/text()')
        if len(tmpChgTxt) == 0 :
            tmpChgTxt = tree.xpath('//*[@id="slcontent_0_ileft_0_chgtext"]/span/text()')

        chgTxt = tmpChgTxt[0]

        chgPercentTxt = tree.xpath('//*[@id="slcontent_0_ileft_0_chgpercenttrext"]/text()')[0]
        volTxt = tree.xpath('//*[@id="slcontent_0_ileft_0_voltext"]/text()')[0]
        buyTxtstr = tree.xpath('//*[@id="slcontent_0_ileft_0_buyvol"]/text()')[0]
        buyTxt = buyTxtstr.split(' / ')

        sellTxtstr = tree.xpath('//*[@id="slcontent_0_ileft_0_sellvol"]/text()')[0]
        sellTxt = sellTxtstr.split(' / ')

        klseData.append(KLSEData(newDate, newTime, compname, param, stockCode,
                                 self.removeComma(openTxt),
                                 self.removeComma(lowTxt),
                                 self.removeComma(highTxt),
                                 self.removeComma(lastDoneTxt),
                                 self.removeComma(chgTxt),
                                 chgPercentTxt,
                                 self.removeComma(volTxt),
                                 self.removeComma(buyTxt[0]),
                                 self.removeComma(buyTxt[1]),
                                 self.removeComma(sellTxt[0]),
                                 self.removeComma(sellTxt[1])))

        return


# Main process start here:
with open('compcode.txt') as f:
    alist = [line.rstrip() for line in f]

# Crawl the data
totalComp = len(alist)
for x in alist:

    if len(x) == 0:
        continue

    x = x.rstrip('\n')
    x = str.replace(x, '&', '%26')
    url = "https://www.thestar.com.my/business/marketwatch/stocks/?qcounter="
    print(x)
    try:
        crawler = KLSECrawler(url, x, 0)
        crawler.crawl()
        del crawler
    except:
        print("Fail to process: " + x)

# Prepare s file name as exported csv file
timeStr = time.strftime("%Y%m%d_%H%M%S", time.gmtime())
pathlib.Path('csvdata').mkdir(exist_ok=True)

klseOutputFile = open('csvdata/klsedata2_' + timeStr + '.csv', 'w')
klseOutputFile.write("thedate,time,comp_name,comp_code,stock_code,open,low,high,lastDone,chg,chgPercent,vol,buy,buyval,sell,sellval\n")

# After the klse data has been extracted, the process:
# 1. generate the csv file
for data in klseData:
    #print(data.toString())
    klseOutputFile.write(data.toString())
    print(data.toString())

# 2. insert into database
for data in klseData:
    #print(data.toString())
    try:
        dbIns = DBHandling()
        dbIns.insertIntoDB(data)
    except:
        print("Fail to insert: " + data)
        continue


print("Done process")
qstr = DBHandling()
qstr.checkDBCount()

# tmp code
