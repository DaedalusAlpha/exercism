#!/usr/bin/env bash
readonly verb=("lay in" ate killed worried tossed milked kissed married woke \
kept "belonged to")
readonly object=("house that Jack built." malt rat cat dog "cow with the \
crumpled horn" "maiden all forlorn" "man all tattered and torn" "priest \
all shaven and shorn" "rooster that crowed in the morn" "farmer sowing \
his corn" "horse and the hound and the horn")


printPoem () {
    local i="$1"
    while (( i >= 0 )); do
        if [[ i -eq $1 ]]; then
            printf 'This is the %s\n' "${object[i]}"
        else
            printf 'that %s the %s\n' "${verb[i]}" "${object[i]}"
        fi
        ((i--))
    done
}

main () {
    (( $1 < 1 || $1 > 12 || $2 < 1 || $2 > 12 )) && echo invalid && exit 1
    for (( j=$1; j<=$2; j++)); do
        printPoem $(( "$j" - 1 ))
        echo
    done
    # exit 0
}

main "$@"