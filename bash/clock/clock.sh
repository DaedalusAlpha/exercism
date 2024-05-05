#!/usr/bin/env bash

die () {
    echo "$1"
    exit 1
}

[[ $# != 2 && $# != 4 ]] && die 'invalid arguments'
hour="$1"
minute="$2"
if [[ $# = 4 ]]; then
    operator="$3"
    xminutes="$4"
    if [[ $operator == "+" ]]; then
        (( minute+=xminutes ))
    elif [[ $operator == "-" ]]; then
        (( minute-=xminutes ))
    else die 'invalid arguments'
    fi
fi
# echo "$hour $minute"

modMin=$(( minute % 60 ))
updatedHour=$((((minute / 60) % 12 + (hour % 24)) % 24))

# echo "$modHour $divMin $modMin $updatedHour"

(( modMin < 0)) && modMin=$((60+modMin)) && ((updatedHour--))
(( updatedHour < 0 )) && updatedHour=$((24+"$updatedHour"))

printf '%02d:%02d\n' $updatedHour $modMin