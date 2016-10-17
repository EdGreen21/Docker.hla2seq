#!/bin/bash

samtools fastq -1 /workspace/${sampleID}_1.repair.fq -2 /workspace/${sampleID}_2.repair.fq /workspace/${inputBAM}.bam

#/download/bam2fastq/bam2fastq -f -o /workspace/${sampleID}#.fq -q /workspace/${inputBAM}.bam

#step 2 repair .fq files and remove unrepaired
#'/download/bbmap/repair.sh in1=/workspace/${sampleID}_1.fq in2=/workspace/${sampleID}_2.fq out1=/workspace/${sampleID}_1.repair.fq out2=/workspace/${sampleID}_2.repair.fq

python /download/seq2hla/seq2HLA.py -1 /workspace/${sampleID}_1.repair.fq -2 /workspace/${sampleID}_2.repair.fq -r "/workspace/${sampleID}" -p ${threads}

rm /workspace/*.fq
