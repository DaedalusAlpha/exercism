#!/usr/bin/env bash

colors=(black brown red orange yellow green blue violet grey white)

color () {    
    for i in {0..9}; do 
        if [[ ${colors[i]} = "$1" ]]; then 
            echo "$i"
        fi
    done
}

main () {
    if [[ ${colors[*]} =~ $1 ]] && [[ ${colors[*]} =~ $2 ]]; then
        echo "$(color "$1")$(color "$2")" | sed 's/^0*//'
    else
        echo "invalid color" && exit 1
    fi
}

main "$@"