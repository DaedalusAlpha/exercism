#!/usr/bin/env bash

# rav=$(rev <<< ${1//[[:space:]]/})
rav="${1//[[:space:]]/}"

if [ "${#rav}" -ge 2 ] && [[ $rav =~ ^[0-9]+$ ]]; then
    for ((i = 1; i <= ${#rav}; i++)); do
	    digit=${rav:$((-i)):1}
        ((i % 2 == 0)) && ((digit *= 2)) && ((digit > 9)) && ((digit -= 9))
	    ((total += digit))
    done
    [ $((total % 10)) -eq 0 ] && echo "true" || echo "false"
else
    echo "false"
fi