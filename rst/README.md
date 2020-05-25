__Last Updated:__ 2020.05.22

## Directory Tree

Visual summary of the results-directory structure, and its content. All files with the .qzv extention are QIIME 2 visualization files. These can be viewed in a browser by calling the following QIIME 2 CLI command:

```
qiime tools view "$PWD"/rst/<folder>/<file>.qzv
```

__Or,__ shared/viewed without having access to the dedicated CLI. This is simply done by uploading the file to the online QIIME 2 [viewer](https://view.qiime2.org/).

```
.
├── 00-import
│   ├── demux-paired-end.qza
│   └── metadata.qzv
├── 01-demux-summary
│   └── demux-paired-end.qzv
├── 02-join-pairs
│   └── demux-joined.qza
├── 03-demux-summary
│   └── demux-joined.qzv
├── 04-qc-filtered
│   ├── demux-joined-filtered.qza
│   └── demux-joined-filter-stats.qza
├── 05-derep
│   ├── rep-seqs.qza
│   └── table.qza
├── 06-dn-clust
│   ├── rep-seqs-dn-99.qza
│   └── table-dn-99.qza
├── 07-feat-table-summary
├── 08-
└── README.md
```
