INDEX="sars-cov2-wa1-2020-index/sars-cov2-wa1-2020"
mkdir -p "$(dirname "$INDEX")"

bowtie2-build sars-cov2-wa1-2020.FASTA $INDEX
