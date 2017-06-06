#!/bin/bash
#PBS -N NARR_flow

#PBS -l nodes=1:ppn=16,mem=120gb,feature=16core

## WALLTIME DEFAULTS TO ONE HOUR - ALWAYS SPECIFY FOR LONGER JOBS
#PBS -l walltime=10:00:00

## Put the STDOUT and STDERR from jobs into the below directory
#PBS -o /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/NARR/msub_jobs.logs
## Put both the stderr and stdout into a single file
#PBS -j oe

## BL Add emailing capabilites
#PBS -M xiaodc.work@gmail.com 
#PBS -m a

## Specify the working directory for this job bundle
#PBS -d /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/NARR/msub_jobs

module load matlab_2015b
matlab -nojvm < /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/NARR/collect_grid_top50_info.m  >& /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/NARR/logs/log.NARR.collect_grid_top50_info.txt 
matlab -nojvm < /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/NARR/calc_percentile.m  >& /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/NARR/logs/log.NARR.calc_percentile.txt 
matlab -nojvm < /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/NARR/calc_percentile_mono.m  >& /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/NARR/logs/log.NARR.calc_percentile_mono.txt 
matlab -nojvm < /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/NARR/calc_grid_top50_percentile.m  >& /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/NARR/logs/full_NA/log.NARR.calc_grid_top50_percentile.txt 

exit 0
