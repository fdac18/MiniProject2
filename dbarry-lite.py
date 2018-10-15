import sys
import re
import pymongo
import json
import time
import requests

dbname = "fdac18mp2" #please use this database
collname = "glprj_dbarry" #please modify so you store data in your collection

client = pymongo.MongoClient()

db = client[dbname]
coll = db[collname]

# Start search on the first page. No results yet.
pgnum = 0
numfound = 0

## Read-in the keywords.
#f = open("dbarry_keywords.txt", 'r')
#lines = f.readlines()
#f.close()

#beginurl = "https://gitlab.com/search?page=" + str(pgnum) + "&scope=&search=" + word + "&snippets="
#while numfound < 50:
#	for line in lines:
#		print(line)

## Read-in the URLs from the SourceForge list.
f = open("dbarry_sflist.txt", 'r')
lines = f.readlines()
f.close()

## Store the URLs from the SourceForge List.
for line in lines:
	print(line)

## Read-in the URLs from the GitLab list.
f = open("dbarry_gllist.txt", 'r')
lines = f.readlines()
f.close()

## Store the URLs from the GitLab List.
for line in lines:
	print(line)
