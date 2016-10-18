#################################################################
# Dockerfile
#Edited from Optitype file example
# Version:          1.0
# Software:         seq2HLA
# Software Version: 2.2
# Description:      4-digit HLA typing from .bam files
# Website:          https://github.com/EdGreen21/Docker_seq2HLA
# Tags:             Genomics
# Provides:         seq2HLA 2.2
# Base Image:       jemimalwh/seq2hla:v0.1
# Build Cmd:        docker build -t edgreen/seq2hla:latest /path/to/Docker_seq2HLA/ (may need --build-arg HTTPS_PROXY=https://xxx)
# Pull Cmd:         docker pull edgreen/seq2hla:latest
# Run Cmd:          docker run -i -t -v /path/to/file/dir/:/workspace/ edgreen/seq2hla -e sampleID=xx -e inputBAM=xx -e threads (also --entrypoint)
#################################################################

# Source Image
FROM jemimalwh/seq2hla:v0.1

################## BEGIN INSTALLATION ###########################
COPY start.sh /usr/local/bin/ 
RUN chmod 777 /usr/local/bin/start.sh

RUN wget https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2
RUN tar -xvjf samtools-1.3.1.tar.bz2
WORKDIR /workspace/samtools-1.3.1
RUN make
RUN cp samtools /bin/


# Change workdir to /data/
WORKDIR /workspace/

# Define default command
ENTRYPOINT ["start.sh"]
CMD ["-h"]

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Edward Green <e.green@dkfz.de>
