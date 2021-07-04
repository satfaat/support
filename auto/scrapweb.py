from bs4 import BeautifulSoup
from urllib.request import urlopen


url = "Enter the full URL of the target webpage here"
targetPage = urlopen(url)
htmlReader = targetPage.read().decode("utf-8")
webData = BeautifulSoup(htmlReader, "html.parser")
print(webData.get_text())


# ===

import tweepy
import re

myAuth = tweepy.OAuthHandler(paste consumer_key here, paste consumer_secret key here)
auth.set_access_token(paste access_token here, paste access_token_secret here)
authenticate = tweepy.API(myAuth)
target_tweet = api.home_timeline()
for targets in target_tweet:
    print(targets.text)