# Script summaries

## Executable

### [taxa-tsv-to-ivenn.py](./taxa-tsv-to-ivenn.py)

Python-script that converts a BIOM TSV-file into Ivenn input format. Only intended for use with files originally output from QIIME 2, adhering to a specific formatting. To see available commands use `taxa-tsv-to-ivenn.py --help`.

#### Input

A BIOM TSV-file needs to be specified as input. For this project, the BIOM file was generated through QIIME 2 (see [runMaster.sh](./runMaster.sh ), _# TAXONOMIC ANALYSIS_). In essence, a taxonomy feature table was grouped by treatment, then transposed, and subsequently exported as a BIOM file. This file was in turn formatted into TSV utilizing the `biom` CLIs `convert`-command. An example of this output format is displayed below:

```
# Constructed from biom file		
#OTU ID Unassigned;__;__;__;__;__   k__Bacteria;__;__;__;__;__
A   83  473
C   115 1188
D   49  853
B   109 501
```

#### iVenn generation

InteractiVenn is a open-source, free online application, built by Heberle _et al_ [1].


The output of taxa-tsv-to-ivenn.py can be uploaded to the [InteractiVenn website](http://www.interactivenn.net/) in order to produce a Venn diagram.

## Run-command files

These are files containing commands that were individually, and sequentially, run in the command-line—all involving QIIME 2, i.e. require a working installation of the QIIME 2 CLI. Help with this can be found through the QIIME 2 [online documentation](https://docs.qiime2.org/2020.2/install/). The specifics for the current installation can be found in [qiimeInstall.sh](./qiimeInstall.sh), which is described briefly below.

### [qiimeInstall.sh](./qiimeInstall.sh)

Includes commands used for installation of Python 3.7, Anaconda, and QIIME 2. As well as a quick test run, following the [Moving Pictures tutorial](https://docs.qiime2.org/2020.2/tutorials/moving-pictures/). It utilizes the data allocated to the tutorial, in order to further verify that the program is performing as intended.

#### Version output

Calling the `qiime info` command, after performing the above installation, produced the following output:

```
System versions
Python version: 3.6.7
QIIME 2 release: 2020.2
QIIME 2 version: 2020.2.0
q2cli version: 2020.2.0

Installed plugins
alignment: 2020.2.0
composition: 2020.2.0
cutadapt: 2020.2.0
dada2: 2020.2.0
deblur: 2020.2.0
demux: 2020.2.0
diversity: 2020.2.0
emperor: 2020.2.0
feature-classifier: 2020.2.0
feature-table: 2020.2.0
fragment-insertion: 2020.2.0
gneiss: 2020.2.0
longitudinal: 2020.2.0
metadata: 2020.2.0
phylogeny: 2020.2.0
quality-control: 2020.2.0
quality-filter: 2020.2.0
sample-classifier: 2020.2.0
taxa: 2020.2.0
types: 2020.2.0
vsearch: 2020.2.0

Application config directory
/home/<user>/<dirs>/qiimeProj/qiime2_env/var/q2cli
```

### [qiimeInstall_community.sh](./qiimeInstall_community.sh)

Includes commands used for installation of community plugins, available for QIIME 2-2020.2. A full list of available community plugins can be found in the [QIIME 2 inventory](../doc/inventory/q2_inventory.md).

### [runTest.sh](./runTest.sh)

Follows the [Moving Pictures tutorial](https://docs.qiime2.org/2020.2/tutorials/moving-pictures/) using data acquired through the [Gut Microbiome Laboratory](https://portal.research.lu.se/portal/en/projects/gut-microbiome-laboratory\(506d4dc7-f20e-4e33-8824-1ca3f1313925\).html) (GML). Prematurely terminated when a decision to not use OTUs was made.

#### Metadata reformatting

This script file also contains the code used to reformat the metadata associated with the GML dataset. These commands are added below, if this is the only thing of interest pertaining to this file.

```
<!-- Move specified FASTQ files to the QIIME 2 input folder, based on the -->
<!-- SampleID stored in the WN column of the mapping file. -->
cut -f5 "$PWD"/data/samples-origin/Joel_map.csv | tail -n+2 | \
  while read ID; do \
  mv \
  "$PWD"/data/samples-origin/"$ID"/Files/*.gz "$PWD"/data/samples-fastq-gz/; \
  done

<!-- Fetch relevant metadata from original mapping file. -->
cut -f2,7,12,13,14,15,16,17,18,19,20 "$PWD"/data/samples-origin/Joel_map.csv \
  > "$PWD"/data/meta_tmp.tsv

<!-- Construct SampleID column with correct IDs. -->
echo 'SampleID' > data/id_tmp.tsv | cut -f5 data/samples-origin/Joel_map.csv | \
  tail -n+2 | \
  while read ID; do \
  grep 'Name:' data/samples-origin/"$ID"/SampleProperties | \
  cut -d' ' -f2 >> data/id_tmp.tsv; \
  done

<!-- Join SampleID to metadata. -->
paste data/id_tmp.tsv data/meta_tmp.tsv > data/metadata.tsv \
  && rm data/*_tmp.tsv
```

### [runMaster.sh](./runMaster.sh)



# References

__[1]__ Heberle H, Meirelles GV, da Silva FR, Telles GP, Minghim R. InteractiVenn: a web-based tool for the analysis of sets through Venn diagrams. BMC bioinformatics. 2015 Dec 1;16(1):169.
