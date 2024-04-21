#!/usr/bin/env bash

# result=""
# if ! (($1 % 3)); then result+="Pling"; fi
# if ! (($1 % 5)); then result+="Plang"; fi
# if ! (($1 % 7)); then result+="Plong"; fi
# [ -z "$result" ] && echo "$1" || echo $result

(( $1 % 3 )) || result+=Pling
(( $1 % 5 )) || result+=Plang
(( $1 % 7 )) || result+=Plong
echo ${result:-$1}