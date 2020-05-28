# The QIIME 2 pipeline implemented as a suggested replacement to the current
# QIIME 1 pipeline in use at GML, at Lund University in Sweden.
#
# Please see the results-directory README for information on directory setup.
#
# Comments starting with a [V] includes a command to view some, or all, of the
# visulization output produced. It is chained with the logical THEN operator
# '&&', meaning it will only execute if the previous command exited with a
# zero exit status.

# DATA IMPORT
#
# [V] Import pre-formated metadata-file (see runTest.sh for formating details).
# This file is not used in the pipeline, but is still generated for sake of
# provenance, and adherance to QIIME 2 guidelines.
qiime metadata tabulate \
  --m-input-file "$PWD"/data/metadata.tsv \
  --o-visualization "$PWD"/rst/00-import/metadata.qzv \
  && \
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

# [V] Summarize import output to QIIME 2 visualization artifact (.qzv).
qiime demux summarize \
  --i-data "$PWD"/rst/00-import/demux-paired-end.qza \
  --o-visualization "$PWD"/rst/00-import/demux-paired-end.qzv \
  && \
  qiime tools view "$PWD"/rst/00-import/demux-paired-end.qzv


# DEMULTIPLEXING--omitted
#
# The data used to perform this analysis was subject to demultiplexing, and
# quality control (QC), prior to import into QIIME 2. Specifics are available
# through the Gut Microbiome Labratory at Lund University.


# ADAPTER REMOVAL
#
# Not used during this run: knowledge of the adapter nature was limited, so
# DADA2 was used to arbitrarily trim the start of each sequence instead.
# IF the adapter sequence is available, it can easily be trimmed of using the
# cutadapt command, detailed here:
# https://docs.qiime2.org/2020.2/plugins/available/cutadapt/trim-paired/


# DENOISE AND JOIN
#
# Apply DADA2, where all cores are used when --p-n-threads is set to 0. As per
# plugin requirements, primers need to be removed. Results in two artifacts,
# one containing the ASV feature table, and the other representative sequences.
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

# [V] Summarize primary DADA2 output.
qiime feature-table summarize \
  --i-table "$PWD"/rst/01-denoise-and-join/joined-table.qza \
  --m-sample-metadata-file "$PWD"/data/metadata.tsv \
  --o-visualization "$PWD"/rst/01-denoise-and-join/joined-table.qzv \
  && \
  qiime tools view "$PWD"/rst/01-denoise-and-join/joined-table.qzv

qiime feature-table tabulate-seqs \
  --i-data "$PWD"/rst/01-denoise-and-join/joined-rep-seqs.qza \
  --o-visualization "$PWD"/rst/01-denoise-and-join/joined-rep-seqs.qzv \
  && \
  qiime tools view "$PWD"/rst/01-denoise-and-join/joined-rep-seqs.qzv

# [V] Visualize denoising statistics.
qiime metadata tabulate \
  --m-input-file "$PWD"/rst/01-denoise-and-join/denoising-stats.qza \
  --o-visualization "$PWD"/rst/01-denoise-and-join/denoising-stats.qzv \
  && \
  qiime tools view "$PWD"/rst/01-denoise-and-join/denoising-stats.qzv

# Produce feature table with relative frequency.
qiime feature-table relative-frequency \
  --i-table "$PWD"/rst/01-denoise-and-join/joined-table.qza \
  --o-relative-frequency-table "$PWD"/rst/01-denoise-and-join/rel-freq-table.qza


# CLASSIFICATION
#
# Generate taxonomy with pre-trained Naive Bayes classifier, available here:
# https://data.qiime2.org/2020.2/common/gg-13-8-99-515-806-nb-classifier.qza
qiime feature-classifier classify-sklearn \
  --i-classifier "$PWD"/rst/00-import/gg-13-8-99-515-806-nb-classifier.qza \
  --i-reads "$PWD"/rst/01-denoise-and-join/joined-rep-seqs.qza \
  --o-classification "$PWD"/rst/02-taxonomy/taxonomy.qza

# [V] Generate and view the taxonomy table.
qiime metadata tabulate \
  --m-input-file "$PWD"/rst/02-taxonomy/taxonomy.qza \
  --o-visualization "$PWD"/rst/02-taxonomy/taxonomy.qzv \
  && \
  qiime tools view "$PWD"/rst/02-taxonomy/taxonomy.qzv

# [V] Collapse feature table into taxonomy (genus).
qiime taxa collapse \
  --i-table "$PWD"/rst/01-denoise-and-join/joined-table.qza \
  --i-taxonomy "$PWD"/rst/02-taxonomy/taxonomy.qza \
  --p-level 6 \
  --o-collapsed-table "$PWD"/rst/02-taxonomy/taxa-l6-table.qza

# [V] Summarize the taxa-table.
qiime feature-table summarize \
  --i-table "$PWD"/rst/02-taxonomy/taxa-l6-table.qza \
  --m-sample-metadata-file "$PWD"/data/metadata.tsv \
  --o-visualization "$PWD"/rst/02-taxonomy/taxa-l6-table.qzv \
  && \
  qiime tools view "$PWD"/rst/02-taxonomy/taxa-l6-table.qzv


# TAXONOMIC ANALYSIS
#
# [V] Generate interactive barplot.
qiime taxa barplot \
  --i-table "$PWD"/rst/01-denoise-and-join/joined-table.qza \
  --i-taxonomy "$PWD"/rst/02-taxonomy/taxonomy.qza \
  --m-metadata-file "$PWD"/data/metadata.tsv \
  --o-visualization "$PWD"/rst/02-taxonomy/taxa-bar-plot.qzv \
  && \
  qiime tools view "$PWD"/rst/02-taxonomy/taxa-bar-plots.qzv

# [V] Produce heatmap.
qiime feature-table heatmap \
  --i-table "$PWD"/rst/02-taxonomy/taxa-l6-table.qza \
  --m-sample-metadata-file "$PWD"/data/metadata.tsv \
  --m-sample-metadata-column Treatment \
  --o-visualization "$PWD"/rst/02-taxonomy/taxa-treat-heatmap.qzv \
  && \
  qiime tools view "$PWD"/rst/02-taxonomy/taxa-treat-heatmap.qzv


# CORE FEATURES
#
# [V] Identify core features.
qiime feature-table core-features \
  --i-table "$PWD"/rst/01-denoise-and-join/joined-table.qza \
  --o-visualization "$PWD"/rst/core-feats.qzv \
  && \
  qiime tools view "$PWD"/rst/01-denoise-and-join/core-feats.qzv


# PHYLOGENY
#
# Generate tree for phylogenic diversity analysis.
qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences "$PWD"/rst/01-denoise-and-join/joined-rep-seqs.qza \
  --o-alignment "$PWD"/rst/03-phyl-trees/aligned-rep-seqs.qza \
  --o-masked-alignment "$PWD"/rst/03-phyl-trees/masked-aligned-rep-seqs.qza \
  --o-tree "$PWD"/rst/03-phyl-trees/unrooted-tree.qza \
  --o-rooted-tree "$PWD"/rst/03-phyl-trees/rooted-tree.qza


# DIVERSITY ANALYSIS
#
# Generate beta diversity distance matrix using phylogeny for:
# Unweighted Unifrac.
qiime diversity beta-phylogenetic \
  --i-table "$PWD"/rst/01-denoise-and-join/joined-table.qza \
  --i-phylogeny "$PWD"/rst/03-phyl-trees/rooted-tree.qza \
  --p-metric unweighted_unifrac \
  --o-distance-matrix "$PWD"/rst/04-diversity/unwei-unifrac-d-mat.qza

# Weighted Unifrac.
qiime diversity beta-phylogenetic \
  --i-table "$PWD"/rst/01-denoise-and-join/joined-table.qza \
  --i-phylogeny "$PWD"/rst/03-phyl-trees/rooted-tree.qza \
  --p-metric weighted_unifrac \
  --o-distance-matrix "$PWD"/rst/04-diversity/wei-unifrac-d-mat.qza

# Generate beta diversity distance matrix without using phylogeny, and:
# Take abundance into account.
qiime diversity beta \
  --i-table "$PWD"/rst/01-denoise-and-join/joined-table.qza \
  --p-metric braycurtis \
  --o-distance-matrix "$PWD"/rst/04-diversity/braycurtis-d-mat.qza

# Don't take abundance into account.
qiime diversity beta \
  --i-table "$PWD"/rst/01-denoise-and-join/joined-table.qza \
  --p-metric jaccard \
  --o-distance-matrix "$PWD"/rst/04-diversity/jaccard-d-mat.qza

# Plot beta diversity using the specified distance matrix.
qiime diversity beta-group-significance \
  --i-distance-matrix \
  "$PWD"/rst/04-diversity/wei-unifrac-d-mat.qza \
  --m-metadata-file "$PWD"/data/metadata.tsv \
  --m-metadata-column Treatment \
  --o-visualization \
  "$PWD"/rst/04-diversity/wei-unifrac-treat-sig.qzv \
  --p-pairwise

# To test continous metadata:
#
# [...] you can use the qiime metadata distance-matrix in combination with
# (qiime diversity mantel) and (qiime diversity bioenv) commands.

# Generate PCoA artifact.
qiime diversity pcoa \
  --i-distance-matrix "$PWD"/rst/04-diversity/wei-unifrac-d-mat.qza \
  --p-number-of-dimensions 2 \
  --o-pcoa "$PWD"/rst/04-diversity/wei-unifrac-pcoa-2-dim.qza

# [V] View the PCoA.
qiime emperor plot \
  --i-pcoa "$PWD"/rst/04-diversity/wei-unifrac-pcoa-2-dim.qza \
  --m-metadata-file "$PWD"/data/metadata.tsv \
  --o-visualization "$PWD"/rst/04-diversity/wei-unifrac-pcoa-2-dim.qzv \
  && \
  qiime tools view "$PWD"/rst/04-diversity/wei-unifrac-pcoa-2-dim.qzv

# Generate PCoA biplot.
qiime diversity pcoa-biplot \
  --i-pcoa "$PWD"/rst/04-diversity/wei-unifrac-pcoa-2-dim.qza \
  --i-features "$PWD"/rst/01-denoise-and-join/rel-freq-table.qza \
  --o-biplot "$PWD"/rst/04-diversity/wei-unifrac-biplot.qza

# [V] View the biplot.
qiime emperor biplot \
  --i-biplot "$PWD"/rst/04-diversity/wei-unifrac-biplot.qza \
  --m-sample-metadata-file "$PWD"/data/metadata.tsv \
  --o-visualization "$PWD"/rst/04-diversity/wei-unifrac-biplot.qzv \
  && \
  qiime tools view "$PWD"/rst/04-diversity/wei-unifrac-biplot.qzv

# Biplot alternative:
#
# Generate biplots utilizing the community plugin DEICODE. Not included in
# QIIME 2 core installation; see qiimeInstall_community-plugins.sh for help
# with installation.
# DO NOT RUN DEICODE with taxa-collapsed feature tables.
qiime deicode rpca \
  --i-table "$PWD"/rst/01-denoise-and-join/joined-table.qza \
  --p-min-feature-count 10 \
  --p-min-sample-count 500 \
  --o-biplot "$PWD"/rst/04-diversity/aitchison-biplot.qza \
  --o-distance-matrix "$PWD"/rst/04-diversity/aitchison-d-mat.qza

# [V] Visualize DEICODE biplot with Emperor.
qiime emperor biplot \
  --i-biplot "$PWD"/rst/04-diversity/aitchison-biplot.qza \
  --m-sample-metadata-file "$PWD"/data/metadata.tsv \
  --m-feature-metadata-file "$PWD"/rst/02-taxonomy/taxonomy.qza \
  --o-visualization "$PWD"/rst/04-diversity/aitchison-biplot.qzv \
  --p-number-of-features 8 \
  && \
  qiime tools view "$PWD"/rst/04-diversity/aitchison-biplot.qzv

# [V] QURRO can be applied to a DEICODE biplot to further investigate the
# feature loadings.
qiime qurro loading-plot \
  --i-table "$PWD"/rst/01-denoise-and-join/joined-table.qza \
  --i-ranks "$PWD"/rst/04-diversity/aitchison-biplot.qza \
  --m-sample-metadata-file "$PWD"/data/metadata.tsv \
  --m-feature-metadata-file "$PWD"/rst/02-taxonomy/taxonomy.qza \
  --o-visualization "$PWD"/rst/04-diversity/qurro-plot.qzv \
  && \
  qiime tools view "$PWD"/rst/04-diversity/qurro-plot.qzv
