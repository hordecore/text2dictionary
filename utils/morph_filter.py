import pymorphy2, sys

morph = pymorphy2.MorphAnalyzer()

with open(sys.argv[1]) as f:
    for line in f.readlines():
        print morph.parse(line.strip().decode('utf-8'))[0][2].encode('utf-8')
