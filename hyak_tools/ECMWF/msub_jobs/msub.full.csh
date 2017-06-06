#!/bin/bash
#PBS -N ECMWF_full

#PBS -l nodes=1:ppn=16,mem=120gb,feature=16core

## WALLTIME DEFAULTS TO ONE HOUR - ALWAYS SPECIFY FOR LONGER JOBS
#PBS -l walltime=10:00:00

## Put the STDOUT and STDERR from jobs into the below directory
#PBS -o /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/msub_jobs.logs
## Put both the stderr and stdout into a single file
#PBS -j oe

## BL Add emailing capabilites
#PBS -M xiaodc.work@gmail.com 
#PBS -m a

## Specify the working directory for this job bundle
#PBS -d /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/msub_jobs

module load matlab_2015b
#matlab -nojvm < /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/collect_grid_top50_info.m >& /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/logs/log.ECMWF.collect_grid_top50_info.txt 
#matlab -nojvm < /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/calc_percentile.m >& /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/logs/log.ECMWF.calc_percentile.txt 
#matlab -nojvm < /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/calc_percentile_mono.m >& /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/logs/log.ECMWF.calc_percentile_mono.txt 
matlab -nojvm < /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/calc_grid_top50_percentile.m >& /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/logs/log.ECMWF.calc_grid_top50_percentile.txt 


exit 0
