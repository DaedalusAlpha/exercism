#!/usr/bin/env bash
set -f
phrase=$(echo "${1//-/ }" | tr -d '[:punct:]' | tr '[:lower:]' '[:upper:]')
echo $phrase | sed -e 's/$/ /' -e 's/\([^ ]\)[^ ]* /\1/g' -e 's/^ *//'