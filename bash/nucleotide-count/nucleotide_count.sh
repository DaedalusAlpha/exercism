#!/usr/bin/env bash

declare A=0 C=0 G=0 T=0
for ((i=0; i<${#1}; i++)); do
    case ${1:i:1} in
        "A") ((A+=1)) ;;
        "C") ((C+=1)) ;;
        "G") ((G+=1)) ;;
        "T") ((T+=1)) ;;
        *) echo "Invalid nucleotide in strand"; exit 1;;
    esac
done

for n in A C G T; do
    echo "$n: ${!n}"
done