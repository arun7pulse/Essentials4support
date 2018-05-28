# -*- coding: utf-8 -*-
"""
Created on Tue May 22 16:36:13 2018

@author: ArunSK
"""

import tweepy
import datetime


consumer_key = '******'
consumer_secret = '*****' 
access_token = '*****'
access_token_secret = '******'
    
def get_api():
  auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
  auth.set_access_token(access_token, access_token_secret)
  return tweepy.API(auth)

def main():
  api = get_api()
  print(str(api))
  
  t=datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
  tweet = "Hello, world! From @SanTech {}".format(t)
  status = api.update_status(status=tweet) 

if __name__ == "__main__":
  main()
