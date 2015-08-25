#!/bin/bash

./text2dictionary.sh README.md README.md.test
if cmp README.md.test README.md.dict; then
	echo Test ok C:
else
	echo Failed, please fix bug and pull request me :C
fi
