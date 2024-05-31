#!/usr/bin/env bash

decimalToNewBase () {
    n=$1
    (( n == 0 )) && return
    (( x = n % $2 ))
    (( n /= $2 ))
    ((x < 0)) && ((n++))
    result=("$x" "${result[@]}")
    decimalToNewBase $((n++)) "$2"
}

display () {
    echo "$*"
    exit 0
}

die () {
    echo "$1"
    exit 1
}

inputBase=$1
outputBase=$3
read -ra number <<<"$2"
[[ $1 -lt 2 || $3 -lt 2 ]] && die "base is < 2"
[[ -z $2 ]] && display "0" # empty list
len=${#number[@]}

for ((i=0; i<len; i++)); do
    num=${number[$((len-1-i))]}
    (( num > ( inputBase - 1 ) )) && die "invalid positive digit"
    [[ $num -lt 0 ]] && die "negative digit"
    ((output += num * ( inputBase ** i)))
done

if [[ "$output" -eq 0 ]]; then echo 0 
else decimalToNewBase "$output" "$outputBase"
    display "${result[@]}"
fi
