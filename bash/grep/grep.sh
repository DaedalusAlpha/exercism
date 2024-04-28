#!/usr/bin/env bash

#1 filecount
#2 filename
#3 line number
#4 line text
addLine() {
    if [[ $lflag ]]; then 
        echo "$2"
    elif [[ "$1" -gt 1 ]]; then 
        if [[ $nflag ]]; then 
            printf '%s:%i:%s\n' "$2" "$3" "$4" #multiple files line numbers
        else
            printf '%s:%s\n' "$2" "$4" #multiple files
        fi
    else
        if [[ $nflag ]]; then 
            printf '%i:%s\n' "$3" "$4" #single file line numbers
        else
            printf '%s\n' "$4" #single file
        fi
    fi
}
# nflag= ;lflag= ;iflag= ;vflag= ;xflag= 
while getopts nlivx name ; do
    case $name in
    n) nflag=1 ;; l) lflag=1 ;; i) iflag=1 ;; v) vflag=1 ;; x) xflag=1 ;;
    ?) echo "Usage: $0 [OPTIONS]... PATTERNS FILES..."; exit 2 ;;
    esac
done
shift $((OPTIND - 1)); # printf "Remaining arguments are: %s\n" "$*"
pattern="$1"; shift; files=( "$@" )
for file in "${files[@]}"; do 
    tmpFile="$file" lineNo=0 fileCount=${#files[@]}
    while IFS= read -r line; do
        original_Line="$line"
        ((lineNo++))
        if [[ $iflag ]]; then line="${original_Line,,}"; pattern="${pattern,,}"; fi
        if [[ $xflag ]]; then
            if [[ $vflag && ( $line != "$pattern" ) ]]; then
                output+=( "$(addLine "$fileCount" "$tmpFile" "$lineNo" "$original_Line")" )
            elif [[ (! "$vflag") && $line = "$pattern" ]]; then
                output+=( "$(addLine "$fileCount" "$tmpFile" "$lineNo" "$original_Line")" )
            fi
        else
            if [[ $vflag && ( ! $line =~ $pattern ) ]]; then
                output+=( "$(addLine "$fileCount" "$tmpFile" "$lineNo" "$original_Line")" )
            elif [[ (! "$vflag") && $line =~ $pattern ]]; then
                output+=( "$(addLine "$fileCount" "$tmpFile" "$lineNo" "$original_Line")" )
            fi
        fi
    done < "$file"
done

if [[ $lflag ]]; then 
    printf '%s\n' "${output[@]}" | sort -u
else printf '%s\n' "${output[@]}"
fi