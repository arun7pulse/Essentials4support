# -*- coding: utf-8 -*-
"""
Created on Mon May 28 19:16:25 2018

@author: Arun SK
"""

import shutil
import os 

print("Current Directory : \n" + str(os.getcwd()))
os.chdir("f:\\")

print("\n List of Files Before the Copy: \n " + str(os.listdir()))


shutil.copyfile('test.txt', 'file.txt')
print("\n List of Files after the Copy :\n " + str(os.listdir()))
