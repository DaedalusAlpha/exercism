#!/usr/bin/env bash

count=0
for letter in {a..z}; do
    if [[ ${1,,} == *$letter* ]]; then
        ((count++))
    fi
done
[ $count -eq 26 ] && echo "true" || echo "false"