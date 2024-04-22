#!/usr/bin/env bash

if (($# != 1 )) || ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Usage: $0 <year>"
    exit 1
elif [[ $(($1 % 400)) == 0 || $(($1 % 4)) == 0 && $(($1 % 100)) != 0 ]]; then
    echo "true"
else
    echo "false"
fi
