#!/usr/bin/env bash

check=$(echo "$1" | tr -d 0-9X-)
ISBN=$(echo "$1" | tr -dc 0-9X)
result=false

if [[ ${#check} -eq 0 ]]; then
    if [ ${#ISBN} -eq 10 ]; then
        if [[ "${ISBN:0:9}" =~ [0-9] ]]; then
            if [[ "${ISBN:9:1}" =~ [0-9]|X ]]; then
                case "${ISBN:9:1}" in
                    X)total=10 ;;
                    *)total="${ISBN:9:1}"
                esac
                multiple=10
                for ((i=0;i<${#ISBN}-1;i++)); do
                    ((total+="${ISBN:i:1}"*multiple))
                    ((multiple--))
                done
                if (( total % 11 == 0 )); then
                    result=true
                fi
            fi
        fi
    fi
fi
echo "$result"