#!/usr/bin/env bash

die () {
    echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"; exit 1
}

validateNumber() {
    for ((i=0;i<${#1};i++)); do
        case $i in
            0|3|6) [[ ! ${1:i:1} =~ [2-9] ]] && die ;;
            *) [[ ! ${1:i:1} =~ [0-9] ]] && die
        esac
    done
    echo "$1"
}

number="${1//[!0-9]/}"
case "${#number}" in
    10) validateNumber "$number" ;;
    11) if [[ ${number:0:1} == "1" ]]; then
            validateNumber "${number:1}"; else die; fi ;;
    *) die
esac