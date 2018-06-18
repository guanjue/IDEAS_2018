###### run IDEAS
######
### cp script in the folder
mkdir -p run_IDEAS_result
cp -r ~/group/software/IDEAS/IDEAS_2018/bin ./
### run IDEAS
time Rscript bin/runme.R /storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS.input /storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS.parafile /storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS_result
### get GenomeBrowser Tracks
find `pwd` -name *chr*.state > state_file_list.txt
time Rscript bin/runme.R /storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS.input /storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS_get_tracks.parafile /storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS_result
### get heatmap
time Rscript bin/get_heatmap.R run_IDEAS_result/test_IDEAS.para0 FALSE ~/group/software/IDEAS/IDEAS_2018/bin/createGenomeTracks.R
