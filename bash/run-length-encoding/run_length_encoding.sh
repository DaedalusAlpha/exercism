#!/usr/bin/env bash
declare output count=1

case "$1" in
    encode) 
        for (( i=0; i<${#2}; i++)); do
            currentLetter=${2:i:1}; nextLetter="${2:i+1:1}"
            if [[ $currentLetter == "$nextLetter"  ]]; then ((count++))
            elif [[ count -gt 1 ]]; then
                output+="$count$currentLetter"; count=1
            else
                output+="$currentLetter"; count=1
            fi
        done ;;
    decode)
        [ -z "$2" ] && echo "" && exit 0
        while IFS= read -r; do decoded+=("$REPLY")
        done < <(grep -Eo "[a-zA-Z ]+|[0-9]+" <<<"$2")
        IFS= ; for (( i=0; i<${#decoded[@]}; i++)); do
            currentElement="${decoded[i]}"
            if [[ ! $currentElement =~ ^[0-9]+$ ]]; then #item is letter(s)
                output+="$currentElement"
            else #item is number
                currentLetter=${decoded[i+1]:0:1}
                for (( j=0; j<(currentElement-1); j++ )); do
                    output+="$currentLetter"
                done
            fi
        done
esac

echo "$output" 