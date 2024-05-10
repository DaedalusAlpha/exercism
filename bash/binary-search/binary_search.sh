#!/usr/bin/env bash

binarySearch() {

    local searchItem="$1"
    local left="$2"
    local right="$3"
    shift 3
    local list=( "$@" )
    # echo "$searchItem"
    # echo "$left"
    # echo "$right"
    # echo "${list[@]}"
    # exit 0
    # local length="${#list}"
    # [[ $length -eq 0 ]] && echo "-1" && exit 0
    local searchIndex=$(( ( right - left ) / 2 ))

    echo "$searchIndex"
    # exit 0

    if [[ ${list[searchIndex]} -eq searchItem ]]; then #item found
        echo "$searchIndex"; exit 0
    elif (( list[searchIndex] > searchItem )); then #item is less than middle
        echo "< $searchItem" "$left" "$searchIndex" "${list[@]}"
        # 0-3
        binarySearch "$searchItem" "$left" "$searchIndex" "${list[@]}"
    else #item is more than middle
        echo "> $searchItem" "$(( searchIndex++ ))" "$right" "${list[@]}"
        # 4-7
        binarySearch "$searchItem" "$(( searchIndex++ ))" "$right" "${list[@]}"
    fi


}

main () {
    local searchItem="$1"; shift; 
    local list=( "$@" )
    echo "$searchItem" 0 "${#list[@]}" "${list[@]}"
    binarySearch "$searchItem" 0 "${#list[@]}" "${list[@]}"
}

main "$@"