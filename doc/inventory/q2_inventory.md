# CORE PLUGINS

Comes with the standard installation of QIIME 2.

All of these commands come with the following CLI functionality:

```
      Usage: qiime PLUGIN [OPTIONS] COMMAND [ARGS]...

    Options:
      --version
      --citations
      --help
```

## [alignment](https://github.com/qiime2/q2-alignment)

__Description:__ This QIIME 2 plugin provides support for generating and manipulating sequence alignments.

### Commands

#### Methods

__[mafft](https://docs.qiime2.org/2020.2/plugins/available/alignment/mafft/)__ De novo multiple sequence alignment with MAFFT

__[mask](https://docs.qiime2.org/2020.2/plugins/available/alignment/mask/)__ Positional conservation and gap filtering


## [composition](https://github.com/qiime2/q2-composition)

__Description:__ This QIIME 2 plugin supports methods for compositional data analysis.

### Commands

#### Methods

__[add-pseudocount](https://docs.qiime2.org/2020.2/plugins/available/composition/add-pseudocount/)__ Add pseudocount to table

#### Visualizers

__[ancom](https://docs.qiime2.org/2020.2/plugins/available/composition/ancom/)__ Apply ANCOM to identify features that differ in abundance


## [cutadapt](https://github.com/qiime2/q2-cutadapt)

__Description:__ This QIIME 2 plugin uses cutadapt to work with adapters (e.g. barcodes, primers) in sequence data.

### Commands

#### Methods

__[demux-paired](https://docs.qiime2.org/2020.2/plugins/available/cutadapt/demux-paired/)__ Demultiplex paired-end sequence data with barcodes in-sequence

__[demux-single](https://docs.qiime2.org/2020.2/plugins/available/cutadapt/demux-single/)__ Demultiplex single-end sequence data with barcodes in-sequence

__[trim-paired](https://docs.qiime2.org/2020.2/plugins/available/cutadapt/trim-paired/)__ Find and remove adapters in demultiplexed paired-end sequences

__[trim-single](https://docs.qiime2.org/2020.2/plugins/available/cutadapt/trim-single/)__ Find and remove adapters in demultiplexed single-end sequences


## [dada2](http://benjjneb.github.io/dada2/)

__Description:__ This QIIME 2 plugin wraps DADA2 and supports sequence quality control for single-end and paired-end reads using the DADA2 R library.

### Commands

#### Methods

__[denoise-paired](https://docs.qiime2.org/2020.2/plugins/available/dada2/denoise-paired/)__ Denoise and dereplicate paired-end sequences

__[denoise-pyro](https://docs.qiime2.org/2020.2/plugins/available/dada2/denoise-pyro/)__ Denoise and dereplicate single-end pyrosequences

__[denoise-single](https://docs.qiime2.org/2020.2/plugins/available/dada2/denoise-single/)__ Denoise and dereplicate single-end sequences


## [deblur](https://github.com/biocore/deblur)

__Description:__ This QIIME 2 plugin wraps the Deblur software for performing sequence quality control.

### Commands

#### Methods

__[denoise-16S](https://docs.qiime2.org/2020.2/plugins/available/deblur/denoise-16S/)__ Deblur sequences using a 16S positive filter

__[denoise-other](https://docs.qiime2.org/2020.2/plugins/available/deblur/denoise-other/)__ Deblur sequences using a user-specified positive filter

#### Visualizers

__[visualize-stats](https://docs.qiime2.org/2020.2/plugins/available/deblur/visualize-stats/)__ Visualize Deblur stats per sample


## [demux](https://github.com/qiime2/q2-demux)

__Description:__ This QIIME 2 plugin supports demultiplexing of single-end and paired-end sequence reads and visualization of sequence quality information.

### Commands

#### Methods

__[emp-paired](https://docs.qiime2.org/2020.2/plugins/available/demux/emp-paired/)__ Demultiplex paired-end sequence data generated with the EMP protocol

__[emp-single](https://docs.qiime2.org/2020.2/plugins/available/demux/emp-single/)__ Demultiplex sequence data generated with the EMP protocol

__[filter-samples](https://docs.qiime2.org/2020.2/plugins/available/demux/filter-samples/)__ Filter samples out of demultiplexed data

__[subsample-paired](https://docs.qiime2.org/2020.2/plugins/available/demux/subsample-paired/)__ Subsample paired-end sequences without replacement

__[subsample-single](https://docs.qiime2.org/2020.2/plugins/available/demux/subsample-single/)__ Subsample single-end sequences without replacement

#### Visualizers

__[summarize](https://docs.qiime2.org/2020.2/plugins/available/demux/summarize/)__ Summarize counts per sample


## [diversity](https://github.com/qiime2/q2-diversity)

__Description:__ This QIIME 2 plugin supports metrics for calculating and exploring community alpha and beta diversity through statistics and visualizations in the context of sample metadata.

### Commands

#### Pipelines

__[beta-correlation](https://docs.qiime2.org/2020.2/plugins/available/diversity/beta-correlation/)__ Beta diversity correlation

__[core-metrics](https://docs.qiime2.org/2020.2/plugins/available/diversity/core-metrics/)__ Core diversity metrics (non-phylogenetic)

__[core-metrics-phylogenetic](https://docs.qiime2.org/2020.2/plugins/available/diversity/core-metrics-phylogenetic/)__ Core diversity metrics (phylogenetic and non-phylogenetic)

#### Methods

__[alpha](https://docs.qiime2.org/2020.2/plugins/available/diversity/alpha/)__ Alpha diversity

__[alpha-phylogenetic](https://docs.qiime2.org/2020.2/plugins/available/diversity/alpha-phylogenetic/)__ Alpha diversity (phylogenetic)

__[alpha-phylogenetic-alt](https://docs.qiime2.org/2020.2/plugins/available/diversity/alpha-phylogenetic-alt/)__ Alpha diversity (phylogenetic) - alternative implementation

__[beta](https://docs.qiime2.org/2020.2/plugins/available/diversity/beta/)__ Beta diversity

__[beta-phylogenetic](https://docs.qiime2.org/2020.2/plugins/available/diversity/beta-phylogenetic/)__ Beta diversity (phylogenetic)

__[filter-distance-matrix](https://docs.qiime2.org/2020.2/plugins/available/diversity/filter-distance-matrix/)__ Filter samples from a distance matrix

__[pcoa](https://docs.qiime2.org/2020.2/plugins/available/diversity/pcoa/)__ Principal Coordinate Analysis

__[pcoa-biplot](https://docs.qiime2.org/2020.2/plugins/available/diversity/pcoa-biplot/)__ Principal Coordinate Analysis Biplot

__[procrustes-analysis](https://docs.qiime2.org/2020.2/plugins/available/diversity/procrustes-analysis/)__ Procrustes Analysis

#### Visualizers

__[adonis](https://docs.qiime2.org/2020.2/plugins/available/diversity/adonis/)__ adonis PERMANOVA test for beta group significance

__[alpha-correlation](https://docs.qiime2.org/2020.2/plugins/available/diversity/alpha-correlation/)__ Alpha diversity correlation

__[alpha-group-significance](https://docs.qiime2.org/2020.2/plugins/available/diversity/alpha-group-significance/)__ Alpha diversity comparisons

__[alpha-rarefaction](https://docs.qiime2.org/2020.2/plugins/available/diversity/alpha-rarefaction/)__ Alpha rarefaction curves

__[beta-group-significance](https://docs.qiime2.org/2020.2/plugins/available/diversity/beta-group-significance/)__ Beta diversity group significance

__[beta-rarefaction](https://docs.qiime2.org/2020.2/plugins/available/diversity/beta-rarefaction/)__ Beta diversity rarefaction

__[bioenv](https://docs.qiime2.org/2020.2/plugins/available/diversity/bioenv/)__ bioenv

__[mantel](https://docs.qiime2.org/2020.2/plugins/available/diversity/mantel/)__ Apply the Mantel test to two distance matrices


## [emperor](http://emperor.microbio.me)

__Description:__ This QIIME 2 plugin wraps Emperor and supports interactive visualization of ordination plots.

### Commands

#### Visualizers

__[biplot](https://docs.qiime2.org/2020.2/plugins/available/emperor/biplot/)__ Visualize and Interact with Principal Coordinates Analysis Biplot

__[plot](https://docs.qiime2.org/2020.2/plugins/available/emperor/plot/)__ Visualize and Interact with Principal Coordinates Analysis Plots

__[procrustes-plot](https://docs.qiime2.org/2020.2/plugins/available/emperor/procrustes-plot/)__ Visualize and Interact with a procrustes plot


## [feature-classifier](https://github.com/qiime2/q2-feature-classifier)

__Description:__ This QIIME 2 plugin supports taxonomic classification of features using a variety of methods, including Naive Bayes, vsearch, and BLAST+.

### Commands

#### Pipelines

__[classify-hybrid-vsearch-sklearn](https://docs.qiime2.org/2020.2/plugins/available/feature-classifier/classify-hybrid-vsearch-sklearn/)__ ALPHA Hybrid classifier: VSEARCH exact match + sklearn classifier

#### Methods

__[classify-consensus-blast](https://docs.qiime2.org/2020.2/plugins/available/feature-classifier/classify-consensus-blast/)__ BLAST+ consensus taxonomy classifier

__[classify-consensus-vsearch](https://docs.qiime2.org/2020.2/plugins/available/feature-classifier/classify-consensus-vsearch/)__ VSEARCH-based consensus taxonomy classifier

__[classify-sklearn](https://docs.qiime2.org/2020.2/plugins/available/feature-classifier/classify-sklearn/)__ Pre-fitted sklearn-based taxonomy classifier

__[extract-reads](https://docs.qiime2.org/2020.2/plugins/available/feature-classifier/extract-reads/)__ Extract reads from reference

__[fit-classifier-naive-bayes](https://docs.qiime2.org/2020.2/plugins/available/feature-classifier/fit-classifier-naive-bayes/)__ Train the naive_bayes classifier

__[fit-classifier-sklearn](https://docs.qiime2.org/2020.2/plugins/available/feature-classifier/fit-classifier-sklearn/)__ Train an almost arbitrary scikit-learn classifier


## [feature-table](https://github.com/qiime2/q2-feature-table)

__Description:__ This is a QIIME 2 plugin supporting operations on sample by feature tables, such as filtering, merging, and transforming tables.

### Commands

#### Methods

__[filter-features](https://docs.qiime2.org/2020.2/plugins/available/feature-table/filter-features/)__ Filter features from table

__[filter-samples](https://docs.qiime2.org/2020.2/plugins/available/feature-table/filter-samples/)__ Filter samples from table

__[filter-seqs](https://docs.qiime2.org/2020.2/plugins/available/feature-table/filter-seqs/)__ Filter features from sequences

__[group](https://docs.qiime2.org/2020.2/plugins/available/feature-table/group/)__ Group samples or features by a metadata column

__[merge](https://docs.qiime2.org/2020.2/plugins/available/feature-table/merge/)__ Combine multiple tables

__[merge-seqs](https://docs.qiime2.org/2020.2/plugins/available/feature-table/merge-seqs/)__ Combine collections of feature sequences

__[merge-taxa](https://docs.qiime2.org/2020.2/plugins/available/feature-table/merge-taxa/)__ Combine collections of feature taxonomies

__[presence-absence](https://docs.qiime2.org/2020.2/plugins/available/feature-table/presence-absence/)__ Convert to presence/absence

__[rarefy](https://docs.qiime2.org/2020.2/plugins/available/feature-table/rarefy/)__ Rarefy table

__[relative-frequency](https://docs.qiime2.org/2020.2/plugins/available/feature-table/relative-frequency/)__ Convert to relative frequencies

__[subsample](https://docs.qiime2.org/2020.2/plugins/available/feature-table/subsample/)__ Subsample table

__[transpose](https://docs.qiime2.org/2020.2/plugins/available/feature-table/transpose/)__ Transpose a feature table

#### Visualizers

__[core-features](https://docs.qiime2.org/2020.2/plugins/available/feature-table/core-features/)__ Identify core features in table

__[heatmap](https://docs.qiime2.org/2020.2/plugins/available/feature-table/heatmap/)__ Generate a heatmap representation of a feature table

__[summarize](https://docs.qiime2.org/2020.2/plugins/available/feature-table/summarize/)__ Summarize table

__[tabulate-seqs](https://docs.qiime2.org/2020.2/plugins/available/feature-table/tabulate-seqs/)__ View sequence associated with each feature


## [fragment-insertion](https://github.com/qiime2/q2-fragment-insertion)

__Description:__ This QIIME 2 plugin can be utilized to extend phylogenies.

### Commands

#### Methods

__[classify-otus-experimental](https://docs.qiime2.org/2020.2/plugins/available/fragment-insertion/classify-otus-experimental/)__ Experimental: Obtain taxonomic lineages, by finding closest OTU in reference phylogeny

__[filter-features](https://docs.qiime2.org/2020.2/plugins/available/fragment-insertion/filter-features/)__ Filter fragments in tree from table

__[sepp](https://docs.qiime2.org/2020.2/plugins/available/fragment-insertion/sepp/)__ Insert fragment sequences using SEPP into reference phylogenies


## [gneiss](https://biocore.github.io/gneiss/)

__Description:__ This is a QIIME 2 plugin supporting statistical models on feature tables and metadata using balances.

### Commands

#### Methods

__[assign-ids](https://docs.qiime2.org/2020.2/plugins/available/gneiss/assign-ids/)__ Assigns ids on internal nodes in the tree, and makes sure that they are consistent with the table columns

__[correlation-clustering](https://docs.qiime2.org/2020.2/plugins/available/gneiss/correlation-clustering/)__ Hierarchical clustering using feature correlation

__[gradient-clustering](https://docs.qiime2.org/2020.2/plugins/available/gneiss/gradient-clustering/)__ Hierarchical clustering using gradient information

__[ilr-hierarchical](https://docs.qiime2.org/2020.2/plugins/available/gneiss/ilr-hierarchical/)__ Isometric Log-ratio Transform applied to a hierarchical clustering

__[ilr-phylogenetic](https://docs.qiime2.org/2020.2/plugins/available/gneiss/ilr-phylogenetic/)__ Isometric Log-ratio Transform applied to a phylogenetic tree

#### Visualizers

__[dendrogram-heatmap](https://docs.qiime2.org/2020.2/plugins/available/gneiss/dendrogram-heatmap/)__ Dendrogram heatmap


## [longitudinal](https://github.com/qiime2/q2-longitudinal)

__Description:__ This QIIME 2 plugin supports methods for analysis of time series data, involving either paired sample comparisons or longitudinal study designs.

### Commands

#### Pipelines

__[feature-volatility](https://docs.qiime2.org/2020.2/plugins/available/longitudinal/feature-volatility/)__ Feature volatility analysis

__[maturity-index](https://docs.qiime2.org/2020.2/plugins/available/longitudinal/maturity-index/)__ Microbial maturity index prediction

#### Methods

__[first-differences](https://docs.qiime2.org/2020.2/plugins/available/longitudinal/first-differences/)__ Compute first differences or difference from baseline between sequential states

__[first-distances](https://docs.qiime2.org/2020.2/plugins/available/longitudinal/first-distances/)__ Compute first distances or distance from baseline between sequential states

__[nmit](https://docs.qiime2.org/2020.2/plugins/available/longitudinal/nmit/)__ Nonparametric microbial interdependence test

#### Visualizers

__[anova](https://docs.qiime2.org/2020.2/plugins/available/longitudinal/anova/)__ ANOVA test

__[linear-mixed-effects](https://docs.qiime2.org/2020.2/plugins/available/longitudinal/linear-mixed-effects/)__ Linear mixed effects modeling

__[pairwise-differences](https://docs.qiime2.org/2020.2/plugins/available/longitudinal/pairwise-differences/)__ Paired difference testing and boxplots

__[pairwise-distances](https://docs.qiime2.org/2020.2/plugins/available/longitudinal/pairwise-distances/)__ Paired pairwise distance testing and boxplots

__[plot-feature-volatility](https://docs.qiime2.org/2020.2/plugins/available/longitudinal/plot-feature-volatility/)__ Plot longitudinal feature volatility and importances

__[volatility](https://docs.qiime2.org/2020.2/plugins/available/longitudinal/volatility/)__ Generate interactive volatility plot


## [metadata](https://github.com/qiime2/q2-metadata)

__Description:__ This QIIME 2 plugin provides functionality for working with and visualizing Metadata.

### Commands

#### Methods

__[distance-matrix](https://docs.qiime2.org/2020.2/plugins/available/metadata/distance-matrix/)__ Create a distance matrix from a numeric Metadata column

#### Visualizers

__[tabulate](https://docs.qiime2.org/2020.2/plugins/available/metadata/tabulate/)__ Interactively explore Metadata in an HTML table


## [phylogeny](https://github.com/qiime2/q2-phylogeny)

__Description:__ This QIIME 2 plugin supports generating and manipulating phylogenetic trees.

### Commands

#### Pipelines

__[align-to-tree-mafft-fasttree](https://docs.qiime2.org/2020.2/plugins/available/phylogeny/align-to-tree-mafft-fasttree/)__ Build a phylogenetic tree using fasttree and mafft alignment

__[align-to-tree-mafft-iqtree](https://docs.qiime2.org/2020.2/plugins/available/phylogeny/align-to-tree-mafft-iqtree/)__ Build a phylogenetic tree using iqtree and mafft alignment

__[align-to-tree-mafft-raxml](https://docs.qiime2.org/2020.2/plugins/available/phylogeny/align-to-tree-mafft-raxml/)__ Build a phylogenetic tree using raxml and mafft alignment

#### Methods

__[fasttree](https://docs.qiime2.org/2020.2/plugins/available/phylogeny/fasttree/)__ Construct a phylogenetic tree with FastTree

__[filter-table](https://docs.qiime2.org/2020.2/plugins/available/phylogeny/filter-table/)__ Remove features from table if they're not present in tree

__[iqtree](https://docs.qiime2.org/2020.2/plugins/available/phylogeny/iqtree/)__ Construct a phylogenetic tree with IQ-TREE

__[iqtree-ultrafast-bootstrap](https://docs.qiime2.org/2020.2/plugins/available/phylogeny/iqtree-ultrafast-bootstrap/)__ Construct a phylogenetic tree with IQ-TREE with bootstrap supports

__[midpoint-root](https://docs.qiime2.org/2020.2/plugins/available/phylogeny/midpoint-root/)__ Midpoint root an unrooted phylogenetic tree

__[raxml](https://docs.qiime2.org/2020.2/plugins/available/phylogeny/raxml/)__ Construct a phylogenetic tree with RAxML

__[raxml-rapid-bootstrap](https://docs.qiime2.org/2020.2/plugins/available/phylogeny/raxml-rapid-bootstrap/)__ Construct a phylogenetic tree with bootstrap supports using RAxML


## [quality-control](https://github.com/qiime2/q2-quality-control)

__Description:__ This QIIME 2 plugin supports methods for assessing and controlling the quality of feature and sequence data.

### Commands

#### Methods

__[exclude-seqs](https://docs.qiime2.org/2020.2/plugins/available/quality-control/exclude-seqs/)__ Exclude sequences by alignment

#### Visualizers

__[evaluate-composition](https://docs.qiime2.org/2020.2/plugins/available/quality-control/evaluate-composition/)__ Evaluate expected vs. observed taxonomic composition of samples

__[evaluate-seqs](https://docs.qiime2.org/2020.2/plugins/available/quality-control/evaluate-seqs/)__ Compare query (observed) vs. reference (expected) sequences

__[evaluate-taxonomy](https://docs.qiime2.org/2020.2/plugins/available/quality-control/evaluate-taxonomy/)__ Evaluate expected vs. observed taxonomic assignments


## [quality-filter](https://github.com/qiime2/q2-quality-filter)

__Description:__ This QIIME 2 plugin supports filtering and trimming of sequence reads based on PHRED scores and ambiguous nucleotide characters.

### Commands

#### Methods

__[q-score](https://docs.qiime2.org/2020.2/plugins/available/quality-filter/q-score/)__ Quality filter based on sequence quality scores

__[q-score-joined](https://docs.qiime2.org/2020.2/plugins/available/quality-filter/q-score-joined/)__ Quality filter based on joined sequence quality scores


## [sample-classifier](https://github.com/qiime2/q2-sample-classifier)

__Description:__ This QIIME 2 plugin supports methods for supervised classification and regression of sample metadata, and other supervised machine learning methods.

### Commands

#### Pipelines

__[classify-samples](https://docs.qiime2.org/2020.2/plugins/available/sample-classifier/classify-samples/)__ Train and test a cross-validated supervised learning classifier

__[classify-samples-from-dist](https://docs.qiime2.org/2020.2/plugins/available/sample-classifier/classify-samples-from-dist/)__ Run k-nearest-neighbors on a labeled distance matrix

__[heatmap](https://docs.qiime2.org/2020.2/plugins/available/sample-classifier/heatmap/)__ Generate heatmap of important features

__[metatable](https://docs.qiime2.org/2020.2/plugins/available/sample-classifier/metatable/)__ Convert (and merge) positive numeric metadata (in)to feature table

__[regress-samples](https://docs.qiime2.org/2020.2/plugins/available/sample-classifier/regress-samples/)__ Train and test a cross-validated supervised learning regressor

#### Methods

__[classify-samples-ncv](https://docs.qiime2.org/2020.2/plugins/available/sample-classifier/classify-samples-ncv/)__ Nested cross-validated supervised learning classifier

__[fit-classifier](https://docs.qiime2.org/2020.2/plugins/available/sample-classifier/fit-classifier/)__ Fit a supervised learning classifier

__[fit-regressor](https://docs.qiime2.org/2020.2/plugins/available/sample-classifier/fit-regressor/)__ Fit a supervised learning regressor

__[predict-classification](https://docs.qiime2.org/2020.2/plugins/available/sample-classifier/predict-classification/)__ Use trained classifier to predict target values for new samples

__[predict-regression](https://docs.qiime2.org/2020.2/plugins/available/sample-classifier/predict-regression/)__ Use trained regressor to predict target values for new samples

__[regress-samples-ncv](https://docs.qiime2.org/2020.2/plugins/available/sample-classifier/regress-samples-ncv/)__ Nested cross-validated supervised learning regressor

__[split-table](https://docs.qiime2.org/2020.2/plugins/available/sample-classifier/split-table/)__ Split a feature table into training and testing sets

#### Visualizers

__[confusion-matrix](https://docs.qiime2.org/2020.2/plugins/available/sample-classifier/confusion-matrix/)__ Make a confusion matrix from sample classifier predictions

__[scatterplot](https://docs.qiime2.org/2020.2/plugins/available/sample-classifier/scatterplot/)__ Make 2D scatterplot and linear regression of regressor predictions

__[summarize](https://docs.qiime2.org/2020.2/plugins/available/sample-classifier/summarize/)__ Summarize parameter and feature extraction information for a trained estimator


## [taxa](https://github.com/qiime2/q2-taxa)

__Description:__ This QIIME 2 plugin provides functionality for working with and visualizing taxonomic annotations of features.

### Commands

#### Methods

__[collapse](https://docs.qiime2.org/2020.2/plugins/available/taxa/collapse/)__ Collapse features by their taxonomy at the specified level

__[filter-seqs](https://docs.qiime2.org/2020.2/plugins/available/taxa/filter-seqs/)__ Taxonomy-based feature sequence filter

__[filter-table](https://docs.qiime2.org/2020.2/plugins/available/taxa/filter-table/)__ Taxonomy-based feature table filter

#### Visualizers

__[barplot](https://docs.qiime2.org/2020.2/plugins/available/taxa/barplot/)__ Visualize taxonomy with an interactive bar plot


## [vsearch](https://github.com/qiime2/q2-vsearch)

__Description:__ This plugin wraps the vsearch application, and provides methods for clustering and dereplicating features and sequences.

### Commands

#### Pipelines

__[cluster-features-open-reference](https://docs.qiime2.org/2020.2/plugins/available/vsearch/cluster-features-open-reference/)__ Open-reference clustering of features

#### Methods

__[cluster-features-closed-reference](https://docs.qiime2.org/2020.2/plugins/available/vsearch/cluster-features-closed-reference/)__ Closed-reference clustering of features

__[cluster-features-de-novo](https://docs.qiime2.org/2020.2/plugins/available/vsearch/cluster-features-de-novo/)__ De novo clustering of features

__[dereplicate-sequences](https://docs.qiime2.org/2020.2/plugins/available/vsearch/dereplicate-sequences/)__ Dereplicate sequences

__[join-pairs](https://docs.qiime2.org/2020.2/plugins/available/vsearch/join-pairs/)__ Join paired-end reads

__[uchime-denovo](https://docs.qiime2.org/2020.2/plugins/available/vsearch/uchime-denovo/)__ De novo chimera filtering with vsearch

__[uchime-ref](https://docs.qiime2.org/2020.2/plugins/available/vsearch/uchime-ref/)__ Reference-based chimera filtering with vsearch

<div style="page-break-after: always;"></div>

# COMMUNITY PLUGINS

Published by the QIIME 2 community, and not yet included as standard plugins. Further information found by following the included link.

After installing a plugin, refresh the QIIME 2 environment cache by running:

```
qiime dev refresh-cache
```

If correctly installed in the QIIME 2 environment, check installation(s) with:

```
qiime PLUGIN [--help]
```

## [decode](https://library.qiime2.org/plugins/deicode/19/)

__Description:__ A robust compositional PCA (via SVD) where zero values do not influence the resulting ordination. One of the benefits of using DEICODE is the ability to reveal salient inter-community niche feature importance in compositional biplots.

### Install

```
conda install -c conda-forge deicode
```


## [mmvec](https://library.qiime2.org/plugins/mmvec/20/)

__Description:__ A software package for learning microbe-metabolite interactions.

### Install

```
conda install mmvec -c conda-forge
```


## [aldex2](https://library.qiime2.org/plugins/q2-aldex2/24/)

__Description:__ Compositional differential abundance analysis. ALDEx2 provides a framework that encompasses essentially all high-throughput sequencing data types by modelling the data as a log-ratio transformed probability distribution rather than as counts.

### Install

```
conda install -c dgiguere q2-aldex2
```


## [breakaway](https://library.qiime2.org/plugins/q2-breakaway/9/)

__Description:__ Implements the latest and greatest estimates of richness, as well as the most commonly used estimates.

### Install

_Install dependencies:_

```
conda install \
  -c bioconda \
  -c conda-forge bioconductor-phyloseq \
  r-devtools \
  r-tibble \
  r-magrittr \
  r-dplyr \
  r-withr \
  r-testthat \
  r-praise \
  unzip

```

_Install plugin:_

```
pip install git+https://github.com/statdivlab/q2-breakaway.git
```

## [clawback](https://library.qiime2.org/plugins/q2-clawback/7/)

__Description:__ Assembles taxonomic weights to increase classification accuracy with q2-feature-classifier.

### Install

```
conda install -c kaehler -c conda-forge q2-clawback
```


## [coordinates](https://library.qiime2.org/plugins/q2-coordinates/18/)

__Description:__ A qiime2 plugin supporting methods for geographic mapping of qiime2 artifact data or metadata.

### Install

```
pip install pysal==2.0rc2
pip install https://github.com/nbokulich/q2-coordinates/archive/master.zip
```

_Map-drawing functions in q2-coordinates require you to install cartopy (distibuted under a LGPL-3.0 license):_

```
conda install -c conda-forge cartopy
```


## [dbotu](https://library.qiime2.org/plugins/q2-dbotu/4/)

__Description:__ QIIME 2 plugin for distribution-based clustering, which calls OTUs based on the similarity between their genetic sequences and their count distribution across samples.

### Install

```
conda install -c cduvallet -c conda-forge dbotu_q2
```


## [gcn-norm](https://library.qiime2.org/plugins/q2-gcn-norm/25/)

__Description:__ QIIME 2 plugin for normalizing sequences by 16S rRNA gene copy number (GCN) based on rrnDB database.

### Install

```
conda install -c jiungwenchen q2-gcn-norm
```


## [ili](https://library.qiime2.org/plugins/q2-ili/14/)

__Description:__ This plugin is wrapping [ili](https://github.com/MolecularCartography/ili).

### Install

```
git clone \
  --recurse-submodules https://github.com/biocore/q2-ili.git && \
  cd q2-ili
pip install .
```


## [itsxpress](https://library.qiime2.org/plugins/q2-itsxpress/8/)

__Description:__ ITSxpress trims the conserved flanking regions off of ITS sequences. ITSxpress is designed to support the calling of exact sequence variants rather than OTUs.

### Install

```
conda install -c bioconda itsxpress
pip install q2-itsxpress
```


## [metabolomics](https://library.qiime2.org/plugins/q2-metabolomics/10/)

__Description:__ A tool to import metabolomics data into qiime2 to perform analysis.

### Install

```
conda install -c mwang87 q2-metabolomics
```


## [metaphlan2](https://library.qiime2.org/plugins/q2-metaphlan2/12/)

__Description:__ MetaPhlAn is a computational tool for profiling the composition of microbial communities (Bacteria, Archaea, Eukaryotes, and Viruses) from metagenomic shotgun sequencing data with species-level resolution.

### Install

_This package is only available for older versions of QIIME 2, at the moment. Although, since MetaPhlAn3 just released, an updated version of this community plugin should be available in the near future._

```
conda install q2-metaphlan2 -c fasnicar -c bioconda
```


## [micom](https://library.qiime2.org/plugins/q2-micom/26/)

__Description:__ An interface between Qiime 2 and MICOM. It allows you to create and simulate metagenome-scale metabolic community models and to predict metabolic fluxes taking place in a microbial consortium. It can incorporate abundance and environmental data.

### Install

_Requires installation of CPLEX or Gurobi, which requires registration. Please see installation guide in the header link._


## [perc-norm](https://library.qiime2.org/plugins/q2-perc-norm/5/)

__Description:__ QIIME 2 plugin for percentile normalization to correct for batch effects in microbiome case-control studies.

### Install

```
conda install -c cduvallet q2_perc_norm
```


## [phylogenize](https://library.qiime2.org/plugins/q2-phylogenize/21/)

__Description:__ Allows users to link microbial genes to environments using phylogenetic regression.

### Install

_Installation is a bit more involved (e.g. requires manual interaction with R), to install see header link._


## [picrust2](https://library.qiime2.org/plugins/q2-picrust2/13/)

__Description:__ Plugin to run the PICRUSt2 pipeline to get EC, KO, and MetaCyc pathway predictions based on 16S data.

### Install

_Only available for QIIME 2-2019.10._


## [scnic](https://library.qiime2.org/plugins/q2-scnic/11/)

__Description:__ A tool for building correlation networks from feature tables, finding modules in said networks and summarizing those modules.

### Install

```
conda config --add channels bioconda
conda config --add channels conda-forge
conda install -c conda-forge blas=1.1
conda install -c lozuponelab q2-SCNIC
```


## [shogun](https://library.qiime2.org/plugins/q2-shogun/15/)

__Description:__ A QIIME 2 plugin wrapper for the [SHOGUN](https://github.com/knights-lab/SHOGUN) shallow shotgun sequencing taxonomy profiler.

### Install

```
conda install -c bioconda bowtie2
pip install https://github.com/knights-lab/SHOGUN/archive/master.zip
pip install https://github.com/qiime2/q2-shogun/archive/master.zip
```


## [quorro](https://library.qiime2.org/plugins/qurro/22/)

__Description:__ Interactively visualize feature rankings (differentials or feature loadings, sorted numerically) alongside the log-ratios of selected features' abundances.

### Install

See plugin [README](https://github.com/biocore/qurro#installation-and-usage).

<div style="page-break-after: always;"></div>

# RELATED COMMUNITY RESOURCES

## [manifest & metadata generator](https://library.qiime2.org/plugins/qiime2-manifest-metadata-generator/23/)

__Description:__ _NOT A QIIME 2 PLUGIN!_ Generate metadata and manifest file(s) for QIIME 2 input. See header link for example on bash execution.

### Install

```
git clone \
  https://github.com/charliechen912ilovbash/Qiime2-manifest-metadata-generator.git
```
