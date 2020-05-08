# QIIME 1 to QIIME 2 conversion



## Getting Started



### Prerequisites



### Installation



## Running tests



### Example 1



### Example 2



### Example 3



## Built Using

* The command-line interface SQLite software ([sqlite3 3.22.0](https://sqlite.org/cli.html)) was used to create the SQLite database.
 * Tables were created from edited versions of the below files.
  * [curated_gene_disease_associations.tsv](https://www.disgenet.org/downloads)
  * [human.entrez_2_string.2018.tsv](https://string-db.org/mapping_files/entrez/)
  * [human.GO_2_string.2018](https://string-db.org/mapping_files/geneontology/)
  * [human.name_2_string.tsv](https://string-db.org/mapping_files/STRING_display_names/)
  * [human.uniprot_2_string.2018.tsv](https://string-db.org/mapping_files/uniprot/)

The database source files were trimmed to limit the scope and size, and enable upload to GitHub. They were reduced by first limiting the *curated_gene_disease_associations.tsv* by only including genes which were associated with inflammation. This was then further trimmed by matching the leftover IDs with those of the other source files. These files can be found within /data/db_table_data/.

## Author(s)

* **Joel Ströbaek**

## License

See [LICENCE](https://github.com/yogogoba/gdads/blob/master/LICENSE) file for information.
