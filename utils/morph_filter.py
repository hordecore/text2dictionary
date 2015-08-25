#coding:utf8
from __future__ import print_function
import pymorphy2, sys

morph = pymorphy2.MorphAnalyzer()
map(lambda w: print(w.word.encode('utf-8')),
    filter(lambda w: set(sys.argv[2:]) in w.tag,
    map(lambda w: morph.parse(w.strip().decode('utf-8'))[0],
    map(str.strip, open(sys.argv[1]).readlines())))
)
