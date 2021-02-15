#!/bin/bash 

fr="ERR4131"  

type=".fastq.gz"  

for n in 950 951 952 953 962 963 964 965

do   

echo "===================================================="  	

echo 'QC :'$fr$n$type     

echo "====================================================" 

fastqc $file$fr$n$type 

done 

multiqc *
