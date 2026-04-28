This is a pipeline to detect Horizontal Gene Trasnsfer (HGT) events on contigs, genomes or metagenome assembled genomes (MAGs), using identity > 99.9% and alignment length > 500bp from blastn outputs, according to [Goussin et al., 2021](https://doi.org/10.1016/j.cell.2021.02.052). This pipelina has been applied in different studies done in our research group: [Alexa et al., 2024](https://doi.org/10.1186/s40168-024-01790-4) and [Quijada et al., 2025](https://doi.org/10.1038/s41564-025-02059-8).

The first step is to merge all contigs/genomes in a unique file but adding information about sample/genome of origin, by runing:

```ruby 01.change_genomes_headers.rb GENOMES_FOLDER```

It will create a file named *all_genomes.fna* that we need to format for blastn database and perform the blastn to it self by:

```
makeblastdb -in all_genomes.fna -dbtype nucl -out all_genomes
blastn -query all_genomes.fna -db all_genomes -out blastn_allvsall.txt -perc_identity 99.9 -outfmt 6 -max_target_seqs 500 -num_threads NUM_THREADS
```
