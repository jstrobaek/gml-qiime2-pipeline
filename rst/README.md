## Directory Tree

Visual summary of the results-directory structure, and its content after running the commands of [runMaster.sh](../scr/runMaster.sh). All files with the .qzv extention are QIIME 2 visualization files. These can be viewed in a browser by calling the following QIIME 2 CLI command:

```
qiime tools view "$PWD"/rst/<folder>/<file>.qzv
```

__Or,__ shared/viewed without having access to the dedicated CLI. This is simply done by uploading the file to the online QIIME 2 [viewer](https://view.qiime2.org/).

Output identified to be equivalent to a preexisting QIIME 1 output, is specified in [q1_checklist.md](../doc/inventory/q1_checklist.md).

```
rst/
├── 00-export
│   ├── feat-table-l6-ivenn.txt
│   ├── feat-table.tsv
│   └── feature-table.biom
├── 00-figures
│   ├── feat-table-l6-ivenn.png
│   └── feat-table-l6-ivenn.svg
├── 00-import
│   ├── demux-paired-end.qza
│   ├── demux-paired-end.qzv
│   ├── gg-13-8-99-515-806-nb-classifier.qza
│   └── metadata.qzv
├── 01-denoise-and-join
│   ├── core-feats.qzv
│   ├── denoising-stats.qza
│   ├── denoising-stats.qzv
│   ├── joined-rep-seqs.qza
│   ├── joined-rep-seqs.qzv
│   ├── joined-table.qza
│   ├── joined-table.qzv
│   └── rel-freq-table.qza
├── 02-taxonomy
│   ├── grouped-taxa-l6-table.qza
│   ├── taxa-bar-plot.qzv
│   ├── taxa-l6-table.qza
│   ├── taxa-l6-table.qzv
│   ├── taxa-treat-heatmap.qzv
│   ├── taxonomy.qza
│   ├── taxonomy.qzv
│   └── transposed-grouped-taxa-l6-table.qza
├── 03-phyl-trees
│   ├── aligned-rep-seqs.qza
│   ├── masked-aligned-rep-seqs.qza
│   ├── rooted-tree.qza
│   └── unrooted-tree.qza
├── 04-diversity
│   ├── aitchison-biplot.qza
│   ├── aitchison-biplot.qzv
│   ├── aitchison-d-mat.qza
│   ├── braycurtis-d-mat.qza
│   ├── braycurtis-treat-sig.qzv
│   ├── jaccard-d-mat.qza
│   ├── jaccard-treat-sig.qzv
│   ├── qurro-plot.qzv
│   ├── unwei-unifrac-d-mat.qza
│   ├── wei-unifrac-biplot.qza
│   ├── wei-unifrac-biplot.qzv
│   ├── wei-unifrac-d-mat.qza
│   ├── wei-unifrac-pcoa-2-dim.qza
│   ├── wei-unifrac-pcoa-2-dim.qzv
│   └── wei-unifrac-treat-sig.qzv
└── README.md
```
