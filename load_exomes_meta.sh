#!/bin/bash
#Drop table if exists already
bq rm -f -t gnomad.exome_static_samples_metadata

#
##Create empty table
bq mk --force --schema underscored_sample:string,sample:string,nreads:integer,avg_dp:float,freemix:float,ic:float,o_hom:integer,n_nm:integer,pid:string,sample_name:string,sample_name_in_vcf:string,gvcf:string,bam:string,included_in_final_vcf:boolean,modifications:string,ex_in:string,old_bam:string,old_sample_name:string,old_sample_name_in_vcf:string,gross_platform:string,detailed_platform:string,fam_id:string,depth:integer,x_snps:integer,x_snps_1:float,x_cumul:float,chr20_cov:integer,average_chr20_cov:float,xhet:float,xcov:float,ycov:float,sex:string,external_vs_broad:string,pi:string,description:string,exac_version:string,deprecated_recontactable:string,remove_for_non_psych:string,remove_for_non_tcga:boolean,remove_for_non_diabetes:boolean,cloudable:boolean,cc:string,age:float,name_in_exacv1:string,pct_chimera:float,population:string,callrate:float,nhomref:integer,nhet:integer,nhomvar:integer,ncalled:integer,nnotcalled:integer,nsnp:integer,ninsertion:integer,ndeletion:integer,nsingleton:integer,ntransition:integer,ntransversion:integer,nnonref:integer,rtitv:float,rhethomvar:float,rinsertiondeletion:float,dpmean:float,dpstdev:float,gqmean:float,gqstdev:float,permission:boolean,drop_status:string,drop_reasons:string,drop_condense:string -t gnomad.exome_static_samples_metadata
 
#Load data
bq load --source_format=CSV  -F "\t"  --skip_leading_rows 1 --null_marker=NA gnomad.exome_static_samples_metadata gs://gnomad-exomes-raw/super_meta_june_02_2017.txt.gz

