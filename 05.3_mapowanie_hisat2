#!/bin/bash  
file="Arabidopsis_index.idx"
inp=""
fr="ERR4131"  
typ=".fastq.gz"  

for n in 950 951 952 953 966 967 968 969

do 
		echo "================================"
		echo "Mapping reads for" $fr$n
		echo "=============================="
		hisat2 -x ~/index/index -U $inp$fr$n'.fastq.gz' -S $inp$fr$n".sam"

done

for n in 950 951 952 953 966 967 968 969

do 

		echo "SAM to BAM and sort" $inp$fr$n
		echo "==============================" 
		samtools view -S -b $inp$fr$n".sam" | samtools sort -o $inp$fr$n"_sorted.bam" 
		
done

echo "================================" 
echo "Counting data" 
echo "==============================" 

featureCounts -a Arabidopsis_thaliana.TAIR10.49.gtf -g transcript_id -o counts_sorted_hisat.txt  *_sorted.bam

#R
Data_hs <- read.table('counts_sorted_hisat.txt',sep='\t',header=TRUE,skip=1)
countData <- Data_hs[,7:12]
rownames(countData) <-Data_hs$Geneid
samples = names(countData)
write.table(countData, file='count_matrix.txt', sep="\t", quote=F, row.names=T) 
