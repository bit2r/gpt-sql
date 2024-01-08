# -*- coding: utf-8 -*-

import sys
import csv

raw = open(sys.argv[1], 'r', encoding='utf-8')
reader = csv.reader(raw);

for line in reader:
    print (line[0], line[3])

raw.close()
    

