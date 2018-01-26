#!/bin/bash

bq load --source_format=CSV --null_marker=NA -F "\t" gnomad.exome_case_control_meta ./exomes_cc_status.txt
#Remove dupicate entries, keep entries with age
bq query --destination_table gnomad.exome_case_control_meta --replace 'SELECT sample, pid, case_control, min(age) as age FROM [broad-mpg-gnomad:gnomad.exome_case_control_meta] group by sample, pid,case_control'

