# -*- coding: utf-8 -*-
"""
Created on Thu Apr 19 14:02:16 2018

@author: ArunSK
"""
from selenium import webdriver

from upstox_api.api import *

login_id='109694'
login_pwd='#Santhosh77'
login_2fa='1986'
login_url='https://api.upstox.com/index/dialog/authorize?apiKey=QPmj921NZy5Ayuk5XcUa836klVqGU9s43s5TxmIa&redirect_uri=http://upstox.com:3000&response_type=code'

api_key='****'
api_uri='http://upstox.com:3000'
api_secret='*****'

#open_time = '091500'
##close_time = '150000'
#close_time = '235959'
#squoff_time='1519'

def openurl_func():
    driver = webdriver.Chrome()
    driver.get(login_url)
    driver.find_element_by_id("name").send_keys(login_id)
    driver.find_element_by_id("password").send_keys(login_pwd)
    driver.find_element_by_id("password2fa").send_keys(login_2fa)
    driver.find_element_by_id("password2fa").submit()
    driver.find_element_by_id("allow").submit()
    url=driver.current_url
    code=url.split("=")
    print(code[1])
    access_code = code[1]
    print("Inside Access Code :" +access_code)
    return access_code


def main():
    
    access_code = openurl_func()
    print("Outside Access Code : " + access_code)
    
    s = Session(api_key)
    s.set_redirect_uri (api_uri)
    s.set_api_secret (api_secret)
    
    s.set_code(access_code)
    access_token = s.retrieve_access_token()
    
    print ('Received access_token: %s' % access_token)
    f = open('JToken.txt','w')
    f.write(access_token)
    f.close()
    
    
if __name__ == '__main__' :
        main()
        
