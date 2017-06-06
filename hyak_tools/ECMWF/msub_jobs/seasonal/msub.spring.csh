#!/bin/bash
#PBS -N ERA_spring

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
#PBS -d /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/msub_jobs/seasonal

module load matlab_2015b
matlab -nojvm < /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/seasonal/collect_grid_top50_info_spring.m  >& /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/logs/seasonal/spring/log.ECMWF.collect_grid_top50_info_spring.txt 
matlab -nojvm < /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/seasonal/calc_percentile_spring.m  >& /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/logs/seasonal/spring/log.ECMWF.calc_percentile_spring.txt 
matlab -nojvm < /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/seasonal/calc_percentile_mono_spring.m  >& /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/logs/seasonal/spring/log.ECMWF.calc_percentile_mono_spring.txt 
matlab -nojvm < /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/seasonal/calc_grid_top50_percentile_spring.m  >& /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis_tools/ECMWF/logs/seasonal/spring/log.ECMWF.calc_grid_top50_percentile_spring.txt 


exit 0
