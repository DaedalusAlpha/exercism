#!/usr/bin/env bash

result=$( tr "abcdefghijklmnopqrstuvwxyz" "zyxwvutsrqponmlkjihgfedcba" <<< "${2,,}" | tr -d " .," )
[ "$1" == "encode" ] && fold -w5 <<< "$result"