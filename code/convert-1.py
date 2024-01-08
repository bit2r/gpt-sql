# -*- coding: utf-8 -*-

import sys
import csv

INSERT = "insert into data values('{0}', '{1}');"

raw = open(sys.argv[1], 'r', encoding='utf-8')

reader = csv.reader(raw);

for line in reader:
  key, authors = line[0], line[3]
  for auth in authors.split('; '): # 세미콜론 대신에, 세미콜론과 공백 사용
    print(INSERT.format(key, auth))
        
raw.close()
