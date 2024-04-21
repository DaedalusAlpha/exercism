#!/usr/bin/env bash

# set -f
# x=${1//[[:space:]]/}
# [ -z "$x" ] && echo "Fine. Be that way!" && exit 0
# if [ "${x: -1}" = "?" ]; then
#     if [[ "$x" = "${x^^}" ]] && [[ "$x" =~ [A-Z] ]]; then
#         echo "Calm down, I know what I'm doing!"
#         exit 0
#     fi
#     echo "Sure."
#     exit 0
# fi
# if [[ "$x" = "${x^^}" ]] && [[ "$x" =~ [A-Z] ]]; then
#     echo "Whoa, chill out!"
#     exit 0
# fi
# echo "Whatever."


main () {
    local -r message=$(echo "$1" | tr -d "[:space:]")
    if silence; then
        echo "Fine. Be that way!"
    elif yelling && question; then
        echo "Calm down, I know what I'm doing!"
    elif yelling; then
        echo "Whoa, chill out!"
    elif question; then
        echo "Sure."
    else
        echo "Whatever."
    fi
}

silence () {
    [[ -z $message ]]
}

yelling () {
    [[ $message == *[[:upper:]]* && $message != *[[:lower:]]* ]]
}

question () {
    [[ $message =~ \?$ ]]
}

main "$@"