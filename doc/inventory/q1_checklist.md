#### Notes

Tutorial on how to [integrate QIIME 2 output in R](https://forum.qiime2.org/t/tutorial-integrating-qiime2-and-r-for-data-visualization-and-analysis-using-qiime2r/4121), while keeping provenance.

Download the archived and compressed .qzv-files from [here](https://lu.box.com/s/u3kd6smwqvaim07phadlrg1panoz9b4j).

## Output checklist

- [x] fastqc & read summary
 - __demux-paired-end.qzv__

- [x] Before/after
 - __denoising-stats.qzv__
 - __joined-table.qzv__
 - __joined-rep-seqs.qzv__


- [ ] feature statistics
 - What tests specifically?


- [ ] ~venn diagrams of shared features (between samples)~
 - _Should be easy enough to produce by exporting the core-feat-data_


- [x] beta diversity & pairwise comparisons & stat comparison of treatments
 - __wei-unifrac-treat-sig.qzv__


- [x] Stacked bar plot
 - __taxa-bar-plot.qzv__


- [ ] ~Krona graph~
 - [Potential workaround with Calypso](https://forum.qiime2.org/t/how-can-we-use-qiime2-artifacts-for-krona/11610/2)
   - _However, I am unable to connect to the web-server..._
 - [Hopefully working python-script that solves this](https://forum.qiime2.org/t/generate-krona-charts-from-taxa-barplots/12639)


- [x] Heat maps (Metaphlan?)
 - __taxa-treat-heatmap.qzv__
 - _The MetaPhlAn2 community plugin is unavailable for the current version of QIIME 2—MetaPhlAn3 might be available in the near future_


- [ ] ~venn with taxa/treatment comparison~
 - _Should be easy enough to produce_


- [ ] ~Lefse~
 - [a forum post concerning this](https://forum.qiime2.org/t/qiime2-to-lefse/13132/4)


- [x] PCoA
 - __wei-unifrac-pcoa-2-dim.qzv__
 - _Producible from a wide variety of distance matrices_


- [ ] ~correlation matrix between taxa (at specific taxa level)~
 - _Should be able to extract the required data to generate elsewhere, e.g. R_
 - _Could be represented in a heatmap...?_


- [x] biplots taxa/treatment (at specific taxa level)
 - __aitchison-biplot.qzv__


- [ ] ~biplot biomarker/treatment~
 - _Require info/understanding of incorporating biomarker metadata_


- [ ] ~correlation matrix biomarker/treatment~
 - _Should be able to extract the required data to generate elsewhere, e.g. R_


- [ ] abundance of biomarker per treatment
 - _Haven't produced (need instructions on how to incorporate "biomarker metadata"), but should be easy enough_


- [ ] ~biplot biomarker/taxa/treatment (Simca)~
 - [Might be solvable by extended use of metadata](https://forum.qiime2.org/t/how-to-output-metadata-as-an-artifact/10338)
