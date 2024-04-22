# #!/usr/bin/env bash

# # The following comments should help you get started:
# # - Bash is flexible. You may use functions or write a "raw" script.

# alpha="abcdefghijklmnopqrstuvwxyz"
# input=$(echo "${2,,}" | tr -d "[:space:]")

# #iterate through input
# for (( i=0; i<${#input}; i++ )); do
#     char="${input:i:1}"
#     #check for numbers
#     if [[ "$char" = [0-9] ]]; then
#         output+=$char
#     fi
#     #iterate through alphabet
#     for j in {0..25}; do
#         letter="${alpha:j:1}"
#         #if letter matches, append reverse letter to output
#         if [ "$letter" = "$char" ]; then
#             output+="${alpha:((25-j)):1}"
#         fi
#     done
# done
# #add spaces every 5 characters if encoding
# [ "$1" == "encode" ] && sed 's/.\{5\}/& /g;s/ $//' <<< "$output" || echo "$output"

#!/usr/bin/env bash

main () {
    result=$( tr "abcdefghijklmnopqrstuvwxyz" "zyxwvutsrqponmlkjihgfedcba" <<< ${2,,} | tr -d " .," )
    [ "$1" == "encode" ] && result=$(fold -w5 <<< $result)
    echo $result
}

main "$@"