# Podróż po magicznym świecie RNAseq z Studenckim Kołem Naukowym Bioinformatyków

Kto chce poznać różnice w ekspresji genów u mutantów roślinnych? A może interesują Cię bardziej eksprerymenty na danych zwierzęcych albo pochodzących od ludzi? Możliwości analizy RNAseq omówi w najbliższy wtorek o 19:30 nasza wiceprzewodnicząca Wiktoria Wilman. Pokaże Wam jakimi ścieżkami można podążać w trakcie analizy oraz przedstawi sposoby jak przeprowadzić taką analizę samodzielnie od A do Z. Gorąco zapraszamy na to spotkanie wszystkich zainteresowanych! 

To repozytorium jest zbudowane na podstawie moich prywatnych doświadczeń budowanych w trakcie różnych prac badawczych. Może ono zawierać błędy i kod można na pewno napisać lepiej. Zostało ono skonstruowane na potrzeby spotkania SKNu Bioinformatyków ,,Podróż po magicznym świecie RNAseq z Studenckim Kołem Naukowym Bioinformatyków". Ten kod może być wykorzystywany do innych analiz po przeprowadzeniu niewielkich modyfikacji.

Wymagane oprogramowanie:
- fastQc
- MultiQC
- Trimmomatic
- kallisto
- salmon
- hisat2
- R z pakietami Bioconductor: DESeq2,  ComplexHeatmap, pcaExplorer.

Podsumowanie kolejnych skryptów:
1. Pierwsze 4 skrypty są wspólne dla każdej ścieżki analizy:
  
  01.pobieranie_numerów - 
  
  02.pobieranie_danych -
  
  03.kontrola_jakości -

2. Należy wybrać jeden z 3 skryptów kroku 5:

05.1_kwantyfikacja_kallisto

05.2_kwantyfikacja_salmon

05.3_mapowanie_hisat2

3. Ostatni etap odpowiedni dla wszystkich skryptów kroku 5:

06.DE
  
