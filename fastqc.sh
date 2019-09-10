#!/bin/sh
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load fastqc/0.10.1
# place fastqc command with file name and flags after this line

# to generate boxplot graphs of quality score statistics using fastqc
fastqc -o /scratch/spea/pea_path/pea_fastq --noextract -f fastq 9311.2.128484.GGCTAC.fastq 9311.2.128484.TGACCA.fastq 9311.2.128484.TTAGGC.fastq 9339.6.128879.CGTACG.fastq 9339.6.128879.GTTTCG.fastq

# END
