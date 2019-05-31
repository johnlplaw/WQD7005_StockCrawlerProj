"""
This file is for crawling the posted message by tweeter
"""

from twython import Twython
from unidecode import unidecode
from UtilProperty import ReadProperty
import json
import pandas as pd
import mysql.connector
import time
import pathlib

tweetList = []

"""
Tweet info
"""
class Tweets:

    def __init__(self, user, date, time, text, favorite_count):
        self.user = user
        self.date = date
        self.time = time
        self.text = text
        self.favorite_count = favorite_count

    def toString(self):
        return '"' + str(self.user) + '","' + str(self.date) + '","' + str(self.text) + '","' + str(self.favorite_count) + '"\n'

"""
Extracting the tweetet 
"""
class TwitterApp:

    def __init__(self):
        # Load credentials from json file
        with open("twitter_credentials.json", "r") as file:
            creds = json.load(file)

        # Instantiate an object
        self.python_tweets = Twython(creds['CONSUMER_KEY'], creds['CONSUMER_SECRET'])

    def reformatStr(self, inputStr):
        return unidecode(inputStr).replace('\n', '').replace('\r', '')

    def crawlTweets(self, tweetQuery):
        # Create our query
        query = {'q': tweetQuery,
                 'src':'typd',
                 #'result_type': 'popular',
                 # #'count': 50,
                 'lang': 'en'
                 }

        # Search tweets
        dict_ = {'user': [], 'date': [], 'text': [], 'favorite_count': []}
        for status in self.python_tweets.search(**query)['statuses']:
            dict_['user'].append(self.reformatStr(status['user']['screen_name']))
            dict_['date'].append(self.reformatStr(status['created_at']))
            dict_['text'].append(self.reformatStr(status['text']))
            dict_['favorite_count'].append(status['favorite_count'])

            thedate = self.reformatStr(status['created_at'])
            conv = time.strptime(thedate.replace(" +0000", ""),"%a %b %d %H:%M:%S %Y")
            pubDate = time.strftime("%Y-%m-%d", conv)
            pubTime = time.strftime("%H:%M:%S", conv)

            TweetsData = Tweets(
                self.reformatStr(status['user']['screen_name']),
                self.reformatStr(pubDate),
                self.reformatStr(pubTime),
                self.reformatStr(status['text']),
                status['favorite_count'])

            tweetList.append(TweetsData)

        pd.set_option('display.max_columns', None)
        pd.set_option('display.expand_frame_repr', False)
        pd.set_option('max_colwidth', -1)

        # Structure data in a pandas DataFrame for easier manipulation
        df = pd.DataFrame(dict_)

"""
Db handling 
"""
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

        sql = " INSERT INTO upd_tweetsdata " \
              " ( user, post_date, post_time, post_text, favorite_count ) VALUES (%s, %s, %s, %s, %s )"

        val = (str(data.user), str(data.date), str(data.time), str(data.text), str(data.favorite_count))

        mycursor.execute(sql, val)
        self.mydb.commit()
        


twitterApp = TwitterApp()
toQuery = ['KLSE', 'Malaysia', 'stock', 'bursa saham']
for qStr in toQuery:
    twitterApp.crawlTweets(qStr)

dbInst = DBHandling()


# Prepare s file name as exported csv file
timeStr = time.strftime("%Y%m%d_%H%M%S", time.gmtime())
pathlib.Path('csvdata').mkdir(exist_ok=True)

tweetOutputFile = open('csvdata/tweetsdata_' + timeStr + '.csv', 'w')
tweetOutputFile.write("user,post_date,post_time,post_text,favorite_count\n")

for tweetData in tweetList:
    print(tweetData.toString())
    dbInst.insertIntoDB(tweetData)
    tweetOutputFile.write(tweetData.toString())

