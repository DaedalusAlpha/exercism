#!/usr/bin/env bash

private_key() {
    echo 1
}

public_key() {
    local p="$1" g="$2" a="$3"
    echo $(( (g ** a) % p ))
}

main() {
    action=$1; shift
    case "$action" in
        publicKey)
            public_key "$@";;
        privateKey) 
            private_key "$@";;
        secret) ;;
        *)
    esac
}

main "$@"

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
