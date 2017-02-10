#! /usr/bin/env bash 

datasets="$HOME/temp/data-sets"
# Which state has the highest popultion?

states="$datasets/misc/states.tab.gz"
answer_1=$(gzcat $states | cut -f1,6 | sort -k2g | grep -v '^#' |
head -n1 | cut -f 1 | sed 's/"//g' ) 

echo "answer-1: $answer_1"

records="$datasets/fasta/sample.fa"
answer_2=$(grep '^>' $records | wc -l )  

echo "answer-2: $answer_2"

unique="$datasets/bed/cpg.bed.gz"
answer_3=$(gzcat $unique | cut -f4 | uniq | wc -l )

echo "answer-3: $answer_3"

answer_4=$( cat $datasets/fastq/SP1.fq  | sort | grep ^[A,T,C,G] | grep [A,T,C,G]$ | grep -v [@#%$] | wc -l )

echo "answer-4: $answer_4"

bloody="$datasets/misc/hamlet.txt"
answer_5=$( cat $bloody | grep 'bloody' | wc -w )

echo "answer-5: $answer_5"

answer_6=$( cat $records | head -n 2 | grep ^A | wc -c )

echo "answer-6: $answer_6"

answer_7=$( gzcat $datasets/bed/genes.hg19.bed.gz | awk 'BEGIN {OFS="\t"}
{print $0, $3 - $2 }' | cut -f4,7 | sort -k2n | tail -n 1 | cut -f1  )

echo "answer-7: $answer_7"

answer_8=$( gzcat $datasets/bed/genes.hg19.bed.gz | cut -f 1 | uniq | wc -l )

echo "answer-8: $answer_8"

answer_9=$( gzcat $datasets/bed/peaks.chr22.bed.gz | uniq | cut -f 4 | grep 'CTCF' |
grep -v 'CTCFL' | wc -l )

echo "answer_9: $answer_9"

answer_10=$( awk 'BEGIN {OFS="\t"} {print $0, $3 - $2 }' $datasets/bed/lamina.bed | cut -f1,5 | sort -k 2n | tail -n 1 | cut -f 1 )

echo "answer_10: $answer_10"

