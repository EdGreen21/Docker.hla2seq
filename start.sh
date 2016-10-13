#!/bin/bash
# Extract fastq reads from bam file and gzip them
/download/bam2fastq/bam2fastq -o /workspace/${sampleID}#.fq -q /workspace/${inputBAM}.bam
gzip /workspace/${sampleID}_1.fq
gzip /workspace/${sampleID}_2.fq

#step 2 repair .fq.gz files and remove unrepaired
/download/bbmap/repair.sh in1=/workspace/${sampleID}_1.fq.gz in2=/workspace/${sampleID}_2.fq.gz out1=/workspace/${sampleID}_1.repair.fq.gz out2=/workspace/${sampleID}_2.repair.fq.gz
rm /workspace/${sampleID}_1.fq.gz /workspace/${sampleID}_2.fq.gz

#step 3 run seq2HLA.py:
python /download/seq2HLA/seq2HLA.py -1 /workspace/${sampleID}_1.repair.fq.gz -2 /workspace/${sampleID}_2.repair.fq.gz -r "/workspace/${sampleID}"

#step 4 remove files:
rm /workspace/*.fq /workspace/*.sam /workspace/*.fq.gz 
