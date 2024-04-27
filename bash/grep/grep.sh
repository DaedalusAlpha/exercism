#!/usr/bin/env bash

# nflag= ;lflag= ;iflag= ;vflag= ;xflag= 
while getopts nlivx: name
do
    case $name in
    n) nflag=1 ;; l) lflag=1 ;; i) iflag=1 ;; v) vflag=1 ;; x) xflag=1 ;;
    ?) echo "Usage: $0 [OPTION]... PATTERNS [FILE]..."; exit 2 ;;
    esac
done
shift

printf "Remaining arguments are: %s\n" "$*"



pattern="$2"







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
