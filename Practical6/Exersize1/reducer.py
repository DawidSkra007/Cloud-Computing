#!/usr/bin/python
# -*-coding:utf-8 -*

import sys
import collections

byteCount = collections.Counter()
#byteCount = {}
#file = open('out1.txt', 'r')
#sys.stdin
for line in sys.stdin:
    line = line.strip()
    host, byte = line.split('\t', 1)
    # ensure that it's a string followed by an int
    try:
        host = str(host)
        byte = int(byte)
    except ValueError:
        # ignores first line of the file first line: {host bytes}
        continue
    if byteCount.get(host) is not None:
        byteCount[host] += byte # add the byte to the existing bytecount of the host
    else:
        byteCount[host] = byte # no host in byteCount

for host, byte in byteCount.most_common(5):
    print ("{}\t{}".format(host, byte))
print ("\n")
