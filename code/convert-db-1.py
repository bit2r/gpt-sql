# convert-1.py
# 데이터베이스에 로드할 수 있는 CSV로 출력결과 전송

# -*- coding: utf-8 -*-

import sys
import csv

output_rows=[]

with open(sys.argv[1], 'r') as raw:
    reader = csv.reader(raw);
    for line in reader:
        key, authors = line[0], line[3]
        for auth in authors.split('; '): # 세미콜론 대신에, 세미콜론과 공백 사용
            output_rows.append([key, auth])

# 출력 파일에 대해 두 번째 인수가 필요
with open(sys.argv[2], 'w') as csvout:
    writer = csv.writer(csvout) # 두 번째 인수로 csv 파일 생성
    writer.writerow(["Key", "Author"]) # 칼럼명 헤더 생성
    writer.writerows(output_rows) # output_rows를 파일에 쓰기

print(len(output_rows)) # rows output_rows 행수를 알아야 데이터베이스에 확실하게 적재되었는지 확인 가능.


