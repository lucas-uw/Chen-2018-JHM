# Chen-2018-JHM
Tools and scripts for Journal of Hydrometeorology (2018) paper:
Chen, X., and F. Hossain (2018): Understanding model-based probable maximum precipitation estimation as a function of storm type and geographic region using atmospheric reanalysis, J. Hydrometeor. 

## hyak\_tools
Tools to be put on UW Hyak system. Put the folder at /civil/shared/ganges/xiaodc/lulcc/tools/reanalysis\_tools, within each directiry create necessary folders (e.g. logs, msub\_jobs.logs), and run the scripts. These script will create the Matlab format data from the concatenated netCDF files, and work all the way till the grid\_top50\_* data are obtained. Check the README.md in each folder for more explanation.

## local\_tools
Tools here are used to calculate the climate control (3 or 4 factors) maps that are used for plotting. They digest the grid\_top50\_* data that are generated from Hyak.