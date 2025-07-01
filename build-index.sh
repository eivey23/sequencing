set -euo pipefail

source ./common_values.sh

for CURRENT_INDEX in "${INDEXES[@]}"; do
    mkdir -p "$BOWTIE_INDEX_DIR/$CURRENT_INDEX"
    bowtie2-build "$CURRENT_INDEX.FASTA" "$BOWTIE_INDEX_DIR/$CURRENT_INDEX/$CURRENT_INDEX"
    samtools faidx "$CURRENT_INDEX.FASTA"
done