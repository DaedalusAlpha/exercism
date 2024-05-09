#!/usr/bin/env bash
[[ -t 0 ]] && echo 0 && exit 0

declare -a horizontalSides
rowCount=0
rectangles=0
while IFS= read -r line; do
    colCount=$(( ${#line} ))
    lines+=( "$line" )
    for (( i=0; i<colCount; i++ )); do
        if [[ "${line:i:1}" == '+' ]]; then
            for (( j=i+1; j<colCount; j++ )); do
                case "${line:j:1}" in
                    "+") printf -v side '%d,%d,%d' "$i" "$j" "$rowCount"
                        horizontalSides+=( "$side" ) ;;
                    "-") continue ;;
                    *) break
                esac
            done
        fi
    done
    ((rowCount++))
done

for horizontalSide in "${horizontalSides[@]}"; do
    IFS=','
    read -ra side <<< "$horizontalSide"
    leftEnd="${side[0]}"
    rightEnd="${side[1]}"
    row="${side[2]}"
    for (( i=row+1; i<rowCount; i++ )); do
        printf -v nextRow '%s%s' "${lines[i]:leftEnd:1}" "${lines[i]:rightEnd:1}"
        case "$nextRow" in
            '++') 
                printf -v bottomSide '%d,%d,%d' "$leftEnd" "$rightEnd" "$i"
                IFS=
                [[ ${horizontalSides[*]} =~ $bottomSide ]] && \
                ((rectangles++)) && continue ;;
            '|+'|'+|'|'||') continue ;;
            *) break
        esac
    done
done
  
echo "$rectangles"