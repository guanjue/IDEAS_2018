# IDEAS_2018
### Advanced sequencing technologies have generated a plethora of data for many chromatin marks in multiple tissues and cell types, yet there is lack of a generalized tool for optimal utility of those data. A major challenge is to quantitatively model the epigenetic dynamics across both the genome and many cell types for understanding their impacts on differential gene regulation and disease. We introduce IDEAS, an integrative and discriminative epigenome annotation system, for jointly characterizing epigenetic landscapes in many cell types and detecting differential regulatory regions. A key distinction between our method and existing state-of-the-art algorithms is that IDEAS integrates epigenomes of many cell types simultaneously in a way that preserves the position-dependent and cell type-specific information at fine scales, thereby greatly improving segmentation accuracy and producing comparable annotations across cell types.

## Example of IDEAS output: 
### Hematopoietic cell differentiation in VISION (ValIdated Systematic IntegratiON of hematopoietic epigenomes) project
#### Figure 1
<img src="https://github.com/guanjue/snapshot/blob/master/test_data/example/f1.png" width="800"/>

##### The heatmap of index-sets. (a) The heatmap of index-set colored by the average ATAC-seq signal in each cell type. (b) The heatmap of index-set colored by the most frequent functional annotation in each cell type. (c) The density plot of the number of genomic region covered by the index-set. (d) The color code and epigenetic composition of functional annotation used in (b).

#### Figure 2
<img src="https://github.com/guanjue/snapshot/blob/master/test_data/example/f2.png" width="800"/>

##### The data visualization for index-set-149 and corresponding GO analysis and MEME-ChIP TF binding motif analysis. (a) The hematopoietic cell differentiation tree colored by the average ATAC-seq signal in each cell type of the index-set-149. The violin plot represents the distribution of ATAC-seq signal in each cell type of the index-set-149 is in below.  (b) The same cell differentiation tree colored by the most frequent functional annotation in each cell type of the index-set-149. The two most frequence functional annotation in erythroblasts lineage. The bar plot based on the proportion of each functional annotation in each cell type of the index-set-149 is below the cell differentiation tree. (c) The index-set-149 relevant GO term. (d) The index-set-149 significantly enriched TF binding motif from MEME-ChIP analysis.


## Install Snapshot
#### (1) clone the github repository 
#### (2) run the INSTALL.sh command
```
git clone https://github.com/guanjue/snapshot.git
cd snapshot
bash INSTALL.sh
```

## Input data
##### The cell type peak binary label file list: 1st column is the foldername and the filename in input folder; 2nd column is the cell type label in output figures
###### The peak binary label of each cell type in bed format is in the 'atac_pk/' folder
```
peak_list.txt
>>> head peak_list.txt 
atac_pk/LSK.pk.bed	LSK
atac_pk/CMP.pk.bed	CMP
atac_pk/MEP.pk.bed	MEP
atac_pk/GMP.pk.bed	GMP
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

##### The cell type functional state file list: 1st column is the foldername and the filename in input folder; 2nd column is the cell type label in output figures
###### The functional state label of each cell type in bed format is in the 'function_label/' folder
```
function_list.txt
>>> head function_list.txt 
function_label/LSK.ideas.bed	LSK
function_label/CMP.ideas.bed	CMP
function_label/MEP.ideas.bed	MEP
function_label/GMP.ideas.bed	GMP
```

##### The cell type differentiation tree: Each row represent one edge in the ell type differentiation tree. The 1st cell type is the progenitor cell type and the 2nd cell type is the differentiated cell type
```
cd_tree.txt 
head cd_tree.txt
LSK,CMP
CMP,MEP
CMP,GMP
```

##### The functional state color list
```
>>> head function_color_list.txt
36	35	194,7,153	250,151,3
35	34	250,151,3	136,53,241
34	33	136,53,241	197,151,0
33	32	197,151,0	138,177,89
32	31	138,177,89	191,0,84
31	30	191,0,84	176,0,93
30	29	176,0,93	252,48,50
29	28	252,48,50	0,0,172
28	27	0,0,172	219,8,0
27	26	219,8,0	241,198,171
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
##### (2) use 'runall.sh' script to run Snapshot
```
bash runall.sh
```
##### (3) for graphical user interface (GUI) version, see:
https://github.com/guanjue/snapshot/blob/master/gui_manual.md


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






