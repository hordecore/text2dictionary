#!/bin/bash

# Получаем только кириллицу, отсекая много лишнего
egrep -o '[А-Яа-я]+' $1 | sed 's/[[:upper:]]*/\L&/' | LANG= sort -u > /tmp/dict.$$
python morph2normal.py /tmp/dict.$$ | LANG= sort -u > $1.dict
