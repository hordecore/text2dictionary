#!/bin/bash

# Получаем только кириллицу, отсекая много лишнего

lowercase() {
	if [ "$(uname)" == 'Darwin' ]; then
		tr '[:upper:]' '[:lower:]'
	else
		sed 's/[[:upper:]]*/\L&/'
	fi
}

uniq4join() {
	LANG= sort -u
}

normalize() {
	python morph2normal.py /tmp/dict.$$ | uniq4join
}

cyrillic_words() {
	egrep -o '[А-Яа-я]+' $1 | lowercase | uniq4join
}

tmpfile=/tmp/dict.$$
output="${2:-$1.dict}"
cyrillic_words $1 > $tmpfile
normalize $tmpfile > $output
rm -f $tmpfile
