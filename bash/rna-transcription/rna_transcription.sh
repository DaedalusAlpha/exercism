#!/usr/bin/env bash
[[ -z $(echo "$1" | tr -d 'GTCA') ]] && echo "$1" | sed 's/C/X/g; s/G/C/g; s/X/G/g; s/A/U/g; s/T/A/g' && exit 0 || echo "Invalid nucleotide detected." && exit 1
