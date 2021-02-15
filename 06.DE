library(DESeq2)
library(gplots)
library(ComplexHeatmap)
library("circlize")
#uzyskiwanie wyników dla ekspresji przy użyciu DeSeq2
counts <- read.delim('/home/kons/A_SKN/trimmed/case_vs_control_salmon.txt', sep="\t", header=T, row.names=1)
counts =  trunc(counts)
counts <- as.matrix(counts)
design <- data.frame( condition=factor( c("control", "control", "control", "control", "test", "test", "test","test") ) )
rownames(design) <- colnames(counts)
dataset <- DESeqDataSetFromMatrix(countData = counts, colData = design, design = ~condition)
dataset <- DESeq(dataset)
de_results <- results(dataset)
new_columns <- data.frame(GeneID=rownames(de_results))
de_results <- cbind( new_columns, de_results)
de_results=de_results[order(de_results$padj),]
up <- de_results[ de_results$padj < 0.05 & complete.cases(de_results$padj), ]
up <- up[order(up$padj),]
de_resultsup <- subset(up, log2FoldChange > 0) 
down <- de_results[ de_results$padj < 0.05 & complete.cases(de_results$padj), ]
down <- down[order(down$padj),]
de_resultsdown <- subset(down, log2FoldChange < 0)

#zapisywanie wyników do plików
write.table(de_resultsup, file='salmon_deseq2up.tsv', sep="\t", quote=F, row.names=F)
write.table(de_resultsdown, file='salmon_deseq2down.tsv', sep="\t", quote=F, row.names=F)
write.table(de_results, file='salmon_deseq2.tsv', sep="\t", quote=F, row.names=F)

#wykres MA
plotMA(dataset, main="MA plot", ylim=c(-2, 2)) 
#heatmapa
normalized_expression <- counts(dataset, normalized=T)
de_genes <- results(dataset) 
genes <- normalized_expression[de_genes$padj < 0.05 & complete.cases(de_genes$padj),] 
heatmap.2( as.matrix(genes), labRow=F, col=redgreen(100), scale="row", dendrogram="column", trace="none", cexCol=1.2, hclust=function(x) hclust(x,method="centroid"), distfun=function(x) as.dist(1-cor(t(x))) )
#PCA
library("pcaExplorer")
pcaplot(dataset, intgroup = c("condition"))
