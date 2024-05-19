#!/usr/bin/env bash

n="$2"
for (( i=1; i<=n; i++ )); do
    (( sum_of_squares+=i**2 ))
    (( sum+=i ))
done
square_of_sum=$((sum**2))
difference=$((square_of_sum-sum_of_squares))

case "$1" in
    square_of_sum) echo "$square_of_sum" ;;
    sum_of_squares) echo "$sum_of_squares" ;;
    difference) echo "$difference"
esac