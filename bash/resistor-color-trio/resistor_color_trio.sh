#!/usr/bin/env bash

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

colors=(black brown red orange yellow green blue violet grey white)

color () {    
    for i in {0..9}; do 
        if [[ ${colors[i]} = "$1" ]]; then 
            echo "$i"
        fi
    done
}

main () {
    if [[ ${colors[*]} =~ $1 ]] && [[ ${colors[*]} =~ $2 ]]; then
        echo "$(color "$1")$(color "$2")" | sed 's/^0*//'
    else
        echo "invalid color" && exit 1
    fi
}

main "$@"

# giga
# Example: gigawatt
# G 	109 	billion
# mega 	M 	106 	million
# kilo
# Example: kiloliter
# k 	103 	thousand
# hecto
# Example: hectare
# h 	102 	hundred
# deka
# Example: dekameter
# da 	101 	ten
