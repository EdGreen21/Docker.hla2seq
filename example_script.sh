#!/usr/bin/env bash

# This is an example of a script for processing TCGA patient data downloaded with gdc-client into separate folders.
# When run in the top level directory, the script iterates over all directories of patient data and processes the *.bam file in each
# By default 16 threads are used

for d in */ ; do
    for f in $d*.bam ; do
      xbase=${f##*/}
      xpref=${xbase%.*}
      #echo "Processing $(basename $f) in directory $(realpath $d)"
      sudo docker run -it -v $(realpath $d)/:/workspace/ -e inputBAM=$xpref -e threadsN=16 edgreen/seq2hla:latest
	  done
done
