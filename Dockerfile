#################################################################
# Dockerfile
#Edited from Optitype file example
# Version:          1.0
# Software:         seq2HLA
# Software Version: 2.2
# Description:      4-digit HLA typing from .bam files
# Website:          https://github.com/EdGreen21/Docker.hla2seq
# Tags:             Genomics
# Provides:         seq2HLA
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t fred2/opitype .
# Pull Cmd:         docker pull fred2/optitype
# Run Cmd:          docker run -v /path/to/file/dir:/data fred2/optitype
#################################################################

# Source Image
FROM jemimalwh/seq2hla:v0.1

################## BEGIN INSTALLATION ###########################
git clone https://github.com/EdGreen21/Docker.hla2seq.git
cp Docker.hla2seq/start.sh /workspace/

# Change workdir to /data/
WORKDIR /workspace/

# Define default command
ENTRYPOINT ["start.sh"]
CMD ["-h"]

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Edward Green <e.green@dkfz.de>
