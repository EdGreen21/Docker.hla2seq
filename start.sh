#!/bin/bash

# Extract fastq reads from bam file
# Testing shows that samtools fastq is about 3 times as fast as bam2fq.  Also tested Picard and bedtools.
# samtools should also be able to only export properly paired reads - must validate this
 samtools fastq /workspace/${sampleID}_1.repair.fq -2 /workspace/${sampleID}_2.repair.fq /workspace/${inputBAM}.bam

#/download/bam2fastq/bam2fastq -f -o /workspace/${sampleID}#.fq -q /workspace/${inputBAM}.bam

#step 2 repair .fq files and remove unrepaired
#'/download/bbmap/repair.sh in1=/workspace/${sampleID}_1.fq in2=/workspace/${sampleID}_2.fq out1=/workspace/${sampleID}_1.repair.fq out2=/workspace/${sampleID}_2.repair.fq
#rm /workspace/${sampleID}_1.fq /workspace/${sampleID}_2.fq

#step 3 run seq2HLA.py:
python /download/seq2hla/seq2HLA.py -1 /workspace/${sampleID}_1.repair.fq -2 /workspace/${sampleID}_2.repair.fq -r "/workspace/${sampleID}" -p ${threads}

#clean up output
#tar -czvf output.tar.gz *ClassI*
#-ClassI.HLAgenotype4digits
#-ClassI.expression
#-ClassII.HLAgenotype4digits
#-ClassII.expression

#step 4 remove files:
rm /workspace/*.fq
