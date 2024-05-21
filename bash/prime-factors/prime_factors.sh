#!/usr/bin/env bash

factor () {
    for ((i=2; i<=$1; i++)); do
        ! (($1%i)) && factors+=("$i") && factor $(($1/i)) && break
    done
}

factor "$1"
echo "${factors[@]}"