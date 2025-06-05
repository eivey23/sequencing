source ./common_values.sh

mkdir -p "$(dirname "$INDEX")"

bowtie2-build sars-cov2-wa1-2020.FASTA $INDEX
