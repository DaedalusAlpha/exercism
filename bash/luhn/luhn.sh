#!/usr/bin/env bash

number="${1//[[:space:]]/}"

if [ "${#number}" -ge 2 ] && [[ $number =~ ^[0-9]+$ ]]; then
    for ((i = 1; i <= ${#number}; i++)); do
	    digit=${number:$((-i)):1}
        ((i % 2 == 0)) && ((digit *= 2)) && ((digit > 9)) && ((digit -= 9))
        ((total += digit))
    done
    [ $((total % 10)) -eq 0 ] && echo "true" || echo "false"
else
    echo "false"
fi