#!/usr/bin/env bash

number() {
    local check="$1"; shift
    local rolls=("$@")
    local total=0
    for roll in "${rolls[@]}"; do
        [[ roll -eq check ]] && ((total+=roll))
    done
    echo "$total"
}

fullHouse () {
    local roll=("$@")
    local full=0
    [[ $((roll[0])) -eq $((roll[2])) ]] && 
    [[ $((roll[3])) -eq $((roll[4])) ]] && ((full=1))
    [[ $((roll[0])) -eq $((roll[1])) ]] && 
    [[ $((roll[2])) -eq $((roll[4])) ]] && ((full=1))
    [[ $((roll[0])) -ne $((roll[3])) ]] && 
    [[ $full -eq 1 ]] && choice "${roll[@]}" || echo 0

}

fourKind () {
    local roll=("$@")
    if [[ $((roll[0])) -eq $((roll[3])) ]]; then 
        echo $(( roll[0]+roll[1]+roll[2]+roll[3] ))
    elif [[ $((roll[1])) -eq $((roll[4])) ]]; then 
        echo $(( roll[1]+roll[2]+roll[3]+roll[4] ))
    else echo 0; fi
}

littleStraight () {
    local roll=("$@")
    local little=30
    [[ $((roll[0])) -ne 1 ]] && little=0
    [[ $((roll[4])) -ne 5 ]] && little=0
    for (( i=0; i<(${#roll[@]}-1); i++)); do
        [[ $((roll[i]+1)) != $((roll[i+1])) ]] && little=0 && break
    done
    echo "$little"
}

bigStraight () {
    local roll=("$@")
    local big=30
    [[ $((roll[0])) -ne 2 ]] && big=0
    [[ $((roll[4])) -ne 6 ]] && big=0
    for (( i=0; i<(${#roll[@]}-1); i++)); do
        [[ $((roll[i]+1)) != $((roll[i+1])) ]] && big=0 && break
    done
    echo "$big"
}

choice () {
    local roll=("$@")
    local total=0
    for i in "${roll[@]}"; do ((total+=i)); done
    echo "$total"
}

yacht () {
    local roll=("$@")
    local check="${roll[0]}"
    for i in "${roll[@]}"; do
        [[ "$check" != "$i" ]] && not_yacht=true && break
    done
    [[ -z "$not_yacht" ]] && echo 50 || echo 0
}

category="$1"; shift
IFS=$'\n' dice=( $(sort <<<"$*") ); unset IFS
declare -A categories
categories["ones"]=1; categories["twos"]=2
categories["threes"]=3; categories["fours"]=4
categories["fives"]=5; categories["sixes"]=6

case "$category" in
    ones|twos|threes|fours|fives|sixes) 
        number "${categories[$category]}" "${dice[@]}" ;;
    "full house") fullHouse "${dice[@]}" ;;
    "four of a kind") fourKind "${dice[@]}" ;;
    "little straight") littleStraight "${dice[@]}" ;;
    "big straight") bigStraight "${dice[@]}" ;;
    choice) choice "${dice[@]}" ;;
    yacht) yacht "${dice[@]}"
esac