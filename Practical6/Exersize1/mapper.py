#!/usr/bin/python
# -*-coding:utf-8 -*

import sys
#hostList = {}
#file = open('/web_access.csv', 'r')
reader = []
#file.readlines()
#sys.stdin
hostList = []
for line in sys.stdin:
    line = line.strip() # whitespace
    reader.append(line.split(","))
     
    
for l in reader: # ['novo.dk', '88', 'GET', 'url', '200', '56']
    host = l[1]
    bytes = l[6]
    pair = host + "\t" + bytes
    hostList.append(pair)

# Input for reducer.py
for line in hostList:
    print ('%s' % line) 
                    #  ^(novo.dk 56)^
     # (google.com 2) (google.com 3)... is the input for reducer