# Includes commands used for installation of Python 3.7, Anaconda,
# and QIIME 2. As well as a quick test run.


# FULL INSTALLATION OF LATEST VERSION OF ANACONDA
#
# Install compatible version of Python.
sudo apt-get install python3.7

# Download the installation file.
wget -P ~/Downloads \
  "https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh"

# Verify data integrity.
sha246sum ~/Downloads/Anaconda3-2020.02-Linux-x86_64.sh

# Install Anaconda.
bash ~/Downloads/Anaconda3-2020.02-Linux-x86_64.sh

# Update conda & packages.
conda update --all


# INSTALL QIIME 2 WITH CONDA
#
# Download the installation file.
wget "https://data.qiime2.org/distro/core/qiime2-2020.2-py36-linux-conda.yml"

# Create dedicated environment and install QIIME 2.
conda env create \
  -prefix /path/to/project/dir/qiime2_env \
  --file qiime2-2020.2-py36-linux-conda.yml

# Activate environment and make rudimentary test.
conda activate /path/to/project/dir/qiime2_env
qiime2 --help  # Produced no errors!


# TEST QIIME 2
#
# Create tutorial directory.
mkdir /path/to/project/dir/qmp-tutorial
cd /path/to/project/dir/qmp-tutorial

# Download sample metadata.
wget -O \
  "sample-metadata.tsv" \
  "https://data.qiime2.org/2020.2/tutorials/moving-pictures/sample_metadata.tsv"

# Create data directory.
mkdir emp-single-end-sequences

# Download sequence barcode mapping file.
wget -O \
  "emp-single-end-sequences/barcodes.fastq.gz" \
  "https://data.qiime2.org/2020.2/tutorials/moving-pictures/emp-single-end-sequences/barcodes.fastq.gz"

# Download FASTQ sequence file.
wget -O \
  "emp-single-end-sequences/sequences.fastq.gz" \
  "https://data.qiime2.org/2020.2/tutorials/moving-pictures/emp-single-end-sequences/sequences.fastq.gz"

# Import sequences to QIIME 2 artifact.
qiime tools import \
  --type EMPSingleEndSequences \
  --input-path emp-single-end-sequences \
  --output-path emp-single-end-sequences.qza

# Demultiplex sequences.
qiime demux emp-single \
  --i-seqs emp-single-end-sequences.qza \
  --m-barcodes-file sample-metadata.tsv \
  --m-barcodes-column barcode-sequence \
  --o-per-sample-sequences demux.qza \
  --o-error-correction-details demux-details.qza

# Summarize demultiplex results.
qiime demux summarize \
  --i-data demux.qza \
  --o-visualization demux.qzv

# View the output.
qiime tools view demux.qzv

# Sequence QC and feature table generation.
#
# Option 1: DADA2
qiime dada2 denoise-single \
  --i-demultiplexed-seqs demux.qza \
  --p-trim-left 0 \
  --p-trunc-len 120 \
  --o-representative-sequences rep-seqs-dada2.qza \
  --o-table table-dada2.qza \
  --o-denoising-stats stats-dada2.qza

# Generate visualization of DADA2 output.
qiime metadata tabulate \
  --m-input-file stats-dada2.qza \
  --o-visualization stats-dada2.qzv

# Sequence QC and feature table generation.
#
# Option 2: Deblur
# Pre-filter demultiplexed data.
qiime quality-filter q-score \
  --i-demux demux.qza \
  --o-filtered-sequences demux-filtered.qza \
  --o-filter-stats demux-filter-stats.qza

# Run Deblur.
qiime deblur denoise-16S \
  --i-demultiplexed-seqs demux-filtered.qza \
  --p-trim-length 120 \
  --o-representative-sequences rep-seqs-deblur.qza \
  --o-table table-deblur.qza \
  --p-sample-stats \
  --o-stats deblur-stats.qza

# Generate visualization of Deblur output.
qiime metadata tabulate \
  --m-input-file demux-filter-stats.qza \
  --o-visualization demux-filter-stats.qzv
qiime deblur visualize-stats \
  --i-deblur-stats deblur-stats.qza \
  --o-visualization deblur-stats.qzv

# Choose method output used for downstream analysis: Deblur.
mv rep-seqs-deblur.qza rep-seqs.qza
mv table-deblur.qza table.qza

# Summarize feature table and -data.
qiime feature-table summarize \
  --i-table table.qza \
  --o-visualization table.qzv \
  --m-sample-metadata-file sample-metadata.tsv
qiime feature-table tabulate-seqs \
  --i-data rep-seqs.qza \
  --o-visualization rep-seqs.qzv

# View summaries.
qiime tools view table.qzv
qiime tools view rep-seqs.qzv

# The summaries were compared to the files available through the tutorial.
# Since they were identical, this initial test of QIIME 2 was ended here.
