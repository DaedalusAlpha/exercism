#!/usr/bin/env bash

# This is called each time the player rolls a ball.
# The argument is the number of pins knocked down.
# $1 = pins
roll() {
 exit    
}

# This is called only at the very end of the game. It returns the total score 
# for that game.
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

frames=(0 0 0 0 0 0 0 0 0 0)
rolls=( "$@" )
frame=0

[[ ${#rolls[@]} -eq 0 ]] && earlyScore

for ((i = 0 ; i < ${#rolls[@]} ; i++)); do
    [[ ${#frames[@]} -gt 10 ]] && gameOver
    roll0="${rolls[i]}"
    [[ roll0 -lt 0 ]] && negativeRoll
    [[ roll0 -gt 10 ]] && pinCountExceeds
    if (( (i + 1) < ${#rolls[@]} )); then #NEXT ROLL
        roll1="${rolls[$((i+1))]}"; else roll1=0; fi
    if (( (i + 2) < ${#rolls[@]} )); then #ROLL AFTER NEXT
        roll2="${rolls[$((i+2))]}"; else roll2=0; fi
    [[ roll1 -gt 10 ]] && pinCountExceeds
    [[ roll2 -gt 10 ]] && pinCountExceeds

    if [[ roll0 -eq 10 ]]; then # STRIKE
        frames[frame]+=$(( roll0 + roll1 + roll2 ))
        echo $frame "${frames[(($frame))]}"
        if [[ frame -eq 9 ]]; then
            break
        else ((frame++))
        fi
    elif [[ $((roll0 + roll1)) -eq 10 ]]; then #SPARE
        frames[frame]+=$(( roll0 + roll1 + roll2 ))
        ((i++))
        if [[ frame -eq 9 ]]; then
            if (( (roll2) > 10 )); then
                pinCountExceeds
            fi
            break
        else ((frame++))
        fi
    elif [[ $((roll0 + roll1)) -lt 10 ]]; then #OPEN
        frames[frame]+=$(( roll0 + roll1 ))
        ((i++))
        [[ frame -eq 9 ]] && break
        ((frame++))
    else pinCountExceeds
    fi
        # echo "r0:$roll0 r1:$roll1 r2:$roll2 ${frames[(($frame-1))]} $frame"
done

score "${frames[@]}"