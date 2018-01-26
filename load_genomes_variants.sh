#!/bin/bash

#Drop table if exists already
bq rm -f -t gnomad.genome_variants
#
##Create empty table
bq mk --force --schema chrom:string,pos:integer,ref:string,alt:string,was_split:boolean,RF_filtered:boolean,AC0_filtered:boolean,segdup_filtered:boolean,lcr_filtered:boolean,inbreedingCoeff_filtered:boolean,filtered:boolean,most_severe_consequence:string,in_release:string,AN:integer,BaseQRankSum:float,ClippingRankSum:float,DP:integer,FS:float,InbreedingCoeff:float,MQ:float,MQRankSum:float,QD:float,ReadPosRankSum:float,SOR:float,VQSLOD:float,VQSR_culprit:string,VQSR_NEGATIVE_TRAIN_SITE:boolean,VQSR_POSITIVE_TRAIN_SITE:boolean,AN_AFR:integer,AN_AMR:integer,AN_ASJ:integer,AN_EAS:integer,AN_FIN:integer,AN_NFE:integer,AN_OTH:integer,AN_raw:integer,STAR_AC:integer,STAR_AC_raw:integer,STAR_Hom:integer,STAR_Hemi:integer,AC:integer,AF:float,AC_AFR:integer,AC_AMR:integer,AC_ASJ:integer,AC_EAS:integer,AC_FIN:integer,AC_NFE:integer,AC_OTH:integer,AF_AFR:float,AF_AMR:float,AF_ASJ:float,AF_EAS:float,AF_FIN:float,AF_NFE:float,AF_OTH:float,AC_raw:integer,AF_raw:float,Hom_AFR:integer,Hom_AMR:integer,Hom_ASJ:integer,Hom_EAS:integer,Hom_FIN:integer,Hom_NFE:integer,Hom_OTH:integer,Hom_raw:integer,Hom:integer,POPMAX:string,AC_POPMAX:integer,AN_POPMAX:integer,AF_POPMAX:float,DP_MEDIAN:float,DREF_MEDIAN:float,GQ_MEDIAN:float,AB_MEDIAN:float,AS_RF:float,AS_FilterStatus:string,Hemi_NFE:integer,Hemi_AFR:integer,Hemi_OTH:integer,Hemi_AMR:integer,Hemi:integer,Hemi_FIN:integer,Hemi_ASJ:integer,Hemi_EAS:integer,Hemi_raw:integer -t gnomad.genome_variants

#
##Load variants data
bq load --source_format=CSV -F "\t" --null_marker=NA --skip_leading_rows 1 gnomad.genome_variants gs://gnomad-lfran/bigquery/bigquery.variants.genomes.tsv.gz/part-0*.gz
bq load --source_format=CSV -F "\t" --null_marker=NA --skip_leading_rows 1 gnomad.genome_variants gs://gnomad-lfran/bigquery/bigquery.variants.genomes.tsv.gz/part-1*.gz

