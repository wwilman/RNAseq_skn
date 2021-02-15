#tworzymy indeks do kwantyfikacji
wget ftp://ftp.ensemblgenomes.org/pub/release-46/plants/fasta/arabidopsis_thaliana/ncrna/Arabidopsis_thaliana.TAIR10.ncrna.fa.gz
wget ftp://ftp.ensemblgenomes.org/pub/release-46/plants/fasta/arabidopsis_thaliana/cdna/Arabidopsis_thaliana.TAIR10.cdna.all.fa.gz
cat Arabidopsis_thaliana.TAIR10.cdna.all.fa.gz Arabidopsis_thaliana.TAIR10.ncrna.fa.gz > Arabidopsis_index
kallisto index -i Arabidopsis_index.idx Arabidopsis_index

#Kwantyfikacja ekspresji 
#!/bin/bash  
file="Arabidopsis_index.idx"
inp=""
fr="ERR4131"  

typ=".fastq.gz"  

for n in 950 951 952 953 962 963 964 965

do

mkdir wyniki_kallisto_$fr$n
mkdir wyniki_kallisto_$fr$n/$fr$n

echo "===================================================="  

echo 'Pseudoaligning file: '$n

echo "====================================================" 

kallisto quant  --single -l 73 -s 5 --index=Arabidopsis_index.idx --output=wyniki_kallistofr/$ng$nr $inp$fr$n$typ $inp$fr$n$typ

done

#R

c1<- read.table('wyniki_kallisto_ERR4131950\abundance.tsv', sep="\t", header=T)
c2<- read.delim('wyniki_kallisto_ERR4131951\abundance.tsv', sep="\t", header=T)
c3<- read.delim('wyniki_kallisto_ERR4131952\abundance.tsv', sep="\t", header=T)
c4<- read.delim('wyniki_kallisto_ERR4131953\abundance.tsv', sep="\t", header=T)
f1<- read.delim('wyniki_kallisto_ERR4131962\abundance.tsv', sep="\t", header=T)
f2<- read.delim('wyniki_kallisto_ERR4131963\abundance.tsv', sep="\t", header=T)
f3 <- read.delim('wyniki_kallisto_ERR4131964\abundance.tsv', sep="\t", header=T)
f4 <- read.delim('wyniki_kallisto_ERR4131965\abundance.tsv', sep="\t", header=T)


names(c1)[names(c1) == "est_counts"] <- "control"
names(c2)[names(c2) == "est_counts"] <- "control"
names(c3)[names(c3) == "est_counts"] <- "control"
names(c4)[names(c4) == "est_counts"] <- "control"
names(f1)[names(f1) == "est_counts"] <- "test"
names(f2)[names(f2) == "est_counts"] <- "test"
names(f3)[names(f3) == "est_counts"] <- "test"
names(f4)[names(f4) == "est_counts"] <- "test"

c1$control=as.integer(c1$control)
c2$control=as.integer(c2$control)
c3$control=as.integer(c3$control)
c4$control=as.integer(c4$control)
f1$control=as.integer(f1$test)
f2$control=as.integer(f2$test)
f3$control=as.integer(f3$test)
f4$control=as.integer(f4$test)

dane = cbind(c1$target_id,c1$control,c2$control,c3$control,c4$control,f1$test,f2$test,f3$test,f4$test)
names(dane)[1] <- "gene"
names(dane)[2] <- "control"
names(dane)[3] <- "control"
names(dane)[4] <- "control"
names(dane)[5] <- "control"
names(dane)[6] <- "test"
names(dane)[7] <- "test"
names(dane)[8] <- "test"
names(dane)[9] <- "test"

write.table(dane, file='case_vs_control_kallisto.txt', sep = "\t", quote = FALSE, row.names=FALSE, col.names=c("gene","control","control","control","control","test","test","test","test"))

