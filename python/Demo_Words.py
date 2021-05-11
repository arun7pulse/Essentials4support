# -*- coding: utf-8 -*-
"""
Created on Mon Nov  9 11:11:13 2020

@author: ARANNAMALAI
"""

def count_letters(text, sort=False):
    result ={}
    for letter in text :
        if letter not in result:
            result[letter] = 0
        result[letter]+=1
    if sort:
        return {k:v for k,v in sorted(result.items(), key=lambda item: item[1])}
    return result 

def count_words(sentence, sort=False):
    sentence = sentence.lower()
    words = sentence.split()
    result = {}
    for word in words:
        if word not in result:
            result[word] = 0
        result[word]+=1
    if sort:
        return {k:v for k,v in sorted(result.items(), key=lambda item: item[1])}
    return result 

sam= count_letters("arunsanthoshkumar annamalai")

print(sam)

same= count_words("arunsanthoshkumar annamalai", sort=True)
print(same)