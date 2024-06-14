#!/usr/bin/env bash
declare -a amino_acids

for ((i=0;i<${#1};i+=3)); do
    codon=${1:i:3}
    case "$codon" in 
        UAA|UAG|UGA) break ;;
        AUG) amino_acids+=(Methionine) ;;
        UUU|UUC) amino_acids+=(Phenylalanine) ;;
        UUA|UUG) amino_acids+=(Leucine) ;;
        UCU|UCC|UCA|UCG) amino_acids+=(Serine) ;;
        UAU|UAC) amino_acids+=(Tyrosine) ;;
        UGU|UGC) amino_acids+=(Cysteine) ;;
        UGG) amino_acids+=(Tryptophan) ;;
        *) echo "Invalid codon" && exit 1
    esac
done

echo "${amino_acids[@]}"