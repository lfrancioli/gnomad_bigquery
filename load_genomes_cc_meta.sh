#!/bin/bash

#Remove table if mxisting
bq rm -f -t gnomad.genome_case_control_meta

#Create empty table
bq mk --force --schema sample:string,pid:string,case_control:string,age:float -t gnomad.genome_case_control_meta

#Load table
bq load --source_format=CSV --null_marker=NA -F "\t" gnomad.genome_case_control_meta ../genomes_age_data.txt
#Remove dupicate entrieskeep entries with age
#bq query --destination_table gnomad.genome_case_control_meta --replace 'SELECT sample, pid, case_control, min(age) as age FROM [broad-mpg-gnomad:gnomad.genome_case_control_meta] group by sample, pid,case_control'

