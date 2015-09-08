#coding:utf-8
import pymorphy2
import sys
import random

target_text = sys.argv[1]
source_dict = sys.argv[2]

data = open(target_text).read()
epitets = open(source_dict).readlines()
morph = pymorphy2.MorphAnalyzer()


def get_word_tag(word):
    return morph.parse(word.strip().decode('utf-8'))[0].tag


def is_epitet(tag):
    return set(['ADVB', 'ADJF', 'ADJS']) & set(str(tag).split(','))


def _morph(word, tag):
    result = morph.parse(word.decode('utf-8'))[0].inflect(tag)
    if result:
        return result.word.encode('utf-8')
    return None


def tag2list(tag):
    return str(tag).split(',')


def replace_with_lovecraft(word, tag):
    random.shuffle(epitets)
    for epitet in epitets:
        if tag2list(tag)[0] in tag2list(get_word_tag(epitet)):
            return _morph(epitet,tag)
    return word.strip()


def main():
    for word in data.split(' '):
        tag = get_word_tag(word)
        if is_epitet(tag):
            sys.stdout.write(replace_with_lovecraft(word, tag) + ' ')
            continue
        sys.stdout.write(word.strip() + ' ')

# main()

print _morph('скорейший', {'ADVB'})
