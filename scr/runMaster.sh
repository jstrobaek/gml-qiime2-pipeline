# The QIIME 2 pipeline implemented as a suggested replacement to the current
# QIIME 1 pipeline in use at GML, at Lund University in Sweden.
#
# Please see the results-directory README for information on directory setup.


# DATA IMPORT
#
# Import pre-formated metadata-file (see runTest.sh for formating details).
qiime metadata tabulate \
  --m-input-file "$PWD"/data/metadata.tsv \
  --o-visualization "$PWD"/rst/00-import/metadata.qzv

# View metadata.
qiime tools view "$PWD"/rst/00-import/metadata.qzv

# Import FASTQ.gz-files to QIIME 2 data artifact (.qza).
# The type-flag is used to specify the nature of the data to be imported. Where
# the current argument marks the data as FASTQ-files of the Casava 1.8
# demultiplexed format.
# More info here: https://docs.qiime2.org/2020.2/tutorials/importing/
qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path "$PWD"/data/samples-fastq-gz \
  --input-format CasavaOneEightSingleLanePerSampleDirFmt \
  --output-path "$PWD"/rst/00-import/demux-paired-end.qza

# Summarize import output to QIIME 2 visualization artifact (.qzv)
qiime demux summarize \
  --i-data "$PWD"/rst/00-import/demux-paired-end.qza \
  --o-visualization "$PWD"/rst/00-import/demux-paired-end.qzv

# View the output.
qiime tools view "$PWD"/rst/00-import/demux-paired-end.qzv


# DEMULTIPLEXING--omitted
#
# The data used to perform this analysis was subject to demultiplexing, and
# quality control (QC) prior to import into QIIME 2.


# DENOISE AND JOIN
#
# Apply DADA2, where all cores are used when --p-n-threads is set to 0. As per
# plugin requirements, primers need to be removed.
# Outputs ASV feature table, and rep-seqs.
qiime dada2 denoise-paired \
  --i-demultiplexed-seqs "$PWD"/rst/00-import/demux-paired-end.qza \
  --p-trunc-len-f 250 \
  --p-trim-left-f 22 \
  --p-trunc-len-r 250 \
  --p-trim-left-r 22 \
  --p-n-threads 0 \
  --o-table "$PWD"/rst/01-denoise-and-join/joined-table.qza \
  --o-representative-sequences \
  "$PWD"/rst/01-denoise-and-join/joined-rep-seqs.qza \
  --o-denoising-stats "$PWD"/rst/01-denoise-and-join/denoising-stats.qza

# Summarize primary DADA2 output.
qiime feature-table summarize \
  --i-table "$PWD"/rst/01-denoise-and-join/joined-table.qza \
  --o-visualization "$PWD"/rst/01-denoise-and-join/joined-table.qzv \
  --m-sample-metadata-file "$PWD"/data/metadata.tsv

qiime feature-table tabulate-seqs \
  --i-data "$PWD"/rst/01-denoise-and-join/joined-rep-seqs.qza \
  --o-visualization "$PWD"/rst/01-denoise-and-join/joined-rep-seqs.qzv

# View summaries.
qiime tools view "$PWD"/rst/01-denoise-and-join/joined-table.qzv

qiime tools view "$PWD"/rst/01-denoise-and-join/joined-rep-seqs.qzv

# Visualize denoising statistics.
qiime metadata tabulate \
  --m-input-file "$PWD"/rst/01-denoise-and-join/denoising-stats.qza \
  --o-visualization "$PWD"/rst/01-denoise-and-join/denoising-stats.qzv

# View the output.
qiime tools view "$PWD"/rst/01-denoise-and-join/denoising-stats.qzv


# TAXONOMY CLASSIFICATION & TAXONOMIC ANALYSIS
#
# Generate tree for phylogenic diversity analysis.
qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences "$PWD"/rst/01-denoise-and-join/joined-rep-seqs.qza \
  --o-alignment "$PWD"/rst/02-phyl-tree/aligned-rep-seqs.qza \
  --o-masked-alignment "$PWD"/rst/02-phyl-tree/masked-aligned-rep-seqs.qza \
  --o-tree "$PWD"/rst/02-phyl-tree/unrooted-tree.qza \
  --o-rooted-tree "$PWD"/rst/02-phyl-tree/rooted-tree.qza


# BETA DIVERSITY ANALYSIS
#
# Apply diversity metrics to feature table.
qiime diversity core-metrics-phylogenetic \
  --i-phylogeny "$PWD"/rst/02-phyl-tree/rooted-tree.qza \
  --i-table "$PWD"/rst/01-denoise-and-join/joined-table.qza \
  --p-sampling-depth 5000 \
  --m-metadata-file "$PWD"/data/metadata.tsv \
  --output-dir "$PWD"/rst/03-diversity/core-metrics

# Beta diversity based on permutation-based statistical test.
# Treatment ONLY, as specified by --m-metadata-column flag.
qiime diversity beta-group-significance \
  --i-distance-matrix \
  "$PWD"/rst/03-diversity/core-metrics/unweight_unifrac_distnc_matrx.qza \
  --m-metadata-file "$PWD"/data/metadata.tsv \
  --m-metadata-column Treatment \
  --o-visualization \
  "$PWD"/rst/03-diversity/unweight-unifrac-treat-sig.qzv \
  --p-pairwise

# To test continous metadata:
# [...] you can use the qiime metadata distance-matrix in combination with
# (qiime diversity mantel) and (qiime diversity bioenv) commands.


# TAXONOMIC ANALYSIS
#
# Generate taxonomy with pre-trained Naive Bayes classifier, available here:
# https://data.qiime2.org/2020.2/common/gg-13-8-99-515-806-nb-classifier.qza
qiime feature-classifier classify-sklearn \
  --i-classifier "$PWD"/rst/00-import/gg-13-8-99-515-806-nb-classifier.qza \
  --i-reads "$PWD"/rst/01-denoise-and-join/joined-rep-seqs.qza \
  --o-classification "$PWD"/rst/04-taxonomy/taxonomy.qza

# Generate taxonomy table.
qiime metadata tabulate \
  --m-input-file "$PWD"/rst/04-taxonomy/taxonomy.qza \
  --o-visualization "$PWD"/rst/04-taxonomy/taxonomy.qzv

# View ouput.
qiime tools view "$PWD"/rst/04-taxonomy/taxonomy.qzv

# Generate interactive barplots.
qiime taxa barplot \
  --i-table "$PWD"/rst/01-denoise-and-join/joined-table.qza \
  --i-taxonomy "$PWD"/rst/04-taxonomy/taxonomy.qza \
  --m-metadata-file "$PWD"/data/metadata.tsv \
  --o-visualization "$PWD"/rst/04-taxonomy/taxa-bar-plots.qzv

# View ouput.
qiime tools view "$PWD"/rst/04-taxonomy/taxa-bar-plots.qzv


# DIFFERENTIAL ABUNDANCE (ANCOM)
#
# Generate compositional feature table artifact, by adding pseudocount.
# qiime composition add-pseudocount \
#   --i-table "$PWD"/rst/01-denoise-and-join/joined-table.qza \
#   --o-composition-table "$PWD"/rst/05-ancom/comp-joined-table.qza
#
# Run ANCOM. This assumes that less than 25% of the features change between
# groups (here Treatment).
# qiime composition ancom \
#   --i-table "$PWD"/rst/05-ancom/comp-joined-table.qza \
#   --m-metadata-file "$PWD"/data/metadata.tsv \
#   --m-metadata-column Treatment \
#   --o-visualization "$PWD"/rst/05-ancom/ancom-treatment.qzv

# 
