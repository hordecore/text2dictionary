#!/bin/bash

./text2dictionary.sh $1
./text2dictionary.sh $2
join -v 1 $1.dict $2.dict
