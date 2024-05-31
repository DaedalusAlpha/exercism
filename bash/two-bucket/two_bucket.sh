#!/usr/bin/env bash

die () {
    echo "invalid goal"; exit 1
}


fillOne() {
    oneCurrent=${oneCapacity}
    ((moves++))
    display "$FUNCNAME"
}

fillTwo() {
    twoCurrent=${twoCapacity}
    ((moves++))
    display "$FUNCNAME"
}

emptyOne() {
    oneCurrent=0
    ((moves++))
    display "$FUNCNAME"
}

emptyTwo() {
    twoCurrent=0
    ((moves++))
    display "$FUNCNAME"
}
fillOneFromTwo() { 
    while (( oneCurrent < oneCapacity && twoCurrent > 0 ))
    do ((twoCurrent-- && oneCurrent++ )); done
    ((moves++))
    display "$FUNCNAME"
}

fillTwoFromOne() { 
    while (( twoCurrent < twoCapacity && oneCurrent > 0 ))
    do ((oneCurrent-- && twoCurrent++ )); done
    ((moves++))
    display "$FUNCNAME"
}

display () { 
echo "$1"
echo "One - Current: ${oneCurrent}, Capacity: ${oneCapacity}"
echo "Two - Current: ${twoCurrent}, Capacity: ${twoCapacity}"
}

# if [ goalBucket=="one" ]

target="$3"
# Goal larger than both buckets is impossible
(( target > $1 && target > $2 )) && die
oneCapacity="$1"
oneCurrent=0
twoCapacity="$2"
twoCurrent=0
moves=0
goalBucket=""
otherBucket=0
case "$4" in one) fillOne ;; two) fillTwo; esac

while (( oneCurrent != target && twoCurrent != target )); do
    if [[ $4 == "one" ]]; then
        (( oneCurrent = oneCapacity && twoCurrent < twoCapacity && oneCurrent != (twoCapacity - twoCurrent) )) && fillTwoFromOne && continue
        (( oneCurrent = 0 && twoCurrent < twoCapacity )) && fillOne && continue
        (( twoCurrent = twoCapacity && 0 < oneCurrent < oneCapacity )) && emptyTwo && continue
    fi
    # [[ $twoCapacity -eq $twoCurrent && $oneCurrent -lt $oneCapacity ]] && fillOneFromTwo

    
    # echo 1
done

(( oneCurrent = target )) && goalBucket=one && otherBucket=$twoCurrent
(( twoCurrent = target )) && goalBucket=two && otherBucket=$oneCurrent

printf 'moves: %d, goalBucket: %s, otherBucket: %d\n' "$moves" "$goalBucket" "$otherBucket"

# fillTwoFromOne
# fillOne
# fillTwoFromOne
# emptyTwo
# fillTwoFromOne
# fillOne
# fillTwoFromOne
# echo "$moves"