Welcome to the bioinformatics-assignment repository

The purpose of this repository is to share scripts for genome data analysis assignments.

First, a fastqc script was created to check data quality.

Watch out for updates!



```{r}
dir <- "C:/Users/XX/AppData/Local/R/win-library/4.2/GenomicFeatures/extdata/seq"
gffmodel <- file.path(dir,"GCF_009819885.2_bCatUst1.pri.v2_genomic.gff")
(txdb <- makeTxDbFromGFF(file="GCF_009819885.2_bCatUst1.pri.v2.gff", format="gff3", dataSource = "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/009/819/885/GCF_009819885.2_bCatUst1.pri.v2/", organism = "Catharus ustulatus"))

```
Import genomic features from the file as a GRanges object ... OK
Prepare the 'metadata' data frame ... OK
Make the TxDb object ... OK
TxDb object:

Db type: TxDb
Supporting package: GenomicFeatures
Data source: https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/009/819/885/GCF_009819885.2_bCatUst1.pri.v2/
Organism: Catharus ustulatus
Taxonomy ID: 91951
miRBase build ID: NA
Genome: NA
Nb of transcripts: 40735
Db created by: GenomicFeatures package from Bioconductor
Creation time: 2022-12-06 16:31:04 -0600 (Tue, 06 Dec 2022)
GenomicFeatures version at creation time: 1.50.2
RSQLite version at creation time: 2.2.19
DBSCHEMAVERSION: 1.2

Warning messages:
1: In .extract_transcripts_from_GRanges(tx_IDX, gr, mcols0$type, mcols0$ID, :
some transcripts have no "transcript_id" attribute ==> their
name ("tx_name" column in the TxDb object) was set to NA
2: In .extract_transcripts_from_GRanges(tx_IDX, gr, mcols0$type, mcols0$ID, :
the transcript names ("tx_name" column in the TxDb object)
imported from the "transcript_id" attribute are not unique

```{r}
txdb
```
TxDb object:

Db type: TxDb
Supporting package: GenomicFeatures
Data source: https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/009/819/885/GCF_009819885.2_bCatUst1.pri.v2/
Organism: Catharus ustulatus
Taxonomy ID: 91951
miRBase build ID: NA
Genome: NA
Nb of transcripts: 40735
Db created by: GenomicFeatures package from Bioconductor
Creation time: 2022-12-06 16:31:04 -0600 (Tue, 06 Dec 2022)
GenomicFeatures version at creation time: 1.50.2
RSQLite version at creation time: 2.2.19
DBSCHEMAVERSION: 1.2

```{r}
saveDb(txdb, file="Custulatus.sqlite")
```
TxDb object:

Db type: TxDb
Supporting package: GenomicFeatures
Data source: https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/009/819/885/GCF_009819885.2_bCatUst1.pri.v2/
Organism: Catharus ustulatus
Taxonomy ID: 91951
miRBase build ID: NA
Genome: NA
Nb of transcripts: 40735
Db created by: GenomicFeatures package from Bioconductor
Creation time: 2022-12-06 16:31:04 -0600 (Tue, 06 Dec 2022)
GenomicFeatures version at creation time: 1.50.2
RSQLite version at creation time: 2.2.19
DBSCHEMAVERSION: 1.2
con <- dbconn(txdb)
DBI::dbGetQuery(con, "INSERT INTO metadata VALUES ('Resource URL', 'https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/009/819/885/GCF_009819885.2_bCatUst1.pri.v2/');")
data frame with 0 columns and 0 rows
Warning message:
In result_fetch(res@ptr, n = n) :
SQL statements must be issued with dbExecute() or dbSendStatement() instead of dbGetQuery() or dbSendQuery().

```{r}
makeTxDbPackage(txdb, version="1.2", maintainer="X X X@zzz.edu", author="X X", destDir= "C:/Users/X/AppData/Local/R/win-library/4.2/GenomicFeatures/exdata/seq")
```
Error in createPackage(pkgname = pkgname, destinationDir = destDir, originDir = template_path, :
'destinationDir' must be a directory (C:/Users/X/AppData/Local/R/win-library/4.2/GenomicFeatures/exdata/seq)
