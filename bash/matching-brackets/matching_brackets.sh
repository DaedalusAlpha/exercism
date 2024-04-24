#!/usr/bin/env bash

open () {
    (( counter[$1]++ )); last+=("$2")
}

close () {
    if (( (counter[$1] > 0) && (${#last} > 0 ) )); then
        if [ "${last[-1]}" == "$2" ]; then
            (( counter[$1]-- ))
            unset 'last[-1]'
        else
            succeed='false'
        fi
    else succeed='false'
    fi
}

main () {
    text=$1 succeed='true'
    declare -a last
    declare -A counter=([brack]='0' [brace]='0' [paren]='0')
    for ((i = 0 ; i<${#text} ; i++)); do
        case "${text[@]:i:1}" in
            "[") open 'brack' '[' ;;
            "{") open 'brace' '{' ;;
            "(") open 'paren' '(' ;;
            "]") close 'brack' '[' ;;
            "}") close 'brace' '{' ;;
            ")") close 'paren' '(' ;;
        esac
    done
    total=0
    for i in "${counter[@]}"; do
        (( total+=i ))
    done
    (( total > 0 )) && succeed='false'

    echo $succeed
}

main "$@"