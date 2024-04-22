#!/usr/bin/env bash

actions=("wink" "double blink" "close your eyes" "jump")
# echo ${actions[*]}

number=$(bc<<< "obase=2; $1")
echo $number

for ((i=1; i<=${#number}; i++)); do
    index=${number:$((-i)):1}
    echo "${actions[index]}"


done

