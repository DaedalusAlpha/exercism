#!/usr/bin/env bash

square_of_sum=$((($2 * ($2 + 1) / 2) ** 2))
sum_of_squares=$(($2 * ($2 + 1) * (2 * $2 + 1) / 6))
difference=$((square_of_sum-sum_of_squares))

case "$1" in
    square_of_sum) echo "$square_of_sum" ;;
    sum_of_squares) echo "$sum_of_squares" ;;
    difference) echo "$difference"
esac