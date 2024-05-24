#!/usr/bin/env bash

die () {
    echo "$1"; exit 1
}

main() {
    local question="${1:0:-1}"
    [[ ! "$question" =~ ^"What is" ]] && die "unknown operation"
    question=${question/What is /}
    [[ "$question" =~ ^-?[0-9]+$ ]] && echo "$question" && exit 0
    IFS=' ' read -r -a words <<< "$(sed 's/divided by/\//g; s/plus/\+/g; s/minus/\-/g; s/multiplied by/\*/g' <<< "$question")"
    local result="${words[0]}"
    [[ ! "$result" =~ ^-?[0-9]+$ ]] && die "syntax error"
    local i
    for ((i = 1; i < ${#words[@]}; i += 2)); do
        local operator="${words[$i]}"
        local operand="${words[$((i + 1))]}"
    if [[ ! "$operator" =~ ^[+/\*-]$ ]]; then
        if [[ "$operator" =~ ^-?[0-9]+$ ]]; then die "syntax error"
        else die "unknown operation"; fi
    fi
    [[ ! "$operand" =~ ^-?[0-9]+$ ]] && die "syntax error"
    result=$(echo "$result $operator $operand" | bc)
    done
    echo "$result"
}
main "$1"