#!/usr/bin/env bash

total=0
for (( i = 0; i < ${#1}; ++i )); do
    (( total+=(${1:$i:1}**${#1}) ))
done
[ $total -eq $1 ] && echo "true" || echo "false"