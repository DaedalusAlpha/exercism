#!/usr/bin/env bash

score() {
    local result=0
    for i in {0..9}; do
        (( result+=frames[i] ))
    done
    echo "$result"
}
pinCountExceeds() {
    echo "Pin count exceeds pins on the lane"; exit 1
}
negativeRoll() {
    echo "Negative roll is invalid"; exit 1
}
earlyScore() {
    echo "Score cannot be taken until the end of the game"; exit 1
}
gameOver() {
    echo "Cannot roll after game is over"; exit 1
}

declare -a frames=(0 0 0 0 0 0 0 0 0 0)
rolls=( "$@" )
frame=0
gameComplete=false

for ((i = 0 ; i < ${#rolls[@]} ; i++)); do
    roll0="${rolls[i]}"
    [[ roll0 -lt 0 ]] && negativeRoll
    [[ roll0 -gt 10 ]] && pinCountExceeds
    if (( (i + 1) < ${#rolls[@]} )); then #NEXT ROLL
        roll1="${rolls[$((i+1))]}"
    else roll1=X; fi
    if (( (i + 2) < ${#rolls[@]} )); then #ROLL AFTER NEXT
        roll2="${rolls[$((i+2))]}"
    else roll2=X; fi
    [[ roll1 -gt 10 ]] && pinCountExceeds
    [[ roll2 -gt 10 ]] && pinCountExceeds
    
    if [[ $roll0 -eq 10 ]]; then # STRIKE
        [[ $roll1 = "X" || $roll2 = "X" ]] && earlyScore
        (( frames[frame]+=roll0 + roll1 + roll2 ))
        if [[ frame -eq 9 ]]; then
            (( roll1 < 10 && (roll1+roll2) > 10 )) && pinCountExceeds
            [[ $((i+3)) -lt ${#rolls[@]} ]] && gameOver
            gameComplete=true
            break
        else ((frame++))
        fi
    elif [[ $((roll0 + roll1)) -eq 10 ]]; then #SPARE
        [[ $roll1 = "X" || $roll2 = "X" ]] && earlyScore
        (( frames[frame]+=roll0 + roll1 + roll2 ))
        ((i++))
        if [[ frame -eq 9 ]]; then
            (( roll2 > 10 )) && pinCountExceeds
            [[ $((i+2)) -lt ${#rolls[@]} ]] && gameOver
            gameComplete=true
            break
        else ((frame++))
        fi
    elif [[ $((roll0 + roll1)) -lt 10 ]]; then #OPEN
        [[ $roll1 = "X" ]] && earlyScore
        (( frames[frame]+=roll0 + roll1 ))
        ((i++))
        if [[ frame -eq 9 ]]; then 
            [[ $((i+1)) -lt ${#rolls[@]} ]] && gameOver
            gameComplete=true
            break
        fi
        ((frame++))
    else pinCountExceeds
    fi
done

[[ $# -lt 10 || ! $gameComplete ]] && earlyScore

score "${frames[@]}"