#!/bin/bash

while IFS='' read -r line || [[ -n "$line" ]]; do
AR=$(echo $line | awk '{print $1}');
PAIR=$(echo $line | awk '{print $2}');
echo "Pobieranie $AR";

if [[ $PAIR == "PAIRED" ]]
then
	fastq-dump ${AR} --split-files --gzip 
fi
if [[ $PAIR == "SINGLE" ]]
then
	fastq-dump ${AR} --gzip
else
	echo "Określ typ danych - paired-end czy single-end?"
fi
done < $1
