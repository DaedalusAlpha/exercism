#!/usr/bin/env bash

declare -A points
points["AEIOULNSRST"]=1
points["DG"]=2
points["BCMP"]=3
points["FHVWY"]=4
points["K"]=5
points["JX"]=8
points["QZ"]=10

input=${1^^}
total=0
for (( i=0; i<${#input}; i++ )); do
    for key in "${!points[@]}"; do
        if [[ "${key}" =~ ${input:i:1} ]]; then
            ((total+=${points[${key}]}))
        fi
    done
done
echo $total