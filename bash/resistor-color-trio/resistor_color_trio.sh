#!/usr/bin/env bash

colors=(black brown red orange yellow green blue violet grey white)
color () {    
    for i in {0..9}; do [[ ${colors[i]} = "$1" ]] && echo "$i"; done
}

main () {
    if [[ ${colors[*]} =~ $1 && ${colors[*]} =~ $2 && ${colors[*]} =~ $3 ]]; then
        val=$(( (10 * $(color "$1") ) + $(color "$2") ))
        exp=$(( val * (10 ** $(color "$3") ) ))
        if [ $val -eq 0 ]; then echo $exp ohms
        elif [ $((exp % (10 ** 9))) -eq 0 ]; then echo "${exp::-9}" gigaohms
        elif [ $((exp % (10 ** 6))) -eq 0 ]; then echo "${exp::-6}" megaohms
        elif [ $((exp % (10 ** 3))) -eq 0 ]; then echo "${exp::-3}" kiloohms
        else echo $exp ohms
        fi
    else
        echo "invalid color" && exit 1
    fi
}

main "$@"