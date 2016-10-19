edgreen/Docker_seq2HLA
======================

seq2HLA on BAM files

Authors: Ed Green
Date: October 2016
Version: 1.0 

Installed Sofware
[seq2HLA 2.2](http://tron-mainz.de/tron-facilities/computational-medicine/seq2hla/)

Install from Docker hub
-----------------------
> docker pull edgreen/seq2hla:latest


Building from source
--------------------
To build from the Dockerfile clone the repository using the following command:
> git clone https://github.com/EdGreen21/Docker_seq2HLA.git

Change directory to the downloaded files:
> cd Docker_seq2hla

Ensure you have Docker installed (and that you don't need to be sudo to run it) and build the image:
> docker build .

If you are behind a proxy server you will need to add these details:
> docker build --build-arg HTTPS_PROXY=https://xxx .


Running seq2HLA
---------------
Run with the following command, setting inputBAM as your BAM file (i.e. for foo.bam inputBAM=foo)
> docker run -it -v /path/to/file/dir/:/workspace/ -e inputBAM=xx -e threadsN edgreen/seq2hla:latest


Example script for processing TCGA data
---------------------------------------
An example script is provided that iterates over directories and processes the bam files in each


Contact
-------------
  Ed Green
  egreen@dkfz-heidelberg.de  
  DKFZ, 
  G160,
  Im Neuenheimer Feldt 280,
  Heidelberg 69120,
  Germany
