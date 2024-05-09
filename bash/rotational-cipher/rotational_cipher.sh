#!/usr/bin/env bash

plain=$(echo {a..z} | tr -d ' ')
cipher="${plain:$(($2)):25}${plain:0:$(($2))}"; ucipher="${cipher^^}"
tr 'a-zA-Z' "$cipher$ucipher" <<< "$1"