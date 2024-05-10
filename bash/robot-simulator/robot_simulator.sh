#!/usr/bin/env bash

die () {
    echo "$1"; exit 1
}

declare -A directions
directions[north]="0,1"  directions[east]="1,0"
directions[south]="0,-1" directions[west]="-1,0"
x="${1:-0}" y="${2:-0}" dir="${3:-north}" command="${4:-}"
[[ ! ${!directions[*]} =~ $dir ]] && die "invalid direction"

for (( i=0; i<${#command}; i++)); do
    case "${command:i:1}" in
        R)  case "$dir" in
                north) dir=east ;; east) dir=south ;;
                south) dir=west ;; west) dir=north
            esac ;;
        L)  case "$dir" in
                north) dir=west ;; east) dir=north ;;
                south) dir=east ;; west) dir=south
            esac ;;
        A)  IFS=',' read -ra coords <<<"${directions[$dir]}"
            ((x+=coords[0]))
            ((y+=coords[1]))
        ;;
        *) die "invalid instruction"
    esac
done

echo "$x $y $dir"