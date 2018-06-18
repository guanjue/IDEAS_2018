###### run IDEAS
######
### cp script in the folder
IDEAS_job_name=test_IDEAS
output_folder=/storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS_result/

### make output folder
mkdir -p $output_folder
### cp scripts to the analysis folder
cp -r ~/group/software/IDEAS/IDEAS_2018/bin ./
### run IDEAS
time Rscript bin/runme.R run_IDEAS.input run_IDEAS.parafile $output_folder
### get heatmap
time Rscript bin/get_heatmap.R $output_folder$IDEAS_job_name'.para0' FALSE ~/group/software/IDEAS/IDEAS_2018/bin/createGenomeTracks.R
