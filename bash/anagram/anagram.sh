#!/usr/bin/env bash

checkForDupes () {
    local check="$2"
    for (( i=0; i<${#1}; i++ )); do
        check="${check/${1:$i:1}/}"
    done
    echo "$check"
}

target="$1"; read -ra candidates <<<"$2"
for candidate in "${candidates[@]}"; do
    t="${target,,}" c="${candidate,,}"
    if [[ $t != "$c" && ${#t} -eq ${#c} && -z $(checkForDupes "$t" "$c") ]]; then
        output+=("$candidate")
    fi
done
echo "${output[@]}"