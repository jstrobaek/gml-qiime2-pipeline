# Includes commands used for verifying that a QIIME pipeline equivalent can be
# performed in QIIME 2.


# Commands could be run from a project directory of the following structure:
  #  .
  #  ├── bin
  #  │  
  #  ├── data
  #  │   ├── samples-fastq-gz
  #  │   └── samples-origin
  #  │  
  #  ├── doc
  #  │   ├── info
  #  │   ├── misc
  #  │   ├── notes
  #  │   └── proposal
  #  │  
  #  ├── qiime2_env
  #  │  
  #  ├── rst
  #  │   ├── 00-import
  #  │   ├── 01-demux-summary
  #  │   ├── 02-join-pairs
  #  │   ├── 03-demux-summary
  #  │   ├── 04-qc-filtered
  #  │   ├── 05-derep
  #  │   ├── 06-dn-clust
  #  │   ├── 07-feat-table-summary
  #  │   ├── 08-
  #  │   └──
  #  │  
  #  └── scr


# RE-FORMAT MAPPING FILE
#
# ... to adhere to QIIME 2 header requirements:
# https://docs.qiime2.org/2020.2/tutorials/metadata/
# And, remove columns that does not hold any relevant information.
  # sed 's/#//' "$PWD"/data/samples-origin/Joel_map.csv | \
  #   cut -f1,2,12,13,14,15,16,17,18,19,20 > "$PWD"/data/map_meta.tsv
#
# EDIT! The above commented out code was replaced:
# An error produced when summarizing the feature tables introduced the need
# to re-format the metadata-file... This was due to an inconsistency, where
# the assigned metadata SampleID did not correspond to the CASAVA FASTQ-file
# naming convention (or the SampleID given in the supporting file).
#
# Move specified FASTQ files to the QIIME 2 input folder, based on the
# SampleID stored in the WN column of the mapping file.
cut -f5 data/samples-origin/Joel_map.csv | tail -n+2 | \
  while read ID; do \
  mv data/samples-origin/"$ID"/Files/*.gz data/samples-fastq-gz/; done

# Fetch relevant metadata from original mapping file.
cut -f2,12,13,14,15,16,17,18,19,20 "$PWD"/data/samples-origin/Joel_map.csv \
  > "$PWD"/data/meta_tmp.tsv

# Construct SampleID column with correct IDs.
echo 'SampleID' > data/id_tmp.tsv | cut -f5 data/samples-origin/Joel_map.csv | \
  tail -n+2 | \
  while read ID; do \
  grep 'Name:' data/samples-origin/"$ID"/SampleProperties | \
  cut -d' ' -f2 >> data/id_tmp.tsv; done

# Join SampleID to metadata.
paste data/id_tmp.tsv data/meta_tmp.tsv > data/metadata.tsv \
  && rm data/*_tmp.tsv


# DATA IMPORT
#
# Import metadata-file.
qiime metadata tabulate \
  --m-input-file "$PWD"/data/metadata.tsv \
  --o-visualization "$PWD"/rst/00-import/metadata.qzv

# Import FASTQ.gz-files to QIIME 2 data artifact (.qza)
qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path "$PWD"/data/samples-fastq-gz/ \
  --input-format CasavaOneEightSingleLanePerSampleDirFmt \
  --output-path "$PWD"/rst/00-import/demux-paired-end.qza

# Summarize import output to QIIME 2 visualization artifact (.qzv)
qiime demux summarize \
  --i-data "$PWD"/rst/00-import/demux-paired-end.qza \
  --o-visualization "$PWD"/rst/01-demux-summary/demux-paired-end.qzv


# JOIN PAIRS
#
# Join forward and reverse reads to single sequence.
qiime vsearch join-pairs \
  --i-demultiplexed-seqs "$PWD"/rst/00-import/demux-paired-end.qza \
  --o-joined-sequences "$PWD"/rst/02-join-pairs/demux-joined.qza

# Summarize the join results.
qiime demux summarize \
  --i-data "$PWD"/rst/02-join-pairs/demux-joined.qza \
  --o-visualization "$PWD"/rst/03-demux-summary/demux-joined.qzv


# QUALITY CONTROL
#
# Filter sequences based on quality.
qiime quality-filter q-score-joined \
  --i-demux "$PWD"/rst/02-join-pairs/demux-joined.qza \
  --p-min-quality 20 \
  --o-filtered-sequences "$PWD"/rst/04-qc-filtered/demux-joined-filtered.qza \
  --o-filter-stats "$PWD"/rst/04-qc-filtered/demux-joined-filter-stats.qza


# FEATURE TABLE GENERATION
#
# Dereplication: vsearch dereplicate-sequences method requires that the data
# was previously subjected to QC, since no internal QC is applied by the
# vsearch dereplication method.
qiime vsearch dereplicate-sequences \
  --i-sequences "$PWD"/rst/04-qc-filtered/demux-joined-filtered.qza \
  --o-dereplicated-table "$PWD"/rst/05-derep/table.qza \
  --o-dereplicated-sequences "$PWD"/rst/05-derep/rep-seqs.qza

# De novo clustering of dereplicated sequences.
qiime vsearch cluster-features-de-novo \
  --i-table "$PWD"/rst/05-derep/table.qza \
  --i-sequences "$PWD"/rst/05-derep/rep-seqs.qza \
  --p-perc-identity 0.99 \
  --o-clustered-table "$PWD"/rst/06-dn-clust/table-dn-99.qza \
  --o-clustered-sequences "$PWD"/rst/06-dn-clust/rep-seqs-dn-99.qza


# Feature table summary.
qiime feature-table summarize \
  --i-table "$PWD"/rst/06-dn-clust/table-dn-99.qza \
  --m-sample-metadata-file "$PWD"/data/metadata.tsv \
  --o-visualization "$PWD"/rst/07-feat-table-summary/table-dn-99.qzv


#
