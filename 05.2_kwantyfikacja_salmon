#budowanie indeksu salmona
cat Arabidopsis_thaliana.TAIR10.cdna.all.fa.gz Arabidopsis_thaliana.TAIR10.ncrna.fa.gz > Arabidopisis.fa.gz
salmon index -t Arabidopisis.fa.gz -i Arabidopsis_index_salmon

#Kwantyfikacja ekspresji 
#!/bin/bash  

fr="ERR4131"  

typ=".fastq.gz"  

for n in 950 951 952 953 962 963 964 965

do
mkdir wyniki_salmon_$fr$n
mkdir wyniki_salmon_$fr$n/$fr$n

echo "===================================================="  

echo 'Pseudoaligning file: '$fr$n

echo "====================================================" 

salmon quant -i Arabidopsis_index_salmon -l A \
         -r $fr$n$typ \
         -p 8 --validateMappings -o wyniki_salmon_$fr$n/$fr$n
done

#R
c1<- read.table('wyniki_salmon_ERR4131950/ERR4131950/quant.sf', sep="\t", header=T)
c2<- read.delim('wyniki_salmon_ERR4131951/ERR4131951/quant.sf', sep="\t", header=T)
c3<- read.delim('wyniki_salmon_ERR4131952/ERR4131952/quant.sf', sep="\t", header=T)
c4<- read.delim('wyniki_salmon_ERR4131953/ERR4131953/quant.sf', sep="\t", header=T)
e1<- read.delim('wyniki_salmon_ERR4131962/ERR4131962/quant.sf', sep="\t", header=T)
e2<- read.delim('wyniki_salmon_ERR4131963/ERR4131963/quant.sf', sep="\t", header=T)
e3<- read.delim('wyniki_salmon_ERR4131964/ERR4131964/quant.sf', sep="\t", header=T)
e4<- read.delim('wyniki_salmon_ERR4131965/ERR4131965/quant.sf', sep="\t", header=T)

names(c1)[names(c1) == "NumReads"] <- "control"
names(c2)[names(c2) == "NumReads"] <- "control"
names(c3)[names(c3) == "NumReads"] <- "control"
names(c4)[names(c4) == "NumReads"] <- "control"
names(e1)[names(e1) == "NumReads"] <- "test"
names(e2)[names(e2) == "NumReads"] <- "test"
names(e3)[names(e3) == "NumReads"] <- "test"
names(e4)[names(e4) == "NumReads"] <- "test"

c1$control=as.integer(c1$control)
c2$control=as.integer(c2$control)
c3$control=as.integer(c3$control)
c4$control=as.integer(c4$control)
e1$control=as.integer(e1$test)
e2$control=as.integer(e2$test)
e3$control=as.integer(e3$test)
e4$control=as.integer(e4$test)

dane = cbind(c1$Name,c1$control,c2$control,c3$control,c4$control,e1$test,e2$test,e3$test,e4$test)
names(dane)[1] <- "gene"
names(dane)[2] <- "control"
names(dane)[3] <- "control"
names(dane)[4] <- "control"
names(dane)[5] <- "control"
names(dane)[6] <- "test"
names(dane)[7] <- "test"
names(dane)[8] <- "test"
names(dane)[9] <- "test"

write.table(dane, file='case_vs_control_salmon.txt', sep = "\t", quote = FALSE, row.names=FALSE, col.names=c("gene","control","control","control","control","test","test","test","test"))
