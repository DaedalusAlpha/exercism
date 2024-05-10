#!/usr/bin/env bash

declare -A names plantOptions
names[Alice]=0 names[Bob]=2 names[Charlie]=4 names[David]=6
names[Eve]=8 names[Fred]=10 names[Ginny]=12 names[Harriet]=14
names[Ileana]=16 names[Joseph]=18 names[Kincaid]=20 names[Larry]=22
plantOptions[G]=grass plantOptions[C]=clover 
plantOptions[R]=radishes plantOptions[V]=violets

IFS=$'\n' read -rd '' -a rows <<<"$1"
student="$2"

for row in "${rows[@]}"; do
    tempPlants=${row:names[$student]:2}
    output+=( "${plantOptions[${tempPlants:0:1}]}" \
    "${plantOptions[${tempPlants:1:1}]}" )
done

echo "${output[@]}"