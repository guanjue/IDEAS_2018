# IDEAS: Integrative and Discriminative Epigenome Annotation System

### Advanced sequencing technologies have generated a plethora of data for many chromatin marks in multiple tissues and cell types, yet there is lack of a generalized tool for optimal utility of those data. A major challenge is to quantitatively model the epigenetic dynamics across both the genome and many cell types for understanding their impacts on differential gene regulation and disease. We introduce IDEAS, an integrative and discriminative epigenome annotation system, for jointly characterizing epigenetic landscapes in many cell types and detecting differential regulatory regions. A key distinction between our method and existing state-of-the-art algorithms is that IDEAS integrates epigenomes of many cell types simultaneously in a way that preserves the position-dependent and cell type-specific information at fine scales, thereby greatly improving segmentation accuracy and producing comparable annotations across cell types.

#### Figure 1
<img src="https://github.com/guanjue/IDEAS_2018/blob/master/example_figures/f1_IDEAS_mechanism.png" width="800"/>

##### Figure 1. Illustration of IDEAS model. 


#### Figure 2
<img src="https://github.com/guanjue/IDEAS_2018/blob/master/example_figures/f2_roadmap_result.png" width="800"/>

##### Figure 2. Inferred chromatin states in 127 cell types. (A) Mean epigenetic signal in the IDEAS inferred states (red labeled) and the ChromHMM inferred states (black labeled in brackets). Color key for each state is shown under the heatmap. Percentage of each state in the genome is shown in parenthesis. IDEAS states that do not have a one-to-one mapping with ChromHMM’s states are marked by asterisk. (B) Reproducibility of segmentation by IDEAS between three independent runs using the original program (blue) and the proposed training pipeline (yellow). Each box shows the agreement of segmentation between two runs, measured by adjusted rand index between the inferred chromatin states within matched cell types. Adjusted rand index is a standardized statistics of similarity between two clustering results, which corrects for chance and accounts for different numbers of clusters. (C) Segmentation example by IDEAS and ChromHMM in 127 cell types at genes CIITA and CLEC16A. Blowups highlight some differences between the two maps. Color keys of chromatin states are defined in (A). From: Accurate and reproducible functional maps in 127 human cell types via 2D genome segmentation Nucleic Acids Res. 2017;45(17):9823-9836. doi:10.1093/nar/gkx659


## Install IDEAS
#### (1) clone the github repository 
```
git clone https://github.com/guanjue/IDEAS_2018.git
```


## Input data
##### The input file list: 1st column: cell type name; 2nd column: mark name; 3rd column: input file and its absolution path; each column is separated by whitespace
```
run_IDEAS.input
>>> head run_IDEAS.input 
ERY_ad atac /storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS_input/ERY_ad.atac.1M.txt
MEP atac /storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS_input/MEP.atac.1M.txt
ERY_ad h3k27ac /storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS_input/ERY_ad.h3k27ac.1M.txt
MEP h3k27ac /storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS_input/MEP.h3k27ac.1M.txt
```

##### The parameter file for IDEAS. 
```
run_IDEAS.parafile
>>> head -100 run_IDEAS.parafile 
id= test_IDEAS          #job id, also used as output file names
email= giardine@bx.psu.edu
thread= 32              #number of threads to be used for parallelization

prepmat= 0              #1: preprocess data, 0: for data already processed for ideas
build= mm10             #hg19, hg38, mm9, mm10, not used if bedfile is specified
prenorm= 0              #1: normalize data (assumed 100Million reads in total), 0: do not normalize
bed= mm10.noblack_list.bed      #user specified windows
sig= mean               #mean: mean signal per window, max: max signal per window

ideas= 1                #1: run ideas, 0: not run ideas
train= 50                #number of random starts, used to select states, 0: no training
trainsz= 500000
log2= 0                 #take log2(x+num), 0: do not take log2
cap= 16                 #maximum signal is capped at 16
norm= 0                 #1: standardize by mean and std, 0: no normalization
num_state= 0            #specify number of states for the model, 0: let program determine
num_start= 100          #specify number of states at the initialization stage
minerr= 0.5             #minimum standard deviation in each state, usually between (0,1]
#otherpara= /gpfs/group/yzz2/default/scratch/roadmap_analysis/impute/bin_12mark_1e-4.para0
smooth= 0               #make states more homogeneous along genome, 0: original ideas
burnin= 20              #number of burnins, include both sampling and maximization
sample= 5               #number of steps for maximization, 1 may be fine
split= mm10.noblack_list.bed.inv    #specify an interval file, ideas will run on different intervals separately
impute= None            #specify which marks to be imputed; or All or None
maketrack= 1            #1: make custom tracks for browser visual, 0: no tracks
#statefiles= /storage/home/gzx103/scratch/gtex_encode/bams/entex_data_output_0_16lim_ideas_01/ideas_state_filelist.txt  #only needed if ideas was not run; separate file names by ","
#hubURL= "http://bx.psu.edu/~yuzhang/tmp/"      #URL where the custom tracks will be stored
#mycolor= 255,0,0;255,255,0;0,255,0;0,0,255;50,50,50    #rgb color for each mark, semicolon delimited
#statecolor= /gpfs/group/yzz2/default/scratch/roadmap_analysis/impute/statecolort.txt                   #rgb color of each state
#statename= statename.txt               #state names
#cellinfo= cellinfo.txt #cell type information, order of cell types will be the same in browser, 4 columns: cell type id as shown in state files, cell type short label to be shown in browser, cell type long label, cell type text color
```
##### Usually, user just needs to change the following parameters in the parameter file:
```
thread= 32							#number of threads to be used for parallelization
build= mm10							#hg19, hg38, mm9, mm10, not used if bedfile is specified
bed= mm10.noblack_list.bed			#user specified windows
split= mm10.noblack_list.bed.inv	#specify an interval file, ideas will run on different intervals separately
```


##### The bin file for IDEAS. 1st column: chromosome; 2nd column: bin start coordinate; 3rd column: bin end coordinate; 4th column: bin id; each column is separated by whitespace 
```
mm10_noblacklist_200bin.bed
>>> head mm10_noblacklist_200bin.bed
chr1 0 200 R1
chr1 200 400 R2
chr1 400 600 R3
chr1 600 800 R4
chr1 800 1000 R5
chr1 1000 1200 R6
chr1 1200 1400 R7
chr1 1400 1600 R8
chr1 1600 1800 R9
chr1 1800 2000 R10
```


## RUN IDEAS
##### (1) for command line version, change the folder names (script_folder, input_folder, output_folder) in 'run_IDEAS.sh'
```
>>> head -7 run_IDEAS.sh 
###### run IDEAS
######
### cp script in the folder
IDEAS_job_name=run_IDEAS
script_folder=/storage/home/gzx103/group/software/IDEAS/IDEAS_2018/
output_folder=/storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS_result/
binfile=mm10_noblacklist_200bin.bed
```
##### (2) use 'run_IDEAS.sh' script to run Snapshot
```
time bash run_IDEAS.sh
```

## Output results for test data
### All output files will be to the 'output_folder=/storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS_result/'

## The heatmap for IDEAS epigenetic state
##### Average atac-seq signal heatmap (left). Most abundant functional state heatmap (right).
<img src="https://github.com/guanjue/IDEAS_2018/blob/master/example_figures/f2_roadmap_result.png" width="800"/>

## The genome browser track (bigbed format) for IDEAS epigenetic state will be saved in the following folder: 'output_folder=/storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS_result/' + 'Tracks/'
```
/storage/home/gzx103/group/software/IDEAS/IDEAS_2018/test_data/run_IDEAS_result/Tracks/
```



