source ./common_values.sh

mkdir -p "$(dirname "$INDEX")"

bowtie2-build sars-cov2-wa1-2020.FASTA $INDEX
bowtie2-build mut-spike.FASTA $INDEX3
bowtie2-build WT-spike.FASTA $INDEX2