#!/usr/bin/env bash

declare -A table
while read -r line; do
    if [ -z "$line" ]; then break; fi
    IFS=';'; read -ra record <<< "$line"
    team1="${record[0]}"
    team2="${record[1]}"
    [[ ! ${!table[*]} =~ $team1 ]] && table["$team1"]="0,0,0,0,0"
    [[ ! ${!table[*]} =~ $team2 ]] && table["$team2"]="0,0,0,0,0"
    IFS=','; 
    read -r -a team1Record <<< "${table[$team1]}"
    read -r -a team2Record <<< "${table[$team2]}"
    (( team1Record[0]+=1 ))
    (( team2Record[0]+=1 ))
    case "${record[2]}" in
        win)
            (( team1Record[1]+=1 ))
            (( team1Record[4]+=3 ))
            (( team2Record[3]+=1 ))
        ;;
        loss)
            (( team2Record[1]+=1 ))
            (( team2Record[4]+=3 ))
            (( team1Record[3]+=1 ))
        ;;
        draw) 
            (( team1Record[2]+=1 ))
            (( team1Record[4]+=1 ))
            (( team2Record[2]+=1 ))
            (( team2Record[4]+=1 ))
        ;;
    esac
    table["$team1"]="${team1Record[*]}"
    table["$team2"]="${team2Record[*]}"

done < "${1:-/dev/stdin}"

echo "Team                           | MP |  W |  D |  L |  P"
if [ "${#table[@]}" -lt 2 ]; then exit 0; fi

for team in "${!table[@]}"; do
    read -r -a teamRecord <<< "${table[$team]}"
    printf '%-31s|%3i |%3i |%3i |%3i |%3i\n' "$team" "${teamRecord[0]}" \
    "${teamRecord[1]}" "${teamRecord[2]}" "${teamRecord[3]}" "${teamRecord[4]}"
done | sort -t "|" -k6nr -k1