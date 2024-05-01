#!/usr/bin/env bash

# Result format:
# Team                           | MP |  W |  D |  L |  P
# Devastating Donkeys            |  3 |  2 |  1 |  0 |  7
# Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
# Blithering Badgers             |  3 |  1 |  0 |  2 |  3
# Courageous Californians        |  3 |  0 |  1 |  2 |  1

# processRecord() {

# }

declare -A table
while read -r line; do
    # echo "$line"
    IFS=';'; read -ra record <<< "$line"
    printf -v team1 '%-30s' "${record[0]}"
    printf -v team2 '%-30s' "${record[1]}"
    if [[ ! ${!table[*]} =~ $team1 ]]; then
        table["$team1"]="0,0,0,0,0"
    fi
    if [[ ! ${!table[*]} =~ $team2 ]]; then
        table["$team2"]="0,0,0,0,0"
    fi
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
done # < "$1"

header="Team                           | MP |  W |  D |  L |  P"
echo "$header"

# Exit if no input data
if [ "${#table[@]}" -lt 2 ]; then exit 0; fi

# IFS=$'\n' table=($(sort <<<"${table[*]}"))
# unset IFS

for team in "${!table[@]}"; do
    read -r -a teamRecord <<< "${table[$team]}"
    # IFS="| "
    # echo "$team${teamRecord[*]}" | column -t -N 'Team,MP,W,D,L,P' -o '|' 
    echo "$team" "| " "${teamRecord[0]}" "| " \
    "${teamRecord[1]}" "| " "${teamRecord[2]}" "| " "${teamRecord[3]}" \
    "| " "${teamRecord[4]}"
done


