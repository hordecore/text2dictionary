#!/bin/bash

echo -n "Test text2dictionary.sh: "
./text2dictionary.sh ../README.md /tmp/README.md.test
if cmp /tmp/README.md.test ../data/README.md.dict; then
	echo OK
else
	echo Failed
fi

echo -n "morph_filter: "
python ./morph_filter.py ../data/README.md.dict Qual > /tmp/README.md.test
if cmp /tmp/README.md.test ../data/README.md.Qual; then
	echo OK
else
	echo Failed
fi
