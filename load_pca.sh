#!/bin/bash
#Drop table if exists already
bq rm -f -t gnomad.samples_pcs

bq load --source_format=CSV  --autodetect --null_marker=NA gnomad.samples_pcs gs://gnomad-genomes/sampleqc/gnomad.pca.txt.gz

