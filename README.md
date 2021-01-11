# QIIME 1 to QIIME 2 conversion

## Disclaimer

All documentation and scripts in this repository was produced during a [15cr educational project](https://www.lunduniversity.lu.se/lubas/i-uoh-lu-BINP37), performed during the [M.Sc. in bioinformatics](https://www.lunduniversity.lu.se/lubas/i-uoh-lu-NABIF) at [Lund University](https://www.lunduniversity.lu.se/), Sweden. The main purpose of the content within is therefor to display the results of the aforementioned project, for educational purposes.

## Overview

This repository contains the necessary documentation and scripts to fully reproduce the project output, given access to the dataset used. Access to which was given by the [Gut Microbiome Laboratory](https://portal.research.lu.se/portal/en/projects/gut-microbiome-laboratory(506d4dc7-f20e-4e33-8824-1ca3f1313925).html) (GML), with the caveat that it would not be shared publicly. Requests to access this data should therefor be directed at the GML.

### Project report

A report tied to this educational project can be viewed [here](https://drive.google.com/file/d/1lgJPJ-xCnmDy6M2Us_V_-iUwcnfBhYYS/view?usp=sharing).

## Repository structure

### gml-qiime2-pipeline/

The repository holds the following files, within the given structure:

- __data/__
    - [metadata.tsv](./data/metadata.tsv)


- doc/__inventory/__
    - [q1_checklist.md](./doc/inventory/q1_checklist.md)
    - [q2_inventory.md](./doc/inventory/q2_inventory.md)


- __rst/__
    - [README.md](./rst/README.md)


- __scr/__
    - [ERROR_log.md](./scr/ERROR_log.md)
    - [README.md](./scr/README.md)
    - [qiimeInstall.sh](./scr/qiimeInstall.sh) *
    - [qiimeInstall_community-plugins.sh](./scr/qiimeInstall_community-plugins.sh) *
    - [runMaster.sh](./scr/runMaster.sh) *
    - [runTest.sh](./scr/runTest.sh) *
    - [taxa-tsv-to-ivenn.py](./scr/taxa-tsv-to-ivenn.py)

\* Non-executable file; use by running the individual commands

### Summary

The [metadata-file](./data/metadata.tsv) holds the metadata specific to the dataset used for all commands found within the [runMaster.sh](./scr/runMaster.sh) script. The file itself was generated using a metadata file related to the GML dataset, with commands found in the [runTest.sh](./scr/runTest.sh) script. The inventory file [q2_inventory.md](./doc/inventory/q2_inventory.md) lists _all_ available plugins for QIIME 2. Whereas [q1_checklist.md](./doc/inventory/q1_checklist.md) is a rundown of the visual output produced with the QIIME 1 pipeline with references to any equivalent output reproduced—and suggested solutions where missing—in QIIME 2 (using [runMaster.sh](./scr/runMaster.sh)). The output structure of the rudimentary QIIME 2 workflow can be viewed in the [rst/README.md](./scr/README.md)—and "users" are required to produce this directory folder structure to preform the commands available through [runMaster.sh](./scr/runMaster.sh). Another folder structure was followed during testing, and is detailed in comments within [runTest.sh](./scr/runTest.sh). Further information on the script files are found in the [scr/README.md](./scr/README.md), as well as in comments within each individual file.

## Author(s)

* [**Joel Ströbaek**](mailto:jo0348st-s@student.lu.se)
