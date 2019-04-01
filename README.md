<p align="center"><img width=80% src="https://github.com/compbiomed/animalcules/blob/master/inst/shiny/www/animalcules.jpg"></p>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[![Travis build status](https://travis-ci.org/compbiomed/animalcules.svg?branch=master)](https://travis-ci.org/compbiomed/animalcules)
[![](https://img.shields.io/github/last-commit/compbiomed/animalcules.svg)](https://github.com/compbiomed/animalcules/commits/master)
[![](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)

Table of Contents
=================

   * [Table of Contents](#table-of-contents)
      * [What does animalcules do?](#what-does-animalcules-do)
      * [Installation](#installation)
      * [Run animalcules](#run-animalcules)
      * [Docs for command line](#docs-for-command-line)
      * [Docs for shiny app](#docs-for-shiny-app)
          * [Tab 1: Upload](#tab-1-upload)
               * [Example Data](#example-data)
               * [Count File](#count-file)
               * [Pathoscope File](#pathoscope-file)
               * [animalcules-id file](#animalcules-id-file)
               * [animalcules file](#animalcules-file)
          * [Tab 2: Summary and Filter](#tab-2-summary-and-filter)
               * [Summary Plots](#summary-plots)
               * [Categorize](#categorize)
          * [Tab 3: Abundance](#tab-3-abundance)
               * [Relative Abundance Stacked Bar Plot](#relative-abundance-stacked-bar-plot)
               * [Relative Abundance Heatmap](#relative-abundance-heatmap)
               * [Relative Abundance Boxplot](#relative-abundance-boxplot)
          * [Tab 4: Diversity](#tab-4-diversity)
               * [Alpha Diversity](#alpha-diversity)
               * [Beta Diversity Heatmap](#beta-diversity-heatmap)
               * [Beta Diversity Statistical Test](#beta-diversity-statistical-test)
          * [Tab 5: Dimension Reduction](#tab-5-dimension-reduction)
               * [PCA](#pca)
               * [PCoA](#pcoa)
               * [t-SNE](#t-sne)
          * [Tab 6: Differential Analysis](#tab-6-differential-analysis)
               * [Run Differential Analysis](#run-differential-analysis)
          * [Tab 7: Biomarker](#tab-7-biomarker)
               * [Run Biomarker](#run-biomarker)
               * [Importance Plot](#importance-plot)
               * [CV ROC Plot](#cv-roc-plot)

## What does animalcules do?

**R shiny app for interactive microbiome analysis**

animalcules is an R package for utilizing up-to-date data analytics, visualization methods, and machine learning models to provide users an easy-to-use interactive microbiome analysis framework. It can be used as a standalone software package or users can explore their data with the accompanying interactive R Shiny application. 

Traditional microbiome analysis such as alpha/beta diversity and differential abundance analysis are enhanced, while new methods like biomarker identification are introduced by animalcules. Powerful interactive and dynamic figures generated by animalcules enable users to understand their data better and discover new insights. 


## Installation

* Install from Bioconductor(not yet!): 

``` r
if (!requireNamespace("BiocManager", quietly=TRUE))
  install.packages("BiocManager")
BiocManager::install("animalcules")

```

* Install from github:
Note: Install devtools first if you haven't installed it yet. 

``` r
# install.packages("devtools")
devtools::install_github("compbiomed/animalcules")
```

## Run animalcules


``` r
library(animalcules)
run_animalcules()
```

## Docs for command line

Please check the documents for command line based animalcules in the [animalcules vignette](https://bioconductor.org/packages/release/bioc/html/animalcules.html) at Bioconductor.


## Docs for shiny app

### Tab 1: Upload

##### Example Data

There are two example datasets available in animalcules: a synthetic toy dataset (already loaded) containing 50 samples and a real TB dataset containing 30 samples. Users could use any dataset to try all functions and features in animalcules.

Instructions: 
* Use the pulldown menu to select the example dataset.
* Click the "Upload" button.

Running time: < 0.5s

<img src="https://github.com/compbiomed/materials/blob/master/animalcules/fig_030.png" width="400">


##### Count File

Both 16s and metagenomics generated data are supported here. The three required files are:

* Counts file: each row is a species/OTU, each column is a sample name.
* Taxonomy file: each row is a species/OTU, each column is a taxonomy level.
* Annotation file: each row is a sample name, each column is a variable/feature name.

Make sure:
* The sample names in the counts file agree with the one in annotation file.
* The microbe names in the counts file agree with the ones in the taxonomy file. 
* All three files have the same file separator / same file type (e.g. csv).

Instructions: 
* Click the "Browse..." button to upload required three files.
* Input which column in the annotation file is the sample name (default is 1).
* Check if the annotation file has header (default is TRUE).
* Select the separator (default is comma AKA .csv file).
* Click the button "Upload". 

Note: 
Each uploaded table will show up in the right panel. 

Running time: < 1s

<img src="https://github.com/compbiomed/materials/blob/master/animalcules/fig_031.png" width="300">

##### Pathoscope File

To analyze pathoscope outputs, users need to upload pathoscope reports (use browser for multiple reports upload), as well as an annotation file containing metadata for each sample. Note that the sample name in the annotation file must match the non-suffix part of the pathoscope file name. For example, one pathoscope report filename is: "sample_011-sam-report.tsv", then the corresponding sample name in the annotation file must be: "sample_011". 

Instructions: 
* Click the "Browse..." button to upload required files.
* Specify the pathoscope report file suffix (default is -sam-report.tsv).
* Input which column in the annotation file is the sample name (default is 1).
* Check if the annotation file has header (default is TRUE).
* Select the separator (default is Tab AKA .tsv file).
* Click the button "Upload". 

Also, make sure to provide the correct column number for sample name in the annotation file, as well as the annotation file separator (tab, comma or semicolon).

Note: 
One example pathoscope eport table and the annotation table will show up in the right panel. 

Running time:
* Test dataset A with 30 samples: 10.8s
* Test dataset B with 587 samples: 22.1s

<img src="https://github.com/compbiomed/materials/blob/master/animalcules/fig_032.png" width="300">

##### animalcules-id file

animalcules-id is a separate R pipeline that generates pathoscope-like outputs from fastq files. The required input is the animalcules-id generated .rds file. Here users could choose either EM count assay or Best hit assay. 

Running time: < 1s

<img src="https://github.com/compbiomed/materials/blob/master/animalcules/fig_033.png" width="400">

##### animalcules file

In animalcules, users could choose to save their dataset to a .rds file in the Tab 2 (Summary and Filter). Later, users could load this saved dataset by uploading the .rds file to animalcules easily via this animalcules file upload option.

Running time: < 0.5s

<img src="https://github.com/compbiomed/materials/blob/master/animalcules/fig_034.png" width="400">

### Tab 2: Summary and Filter

##### Summary Plots

One type of summarization plot returns either a box plot or pie chart for continous or categorical data respectively while another type returns returns either a density plot or bar plot for continous or categorical data respectively.

![](https://github.com/compbiomed/materials/blob/master/animalcules/fig_042.png)

##### Categorize

It is often necessary to bin continuous data into categories when performing analyses that require categorical input. To help ease this process, users can automatically categorize categorical data and provide custom bin breaks and labels in doing so.

![](https://github.com/compbiomed/materials/blob/master/animalcules/fig_043.png)

### Tab 3: Abundance

##### Relative Abundance Stacked Bar Plot

The stacked bar plots are used to visualize the relative abundance of microbes at a given taxonomical level in each sample represented as a single bar.

![](https://github.com/compbiomed/materials/blob/master/animalcules/fig_047.png)

##### Relative Abundance Heatmap

The heatmap represents a sample by organisms matrix that can be visualized at different taxonomic levels.

![](https://github.com/compbiomed/materials/blob/master/animalcules/fig_048.png)

##### Relative Abundance Boxplot

The boxplot visualization allows users to compare the abundance of one or more organisms at multiple taxonomical levels between categorical attributes.

![](https://github.com/compbiomed/materials/blob/master/animalcules/fig_049.png)

### Tab 4: Diversity

##### Alpha Diversity

Users could visualize the alpha diversity boxplot comparing different levels within a selected condition by selecting taxonomy levels and target condition. In Advanced options, users could choose different alpha diversity metrics including Shannon, Inverse Simpson and Gini Simpson. 

The statistical test will be performed between levels in the selected target condition. Multiple statistical test methods will be applied automatically, including T-test, Kruskal-Wallis rank sum test, and Wilcoxon rank sum test. Test p-values will be showed in the result table.

Instructions:
* Select taxonomy level in the menu (default is genus).
* Select the target variable for alpha diversity comparison.
* (Optional) Select alpha diversity metrics.
* Click the button "Run"

Running time: < 1s

![](https://github.com/compbiomed/materials/blob/master/animalcules/fig_035.png)

##### Beta Diversity Heatmap

Users could visualize the beta diversity by selecting taxonomy levels, sample color condition. Samples could also be sorted by the selected condition. In Advanced options, users could choose different beta diversity metrics including Bray-curtis or Jaccard. 

Instructions:
* Select taxonomy level in the menu (default is genus).
* Select the target variable for beta diversity comparison.
* Select if samples will be sorted by the selected variable (default: no sorting).
* (Optional) Select beta diversity metrics.
* Click the button "Plot Heatmap"


Running time: < 1s

![](https://github.com/compbiomed/materials/blob/master/animalcules/fig_036.png)

##### Beta Diversity Statistical Test

To check if there is significant beta diversity difference existing between two communities, users could also perform statistical test like PERMANOVA test, Kruskal-Wallis rank sum test, and Wilcoxon rank sum test. Note that the left panel options apply to both beta diversity heatmap and statistical test. Test p-value will be showed in the "Pr(>F)" column from the result table.

Instructions:
* Click the tab "Boxplot" in the right panel next to the tab "Heatmap"
* Select the test type (default is PERMANOVA). 
* Select the target variable.
* (Optional) Select the number of permutations if doing PERMANOVA. 
* Click the button "Run"


![](https://github.com/compbiomed/materials/blob/master/animalcules/fig_037.png)

### Tab 5: Dimension Reduction

##### PCA

A wrapper for conduction 2D and 3D Principal Component Analysis.

![](https://github.com/compbiomed/materials/blob/master/animalcules/fig_044.png)

##### PCoA

A wrapper for conduction 2D and 3D Principal Coordinate Analysis.

![](https://github.com/compbiomed/materials/blob/master/animalcules/fig_045.png)

##### t-SNE

A wrapper for conduction 2D and 3D t-distributed stochastic neighbor embedding.

![](https://github.com/compbiomed/materials/blob/master/animalcules/fig_046.png)

### Tab 6: Differential Analysis

##### Run Differential Analysis

To identify key microbes for a specific variable, users need to specify the taxonomy level and target variable (condition). In the Advanced Options, users could also add covariates to the linear model, add a minimum count cut-off (all features with average read number less than this cut-off will be filtered), and a adjusted p-value cut-off.

After click the "Run" button, users would see a differential abundance analysis output table on the right-hand side. For categorical variables in DESeq2 method, we show the feature name, adjusted p-value, original p-value, log2 fold change, number of samples for each class, feature prevalance, and group size adjusted fold change. For numeric variables in DESeq2 method, number of samples for each class and group size adjusted fold change won't show up. For limma method, only adjusted p-value and original p-value will show up.

Instructions:
* Select either tab "DESeq2" or "limma" for the analysis (default is DESeq2).
* Select taxonomy level in the menu (default is genus).
* Select the target variable for differential abundance analysis.
* (Optional) Select covariates.
* (Optional) Select minimum total count cuf-off for microbes (default 500).
* (Optional) Select adjusted p-value threshold (default 0.8).
* Click the button "Run"

Running time: 
* Test dataset with 30 samples and 427 microbes: 2.48s
* Test dataset with 587 samples and 203 microbes: 46.59s

![](https://github.com/compbiomed/materials/blob/master/animalcules/fig_038.png)


### Tab 7: Biomarker

##### Run Biomarker

To identify biomarkers for a specific binary classification problem, users need to specify the taxonomy level and target variable. In the Advanced Options, users could also specify the number of CV repeats, number of CV folds, and top biomarker proportion. For example, with a 3-repeats 3-fold cross validation, animalcules will randomly split the dataset into 3 fold and run CV, then this procedure is repeated 3 times (each time has different random data split). The top biomarker proportion defines the threshold for selecting biomarkers: animalcules will generate an classification model based importance score for each microbe/feature, and will choose the top 20% (suppose the proportion is 0.2 as default) features as the biomarkers.

Also, users could choose binary classification models including logistic regression and random forest. After clicking the button "Run", the biomarker list will shouw up at the right-hand side.

Note:
* If the dataset is too small or unbalanced, cross-validation can't be applied. You will see error messages like: NA/NaN/Inf in foreign function call.
* The target variable can not contain any special characters, otherwise there will be an error.

Instructions:
* Select taxonomy level in the menu (default: genus).
* Select the target variable for biomarker identification.
* (Optional) Select number of CV folds (default: 3).
* (Optional) Select number of CV repeats (default: 3).
* (Optional) Select top biomarker proportion based on importance score (default: 0.2, representing 20%).
* (Optional) Select model (default: logistic regression).
* Click the button "Run"

Running time: 
* Test dataset with 30 samples and 427 microbes: 8.5s
* Test dataset with 587 samples and 203 microbes: 32.4s

![](https://github.com/compbiomed/materials/blob/master/animalcules/fig_039.png)

##### Importance Plot

Ranked feature importance score plot for the identified biomarkers is showed here. The higher score is, the more important this feature (species, genus, ..) is regarding the prediction power.

![](https://github.com/compbiomed/materials/blob/master/animalcules/fig_040.png)


##### CV ROC Plot

The identified biomarkers were used to re-train the model via a cross-validation, and ROC plot is showed automatically in this subtab. 

![](https://github.com/compbiomed/materials/blob/master/animalcules/fig_041.png)
