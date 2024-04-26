#!/usr/bin/env bash

for i in $(seq 0 "$1"); do numbers+=(false); done

for i in $(seq 2 "$1"); do
    "${numbers[i]}" && continue
    output+=("$i")
    for (( j=2*i; j<=$1; j+=i )); do
        numbers[j]=true
    done
done

echo "${output[@]}"