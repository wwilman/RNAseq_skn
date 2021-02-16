#!/bin/bash     

out="trimmed/"  

fr="ERR4131"  

type=".fastq.gz"  

ml=40  

slid='4:20'  

ilc='adapters.fa:2:20:10' 

for n in 950 951 952 953 962 963 964 965

do   

echo "===================================================="  

echo 'Trimming File:' $fr$n$type    

echo "====================================================" 

trimmomatic SE -phred33 $fr$n$type $out$fr$n$type ILLUMINACLIP:$ilc SLIDINGWINDOW:$slid MINLEN:$ml  

done 
