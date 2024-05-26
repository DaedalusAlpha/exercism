#!/usr/bin/env bash

alphabet=( {A..Z} ) word="${1,,}"
for letter in "${alphabet[@],,}"; do count=0
    for ((i=0;i<${#word};i++)); do
        [[ $letter == "${word:i:1}" ]] && (( count++ ))
        [[ count -gt 1 ]] && echo "false" && exit 0
    done
done
echo "true"