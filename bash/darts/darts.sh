#!/usr/bin/env bash

if ! {
[[ $# -eq 2 ]] && 
[[ $1 =~ ^-*[0-9]*\.?[0-9]+$ ]] && 
[[ $2 =~ ^-*[0-9]*\.?[0-9]+$ ]]; } ; then
    echo "Usage: $0 <x> <y>"
    exit 1
fi

value=$(bc -l <<<"sqrt(($1^2)+($2^2))")

if (( $(echo "$value <= 1" |bc -l) )); then score=10
elif (( $(echo "$value <= 5" |bc -l) )); then score=5
elif (( $(echo "$value <= 10" |bc -l) )); then score=1
else score=0
fi

echo $score

# Short version:
# [[ -z "$1" || -z "$2" || $1 =~ [[:alpha:]] || $2 =~ [[:alpha:]] ]] && echo "fail" && exit 1
# var=$(echo "sqrt($1^2+$2^2)" | bc -l )
# [[ $(echo "$var<=1" | bc) -eq 1 ]] && echo 10 || ([[ $(echo "$var<=5" | bc) -eq 1 ]] && echo 5) || ([[ $(echo "$var<=10" | bc) -eq 1 ]] && echo 1) || echo 0
