###### run IDEAS
######
### cp script in the folder
IDEAS_job_name=run_IDEAS
script_folder=/storage/home/gzx103/group/software/IDEAS/IDEAS_2018/
output_folder=/storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS_result/
binfile=mm10_noblacklist_200bin.bed

### make output folder
if [ -d $output_folder ]; then rm -r $output_folder; mkdir $output_folder; else mkdir $output_folder; fi
### cp scripts to the analysis folder
if [ -d bin ]; then rm -r bin; cp -r $script_folder'bin' ./; else cp -r $script_folder'bin' ./; fi
if [ -d data ]; then rm -r bin; cp -r $script_folder'data' ./; else cp -r $script_folder'data' ./; fi
### get genome inv file
time python ./bin/bed2inv.py -i $binfile -o $binfile'.inv'
### run IDEAS
time Rscript ./bin/runme.R $IDEAS_job_name'.input' $IDEAS_job_name'.parafile' $output_folder
### rm tmp files
rm $output_folder*tmp*
### get heatmap
time Rscript bin/get_heatmap.R $output_folder$IDEAS_job_name'.para0' FALSE ./bin/createGenomeTracks.R
