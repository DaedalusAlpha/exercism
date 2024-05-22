#!/usr/bin/env bash

isTriangle () {
    echo "$1>0 && $2>0 && $3>0 && $1+$2>=$3 && $2+$3>=$1 && $1+$3>=$2" | bc -l
}

result="false"
triangleType=$1; shift
if [[ $(isTriangle "$@") -eq 1 ]]; then
    IFS=" " read -ra tri <<< "$(echo "$@" | \
    tr ' ' '\n' | sort -u | tr '\n' ' ')"
    case $triangleType in
        equilateral) [ ${#tri[@]} -eq 1 ] && result=true ;;
        isosceles) [ ${#tri[@]} -le 2 ] && result=true ;;
        scalene) [ ${#tri[@]} -eq 3 ] && result=true
    esac
fi

echo "$result"