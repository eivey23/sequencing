set -euo pipefail

BOWTIE_INDEX_DIR="bowtie-index"

INDEX="sars-cov2-wa1-2020"
INDEX2="WT-spike"
INDEX3="mut-spike"

INDEXES=("$INDEX" "$INDEX2" "$INDEX3")