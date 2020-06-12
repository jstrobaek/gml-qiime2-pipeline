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

# References

__[1]__ Heberle H, Meirelles GV, da Silva FR, Telles GP, Minghim R. InteractiVenn: a web-based tool for the analysis of sets through Venn diagrams. BMC bioinformatics. 2015 Dec 1;16(1):169.
