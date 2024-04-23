#!/usr/bin/env bash

IFS=,
declare -a actions=("wink" "double blink" "close your eyes" "jump")

number=$(bc<<< "obase=2; $1")

reverse=0
[[ ${#number} -eq 5 ]] && reverse=1 && number=$(rev<<< "${number:1:4}") || number=$(rev<<< "$number")

declare -a output=()
for ((i=0; i<${#number}; i++)); do
    (( ${number:$i:1} )) && output+=("${actions[i]}")
done

if (( reverse )); then
    reversed_output=()
    for ((i=${#output[@]}-1; i>=0; i--)); do
        reversed_output+=("${output[i]}")
    done
    echo "${reversed_output[*]}"
else
    echo "${output[*]}"
fi

# Good solution:
# events=(wink 'double blink' 'close your eyes' jump)

# ((reverse = $1 >> 4))

# for i in "${!events[@]}"; do
#     if (($1 >> i & 1)); then
#         # echo $i "${events[i]}"
#         ((reverse)) && result="${events[i]},$result" || result+="${events[i]},"
#     fi
# done

# echo "${result%,}"
