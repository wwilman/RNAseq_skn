#!/bin/bash

esearch -db sra -query PRJEB38244 | efetch -format  runinfo -mode xml | xtract -pattern SraRunInfo -element Run > numery_SRR
