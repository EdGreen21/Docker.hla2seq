#!/bin/bash
threads=6

# Extract fastq reads from bam file
#check if new samtools implementation bam2fq is faster than bedtools implementation
/download/bam2fastq/bam2fastq -o /workspace/${sampleID}#.fq -q /workspace/${inputBAM}.bam

#step 2 repair .fq files and remove unrepaired
/download/bbmap/repair.sh in1=/workspace/${sampleID}_1.fq.gz in2=/workspace/${sampleID}_2.fq.gz out1=/workspace/${sampleID}_1.repair.fq out2=/workspace/${sampleID}_2.repair.fq
rm /workspace/${sampleID}_1.fq.gz /workspace/${sampleID}_2.fq

#step 3 run seq2HLA.py:
python /download/seq2hla/seq2HLA.py -1 /workspace/${sampleID}_1.repair.fq -2 /workspace/${sampleID}_2.repair.fq -r "/workspace/${sampleID}" -p ${threads}

#step 4 remove files:
rm /workspace/*.fq /workspace/*.sam /workspace/*.fq.gz 
