# -*- coding: utf-8 -*-

import sys
import csv

raw = open(sys.argv[1], 'r', encoding='utf-8')
reader = csv.reader(raw);

try:
    for line in reader:
      key, authors = line[0], line[3]
      for auth in authors.split(';'):
          print (key, auth)
except BrokenPipeError:
  sys.stderr.close()
          
raw.close()

