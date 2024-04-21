#!/usr/bin/env bash

total () {
    value=0
    for i in {0..63}
    do
        value=$(bc <<< "$value+(2^($i))")
    done
    echo "$value"
}

if [ "$1" == "total" ]; then
    total
elif [ "$1" -ge 1 ] && [ "$1" -le 64 ]; then
    bc <<< "2^($1-1)"
else
    echo "Error: invalid input"
    exit 1
fi
