#!/usr/bin/env bash

first_word="$1"; word_count=$#; (( word_count == 0 )) && exit
for (( i=1; i<word_count; i++ )); do echo "For want of a $1 the $2 was lost."; shift; done
echo "And all for the want of a $first_word."
