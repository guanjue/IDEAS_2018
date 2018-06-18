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













##### The cell type peak signal file list: 1st column is the foldername and the filename in input folder; 2nd column is the cell type label in output figures
###### The signal track of each cell type in bed format is in the 'atac_sig/' folder
```
signal_list.txt
>>> head signal_list.txt 
atac_sig/LSK.atac.sig.bed	LSK
atac_sig/CMP.atac.sig.bed	CMP
atac_sig/MEP.atac.sig.bed	MEP
atac_sig/GMP.atac.sig.bed	GMP
```


## RUN Snapshot
##### (1) for command line version, change the folder names (script_folder, input_folder, output_folder) in 'runall.sh'
```
head -4 runall.sh 
##################################
script_folder='/Users/universe/Documents/2018_BG/snapshot/bin/'
input_folder='/Users/universe/Documents/2018_BG/snapshot/test_data/input_data/'
output_folder='/Users/universe/Documents/2018_BG/snapshot/test_data/output_result/'
```
##### (2) use 'run_IDEAS.sh' script to run Snapshot
```
time bash run_IDEAS.sh
```

## Output results for test data
### All output files will be to the 'output_folder'

## The heatmap for index set
##### Average atac-seq signal heatmap (left). Most abundant functional state heatmap (right).
<img src="https://github.com/guanjue/snapshot/blob/master/test_data/output_result/snapshot.meansig.png" width="350"/> <img src="https://github.com/guanjue/snapshot/blob/master/test_data/output_result/snapshot.indexset_fun.png" width="350"/> 

##### Functional state epigenetic patterns.
<img src="https://github.com/guanjue/snapshot/blob/master/test_data/input_data/function_label/functional_state_epigenetic_pattern.png" width="350"/>

## The cell differentiation tree for index set 6
##### Average signal tree (left). Most abundant functional state tree (right).
<img src="https://github.com/guanjue/snapshot/blob/master/test_data/output_result/signal_tree/6.signal_list.txt0_1_1_1.tree.png" width="400"/> <img src="https://github.com/guanjue/snapshot/blob/master/test_data/output_result/fun_tree/6.function_list.txt0_1_1_1.tree.png" width="400"/> 

##### Cell type differentiation mean signal violin plot & functional state bar plot
<img src="https://github.com/guanjue/snapshot/blob/master/test_data/output_result/signal_violin/6.0_1_1_1.violin.png" width="400"/> <img src="https://github.com/guanjue/snapshot/blob/master/test_data/output_result/fun_bar/6.0_1_1_1.bar.png" width="400"/> 


##### Merged peak file (bed format)
```
>>> head atac_4cell.sort.bed
chr1	3445639	3446478	chr1_3445639_3446478
chr1	3531951	3532124	chr1_3531951_3532124
chr1	3670451	3671268	chr1_3670451_3671268
chr1	3672091	3672710	chr1_3672091_3672710
chr1	3915538	3915756	chr1_3915538_3915756
chr1	4247201	4247354	chr1_4247201_4247354
chr1	4332543	4332767	chr1_4332543_4332767
chr1	4351941	4352297	chr1_4351941_4352297
chr1	4405847	4406057	chr1_4405847_4406057
chr1	4412515	4412820	chr1_4412515_4412820
```

##### Index set mean signal matrix (bed format)
```
>>> head atac_4cell.meansig.txt
0_0_0_1	1.0613451945782413	1.1849577200056323	0.5294839829940231	2.928835175525287
0_0_1_0	1.0671246828371792	1.2664917833388463	4.556785451444871	0.9371314051064104
0_0_1_1	1.50932230122	0.9744568211300001	1.94595219793	1.8584097730899998
0_1_0_0	1.4409803894962963	2.8776475408259254	1.4850287042000003	1.4514520181962964
0_1_0_1	1.1662457074078123	3.1474988663281254	0.5663094448585938	4.87743563546875
0_1_1_0	1.5020250353344822	3.7340121203655174	6.566498942344828	1.2791282110241378
0_1_1_1	1.543835688075	3.2044735005000002	4.55608701975	1.8168650337750003
1_0_0_0	3.0386503686410262	1.1333250568846154	0.8024231362858975	1.2217726620948723
1_0_0_1	3.243331680793104	1.4948123895824135	0.7377843294110347	5.471914041772415
1_0_1_0	2.8438892549	2.0149830489600005	3.2194045138	1.9493869683600002

```

##### Index signal matrix (bed format)
```
>>> head atac_4cell.sig.txt
chr1_13592001_13592161	0_0_0_1	2.822207311	1.115653708	0.2218317345	8.850424476
chr1_6975366_6975635	0_0_0_1	0.5263196312	0.7616906814	0.2218317345	1.920846614
chr1_7053436_7053652	0_0_0_1	2.527397664	0.7896970943	0.8979158313	2.495271575
chr1_13119493_13119701	0_0_0_1	1.301046319	0.6508195845	0.2326848409	1.060591172
chr1_7109537_7109689	0_0_0_1	0.0	0.0	0.0	0.0
chr1_13050969_13051145	0_0_0_1	0.197709028	0.8361873878	0.665887475	1.311687159
chr1_16563017_16563247	0_0_0_1	1.195682715	1.589561904	0.4430346537	2.032925361
chr1_13125691_13125919	0_0_0_1	2.450325898	2.278048049	1.294899657	1.557048213
chr1_12985993_12986340	0_0_0_1	0.7858383109	0.4782726234	0.251386741	2.945028392
chr1_7589470_7589648	0_0_0_1	1.198632728	0.5693356928	0.1489476907	2.255937684

```

##### Index set most abundant functional state matrix (bed format)
```
>>> head atac_4cell.indexset_fun.txt
0_0_0_1	0	0	0	0
0_0_1_0	0	0	20	0
0_0_1_1	0	0	0	0
0_1_0_0	0	0	0	0
0_1_0_1	0	20	0	20
0_1_1_0	0	20	12	0
0_1_1_1	0	11	11	0
1_0_0_0	20	0	0	0
1_0_0_1	20	0	0	12
1_0_1_0	20	0	25	0

```

##### Index functional state matrix (bed format)
```
>>> head atac_4cell.fun.txt
chr1_13592001_13592161	0_0_0_1	12	4	0	12
chr1_6975366_6975635	0_0_0_1	0	0	0	0
chr1_7053436_7053652	0_0_0_1	20	0	0	20
chr1_13119493_13119701	0_0_0_1	0	0	0	0
chr1_7109537_7109689	0_0_0_1	0	4	4	11
chr1_13050969_13051145	0_0_0_1	0	0	0	0
chr1_16563017_16563247	0_0_0_1	0	0	0	20
chr1_13125691_13125919	0_0_0_1	20	20	20	20
chr1_12985993_12986340	0_0_0_1	0	5	10	20
chr1_7589470_7589648	0_0_0_1	0	0	0	0

```






