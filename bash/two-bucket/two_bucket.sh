#!/usr/bin/env bash

startWithOne () { 
    while (( oneCurrent != target && twoCurrent != target )); do
        (( twoSpace = twoCapacity - twoCurrent ))
        (( moves++ ))
        if [[ $oneCurrent -gt 0 && $twoCurrent -lt $twoCapacity && 
            $oneCurrent -ne $twoSpace ]]; then
            while (( twoCurrent < twoCapacity && oneCurrent > 0 ))
            do ((oneCurrent-- && twoCurrent++ )); done
        elif [[ $oneCurrent -eq 0 && $twoCurrent -lt $twoCapacity ]]
            then oneCurrent=${oneCapacity}
        elif [[ $twoCurrent -eq $twoCapacity && 0 -lt $oneCurrent && 
            $oneCurrent -lt $oneCapacity ]]; then twoCurrent=0
        else echo "invalid goal"; exit 1
        fi
    done
}

startWithTwo () { 
    while (( oneCurrent != target && twoCurrent != target )); do
        (( moves++ ))
        if [[ $oneCurrent -eq $oneCapacity ]]; then oneCurrent=0
        elif [[ $twoCurrent -eq 0 ]]; then twoCurrent=${twoCapacity}
        else
            while (( oneCurrent < oneCapacity && twoCurrent > 0 ))
            do ((twoCurrent-- && oneCurrent++ )); done
        fi
    done
}

target="$3" moves=1
(( target > $1 && target > $2 )) && echo "invalid goal" && exit 1
oneCapacity="$1" oneCurrent=0
twoCapacity="$2" twoCurrent=0
case "$4" in 
    one)
        oneCurrent=${oneCapacity}
        [[ $target -eq $twoCapacity ]] && ((moves++)) && 
        twoCurrent=${twoCapacity}
        startWithOne ;;
    two) twoCurrent=${twoCapacity}
        [[ $target -eq $oneCapacity ]] && ((moves++)) && 
        oneCurrent=${oneCapacity}
        startWithTwo
esac

[[ $oneCurrent -eq $target ]] && goalBucket=one && otherBucket=$twoCurrent
[[ $twoCurrent -eq $target ]] && goalBucket=two && otherBucket=$oneCurrent
printf 'moves: %d, goalBucket: %s, otherBucket: %d\n' \
    "$moves" "$goalBucket" "$otherBucket"