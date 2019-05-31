import requests
import mysql.connector
from xml.etree import ElementTree as ET
import time
from unidecode import unidecode
from lxml import html
from UtilProperty import ReadProperty
import pathlib

feeddataList = []

"""
The class for news Info
"""
class NewsFeedsData:
    def __init__(self, title, link, description, pubDate, pubTime):
        self.title = title
        self.link = link
        self.description = description
        self.pubDate = pubDate
        self.pubTime = pubTime

    def toString(self):
        return '"' + str(self.title) + '","'+ str(self.link) + '","'+ str(self.description) + '","'+ str(self.pubDate)+ '"\n'

"""
The class for clawler process for News Feed
"""
class NewsFeedCrawler:
    def __init__(self, starting_url, depth):
        self.starting_url = starting_url
        self.depth = depth
        self.apps = []

    def crawl(self):
        self.get_app_from_link(self.starting_url)
        return

    def reformatStr(self, inputStr):
        return unidecode(inputStr).replace('\n', '').replace('\r', '')

    def get_app_from_link(self, link):
        start_page = requests.get(link)

        root = ET.fromstring(start_page.text)
        levels = root.findall('.//item')

        for level in levels:
            title = self.reformatStr(level.find('title').text)
            link = self.reformatStr(level.find('link').text)
            description = self.reformatStr(level.find('description').text)
            pubDate = self.reformatStr(level.find('pubDate').text)
            print("====================================")
            print("1)" + title)
            print("2)" + link)

            tree = html.fromstring('<html><body>'+description+'</body></html>')
            try:
                desc = tree.xpath('/html/body/div[2]/div/div/p/text()')[0]
            except:
                desc = description
            print("3)" + desc)
            print("2a)" + pubDate)

            pubDate = pubDate.replace(" +0000", "")
            pubDate = pubDate.replace(" GMT", "")

            conv=time.strptime(pubDate,"%a, %d %b %Y %H:%M:%S")
            pubDate = time.strftime("%Y-%m-%d", conv)
            pubTime = time.strftime("%H:%M:%S", conv)

            print("4)" + time.strftime("%Y-%m-%d", conv))
            print("5)" + time.strftime("%H:%M:%S", conv))

            feeddata = NewsFeedsData(title, link, desc, pubDate, pubTime)
            feeddataList.append(feeddata)

# Db handling
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

        sql = " INSERT INTO upd_newsdata( " \
              " title, link, description, pubDate, pubTime ) " \
              " VALUES (" \
              " %s, %s, %s, %s, %s " \
              ")"

        val = (str(data.title), str(data.link), str(data.description), str(data.pubDate), str(data.pubTime))

        mycursor.execute(sql, val)
        self.mydb.commit()


links = ['https://www.theedgemarkets.com/mytopstories.rss', 'https://www.malaysiakini.com/en/news.rss']

for strlink in links:
    newsFeedCrawler = NewsFeedCrawler(strlink, 0)
    newsFeedCrawler.crawl()

# Prepare s file name as exported csv file
timeStr = time.strftime("%Y%m%d_%H%M%S", time.gmtime())
pathlib.Path('csvdata').mkdir(exist_ok=True)

newsdataFile = open('csvdata/newsdata_' + timeStr + '.csv', 'w')
newsdataFile.write("title, link, description, pubDate\n")

dbIns = DBHandling()
for fdata in feeddataList:
    print(fdata.toString())
    newsdataFile.write(fdata.toString() + '\n')
    dbIns.insertIntoDB(fdata)
