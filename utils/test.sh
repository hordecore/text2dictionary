#!/bin/bash

./text2dictionary.sh ../README.md /tmp/README.md.test
if cmp /tmp/README.md.test ../data/README.md.dict; then
	echo Test ok C:
else
	echo Failed, please fix bug and pull request me :C
fi
