#!/usr/bin/env bash

#algorithm source: https://www.geeksforgeeks.org/pascal-triangle/
binomialCoeff() {
    local n=$1 k=$2 res=1
    if ((k > (n - k) )); then
        (( k = (n - k) )); fi
    for ((i=0;i<k;i++)); do
        (( res *= (n - i) ))
        (( res /= (i + 1) ))
    done
    echo "$res"
}

main() {
    for ((i=0;i<$1;i++)); do
        for ((j=0;j<i+1;j++)); do
            mapfile -tO "${#temp[@]}" temp < <(binomialCoeff "$i" "$j")
        done
        printf '%*s%s\n' "$(($1-i-1))" "" "${temp[*]}"
        temp=()
    done
}

declare -a temp
main "$1"