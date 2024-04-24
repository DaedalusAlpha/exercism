#!/usr/bin/env bash

rollDie () {
    echo $(( RANDOM % 6 + 1 ))
}

rollDice () {
    rolls+=("$(rollDie)")
    for i in {0..2}; do
        roll=$(rollDie) && (( roll >= "${rolls[0]}" )) && rolls+=("$roll") \
        || rolls=("$roll" "${rolls[@]}")
    done
    for i in "${rolls[@]:1:3}"; do (( sum+=i )); done
    echo "$sum"
}

modify () {
    # My original version
    # mod=$(($1 - 10)) && [[ $mod -lt 0 ]] && mod=$(bc -l <<<"$mod--")
    # bc <<<"scale=0;$mod/2"

    # Better version without bc. Credit: glennj on exercism dot org
    local -i n=$1
    ((n < 10)) && ((n--))
    echo $(((n - 10) / 2))
}

main () {
    case "$1" in
        'modifier')
            modify "$2"
        ;;
        'generate')
            declare -A character=(
                [strength]=''
                [dexterity]=''
                [constitution]=''
                [intelligence]=''
                [wisdom]=''
                [charisma]=''
            )
            for ability in "${!character[@]}"; do 
                character[$ability]=$(rollDice)
                echo "$ability" "${character[$ability]}"
            done
            echo hitpoints $((10 + $(modify "${character[constitution]}")))
        ;;
    esac
}

main "$@"