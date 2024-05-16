#!/usr/bin/env bash

IFS=$'\n' read -re -d '' -a lines
numLines=${#lines[@]}

for (( i=numLines-2; i>=0; i--)); do
    lenNext=${#lines[i+1]}
    lines[i]=$(printf "%-$((lenNext))s" "${lines[i]}")
done

for (( i=0; i<${#lines[0]}; i++ )); do
    output=''
    for (( j=0; j<numLines; j++ )); do
        output+="${lines[j]:i:1}"
    done
    printf "%s\n" "$output"
done