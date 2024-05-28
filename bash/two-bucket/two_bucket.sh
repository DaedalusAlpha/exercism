#!/usr/bin/env bash

sizeOne="$1" sizeTwo="$2"
target="$3" first="$4"

output="moves: 4, goalBucket: one, otherBucket: 5"

bucketOne[capacity]="$1"
bucketOne[current]=0
bucketTwo[capacity]="$2"
bucketTwo[current]=0

fillSmall() {
    
}