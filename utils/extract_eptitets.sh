#!/bin/bash

for grammem in PRED ADJF PRED; do
	python morph_filter.py $1 $grammem
done | sort -u
