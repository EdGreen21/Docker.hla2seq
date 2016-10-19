#!/bin/bash

#step 1: sort out chr6 reads
samtools view -b /workspace/${inputBAM}.bam chr6 > /workspace/${inputBAM}.chr6.bam

#step 2: extract fastq reads (samtools implementation seems fastest)
samtools fastq -1 /workspace/${inputBAM}_1.fq -2 /workspace/${inputBAM}_2.fq /workspace/${inputBAM}.chr6.bam

#step 3: repair interleaving in *.fq files
/download/bbmap/repair.sh in1=/workspace/${inputBAM}_1.fq in2=/workspace/${inputBAM}_2.fq out1=/workspace/${inputBAM}_1.repair.fq out2=/workspace/${inputBAM}_2.repair.fq
rm /workspace/${inputBAM}_1.fq /workspace/${inputBAM}_2.fq

#step 4: run seq2HLA with $threadsN
python /download/seq2hla/seq2HLA.py -1 /workspace/${inputBAM}_1.repair.fq -2 /workspace/${inputBAM}_2.repair.fq -r "/workspace/${inputBAM}" -p ${threadsN}

#step 5: cleanup extracted files to save disk space
rm /workspace/*.fq /workspace/*.sam /workspace/*.chr6.bam
