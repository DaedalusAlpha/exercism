#!/usr/bin/env bash

encode() {
    local rails=$1 phrase="$2"
    local i=0 goingUp=1
    for ((j=0; j < ${#phrase}; j++)) do
        encoded[i]+=${phrase:j:1}
        if [[ $goingUp -eq 1 ]]; then
            ((i++))
            if (( i == (rails - 1))); then
                goingUp=0
            fi
        else 
            ((i--))
            if (( i == 0 )); then
                goingUp=1
            fi
        fi
    done
}

decode() {
    local rails=$1 phrase="$2" output
    local i=0 goingUp=1

    encode "$rails" "$phrase"

    for ((k=0;k<${#encoded[@]};k++)); do
        decoded[k]=${phrase:0:${#encoded[k]}}
        phrase=${phrase:${#encoded[k]}}
    done

    while [[ ${#output} -lt ${#2} ]]; do
        output+=${decoded[i]:0:1}
        decoded[i]="${decoded[i]:1}"

        if [[ $goingUp -eq 1 ]]; then
            ((i++))
            if (( i == (rails - 1))); then goingUp=0; fi
        else 
            ((i--))
            if (( i == 0 )); then goingUp=1; fi
        fi
    done
    echo "$output"
}

if [ $# -eq 0 ]; then
    >&2 echo "No arguments provided"
    exit 1
fi

if [ "$2" -lt 1 ]; then
    >&2 echo "There must be one or more rails"
    exit 1
fi

declare -a encoded decoded

case "$1" in
    -e) encode "$2" "$3"
        printf %s "${encoded[@]}" $'\n'
        ;;
    -d) decode "$2" "$3" ;;
    *) >&2 echo "Option must be -d or -e"
    exit 1
esac