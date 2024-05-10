#!/usr/bin/env bash

declare -a list
binarySearch() {
    local searchItem="$1" left="$2" right="$3"
    [[ left -ge right ]] && echo "-1" && exit 0
    local searchIndex=$(( ( left + right ) / 2 ))
    if [[ ${list[searchIndex]} -eq searchItem ]]; then #item found
        echo "$searchIndex"; exit 0
    elif (( list[searchIndex] > searchItem )); then #item is less than middle
        binarySearch "$searchItem" "$left" $searchIndex
    else #item is more than middle
        binarySearch "$searchItem" $(( searchIndex+=1 )) "$right"
    fi
}

main () {
    local searchItem="$1"; shift; list=( "$@" )
    binarySearch "$searchItem" 0 "${#list[@]}"
}

main "$@"