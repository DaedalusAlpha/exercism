#!/usr/bin/env bash

die () {
  echo "$1"; exit 1
}

[[ -t 0 ]] && exit 0
while IFS= read -r line; do
  if (( ${#line} % 3 != 0)); then
    die "Number of input columns is not a multiple of three"
  else
    index=0
    for ((j=0; j<${#line}; j+=3)); do
        number[index]+="${line:j:3}"
        ((index++))
      done
    ((lineCount+=1))
  fi
done

((lineCount % 4 != 0)) && \
  die "Number of input lines is not a multiple of four"

declare -a output
for ((i=0; i<(lineCount / 4); i++)); do
  for ((j=0; j<${#number[@]}; j++)); do
    output[i]+=$( case "${number[j]:$((i*12)):12}" in
        " _ | ||_|   ") echo 0 ;; "     |  |   ") echo 1 ;;
        " _  _||_    ") echo 2 ;; " _  _| _|   ") echo 3 ;;
        "   |_|  |   ") echo 4 ;; " _ |_  _|   ") echo 5 ;;
        " _ |_ |_|   ") echo 6 ;; " _   |  |   ") echo 7 ;;
        " _ |_||_|   ") echo 8 ;; " _ |_| _|   ") echo 9 ;;
        *) echo '?'
    esac )
  done
done

echo "${output[@]}" | tr ' ' ,