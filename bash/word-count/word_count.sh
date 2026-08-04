#!/usr/bin/env bash

#echo "$*"

cleaned_input=$(echo "$*" | 
    sed -E "
        s/[^[:alnum:][:space:]']/ /g;        # Replace non-alphanumeric characters except apostrophes with spaces
        s/ '|' / /g;                         # Replace spaces around single quotes with spaces
        s/^'|'$//g                          # Remove single quotes at the beginning or end of the string
    " | tr -s ' ' | tr "[:upper:]" "[:lower:]")    
#        s/'([[:alnum:]]+)'/\1/g              # Remove single quotes around words

read -ra test <<< "$cleaned_input"
#echo "${test[@]}"

# Declare an associative array to count occurrences
declare -A count_map

# Iterate over the array and count occurrences
for element in "${test[@]}"; do
  ((count_map["$element"]++))
done

# Print the count of each element
for element in "${!count_map[@]}"; do
  echo "$element: ${count_map[$element]}"
done


# declare -A output
# for word in "${test[@]}"; do
#     if [[ -z ${output[$word]} ]]; then
#         output[$word]=1
#     else
#         ((output[$word]+=1))
#     fi
# done

# #IFS=" " read -r -a test <<< "$(echo "${test[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' ')"

# for out in "${!output[@]}"; do
#     printf '%s: %i\n' "$out" "${output[$out]}"
# done