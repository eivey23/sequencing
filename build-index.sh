source ./common_values.sh

mkdir -p "$(dirname "$INDEX")"
mkdir -p "$(dirname "$INDEX2")"
mkdir -p "$(dirname "$INDEX3")"

bowtie2-build sars-cov2-wa1-2020.FASTA $INDEX
bowtie2-build WT-spike.FASTA $INDEX2
bowtie2-build mut-spike.FASTA $INDEX3