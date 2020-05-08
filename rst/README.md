__Last Updated:__ 2020.05.07

## Directory Tree

Visual summary of the results-directory structure, and its content. All folders with the naming convention _"nn-[...]-summary"_ contains QIIME 2 visualization files—files with the .qzv extension. These can be visualized with the QIIME 2 CLI:

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
