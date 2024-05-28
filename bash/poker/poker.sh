#!/usr/bin/env bash
ranks=( 2 3 4 5 6 7 8 9 10 J Q K A )
suits=( H D S C )
for s in "${suits[@]}"; do for r in "${ranks[@]}"; do deck+=( "$r$s" ); done; done
echo "${deck[@]}"

read -ra hand <<<"$1"
# printf -v sorted '%s\n' "${hand[@]}" # | sort -n

for card in "${hand[@]}"; do
    printf '%s %s\n' "${card:0:(-1)}" "${card:(-1):1}"
done

# IFS=$'\n' sorted=( $(sort -n <<<"${hand[*]}") ); unset IFS
# echo "${sorted[@]}"

flush () {
    local temp flushes=( HHHHH DDDDD SSSSS CCCCC )
    for arg; do temp+="${arg:(-1):1}"; done
    if [[ "${flushes[*]}" =~ $temp ]]; then echo 1; else echo 0; fi
}

sets() {
    for arg; do temp+=( "${arg:0:(-1)}"); done
    echo "${temp[@]}"
}

# flush "${hand[@]}"
sets "${hand[@]}"

















# The following comments should help you get started:
# - Bash is flexible. You may use functions or write a "raw" script.
#
# - Complex code can be made easier to read by breaking it up
#   into functions, however this is sometimes overkill in bash.
#
# - You can find links about good style and other resources
#   for Bash in './README.md'. It came with this exercise.
#
#   Example:
#   # other functions here
#   # ...
#   # ...
#
#   main () {
#     # your main function code here
#   }
#
#   # call main with all of the positional arguments
#   main "$@"
#
# *** PLEASE REMOVE THESE COMMENTS BEFORE SUBMITTING YOUR SOLUTION ***
