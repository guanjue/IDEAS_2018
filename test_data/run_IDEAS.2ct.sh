###### run IDEAS
######
### cp script in the folder
IDEAS_job_name=test_IDEAS
script_folder=/storage/home/gzx103/group/software/IDEAS/IDEAS_2018/
output_folder=/storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS_result/
binfile=mm10_noblacklist_200bin.bin

### make output folder
mkdir -p $output_folder
### cp scripts to the analysis folder
cp -r $script_folder'bin' ./
cp -r $script_folder'data' ./
### get genome inv file
time python $script_folder'bin.bin2inv.py' -i $binfile -o $binfile'.inv'
### run IDEAS
time Rscript bin/runme.R run_IDEAS.input run_IDEAS.parafile $output_folder
### rm tmp files
rm $output_folder*tmp*
### get heatmap
time Rscript bin/get_heatmap.R $output_folder$IDEAS_job_name'.para0' FALSE ~/group/software/IDEAS/IDEAS_2018/bin/createGenomeTracks.R
