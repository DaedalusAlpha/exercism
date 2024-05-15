#!/usr/bin/env bash

IFS=$'\n' read -re -d '' -a lines
numLines=${#lines[@]}

max=-1
for line in "${lines[@]}"; do
    len="${#line}"
    ((len > max)) && max="$len"
done

for (( i=0; i<numLines; i++)); do
    lines[i]=$(printf "%-$((max))s" "${lines[i]}")
done

for (( i=0; i<max; i++ )); do
    output=''
    for (( j=0; j<numLines; j++ )); do
        output+="${lines[j]:i:1}"
    done
    printf "%s\n" "$output"
done