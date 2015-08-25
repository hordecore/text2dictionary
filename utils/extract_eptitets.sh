#!/bin/bash

find_eptitets() {
	python morph_filter.py $1 PRED 
	python morph_filter.py $1 ADJF
	python morph_filter.py $1 PRED 
}

find_eptitets $1 | sort -u
