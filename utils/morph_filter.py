#!/opt/local/bin/python3.4
#coding:utf8
from __future__ import print_function
import pymorphy2, sys

morph = pymorphy2.MorphAnalyzer()

map(lambda w: print(w[0].word.encode('utf-8')),
    filter(lambda w: set(sys.argv[2:]) in w[0].tag,
    map(lambda w: morph.parse(w.strip().decode('utf-8')),
    filter(lambda s: len(s) > 1,
    map(str.strip, open(sys.argv[1]).readlines()))))
)