#!/bin/bash

#Drop table if exists already
bq rm -f -t gnomad.genome_genotypes
#
##Create empty table
bq mk --force --schema chrom:string,pos:integer,ref:string,alt:string,RF:boolean,AC0:boolean,segdup:boolean,lcr:boolean,inbeedingCoeff:boolean,filtered:boolean,AC:integer,AN:integer,AC_raw:integer,AN_raw:integer,AC_POPMAX:integer,AN_POPMAX:integer,VQSLOD:float,AS_RF:float,most_severe_consequence:string,in_release:boolean,sample:string,gt_isHet:boolean,gt_isHQ:boolean,gt_fakeRef:boolean,gt_dp:integer,gt_ad0:integer,gt_ad1:integer,gt_gq:integer,gt_pl0:integer,gt_pl1:integer,gt_pl2:integer -t gnomad.genome_genotypes 
#
##Load genotypes data
bq load --source_format=CSV -F "\t" --null_marker=NA --skip_leading_rows 1 gnomad.genome_genotypes gs://gnomad-lfran/bigquery/bigquery.genomes.tsv.gz/part-0*.gz
bq load --source_format=CSV -F "\t" --null_marker=NA --skip_leading_rows 1 gnomad.genome_genotypes gs://gnomad-lfran/bigquery/bigquery.genomes.tsv.gz/part-1*.gz

###Do it in batches of 100 files so that ones that error out can be retried
##
#n=`gsutil ls gs://gnomad-lfran/bigquery/bigquery.genomes.tsv.bgz/ | wc -l`
##
#echo "Found $n files"
##
##
##
#n=$(( n / 100 ))
#echo "processing $n batches"
#
#for i in `seq 0 $n`; 
#do
#	padded_i=`printf %03d $i`
#	echo "Loading batch gs://gnomad-lfran/bigquery/bigquery.genomes.tsv.bgz/part-0${padded_i}*.bgz "
#	bq load --source_format=CSV -F "\t" --null_marker=NA --skip_leading_rows 1 gnomad.genome_genotypes_tmp gs://gnomad-lfran/bigquery/bigquery.genomes.tsv.bgz/part-${padded_i}*.bgz
#done
##
##for i in `seq 10 17`; 
##do
##	echo "Loading part $i"
##	bq load --source_format=CSV -F "\t" --null_marker=NA --skip_leading_rows 1 gnomad.genome_genotypes_tmp gs://gnomad-lfran/bigquery/bigquery.genomes.tsv.bgz/part-$i*.bgz
##done
##bq load --source_format=CSV  --autodetect --null_marker=NA gnomad.genome_genotypes_tmp gs://gnomad-lfran/bigquery/bigquery.genomes.tsv.bgz/part-1*.bgz
#
