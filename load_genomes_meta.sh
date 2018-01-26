#!/bin/bash
#Drop table if exists already
bq rm -f -t gnomad.genome_static_samples_metadata

bq load --source_format=CSV  --autodetect --null_marker=NA gnomad.genome_static_samples_metadata gs://gnomad-genomes-raw/gnomad.final.all_meta.txt.bgz

