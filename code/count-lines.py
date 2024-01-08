import sys

filename = sys.argv[1]
reader = open(filename, 'r', encoding='UTF8')
count = 0
for line in reader:
    count += 1
reader.close()

print(count)
