set -euo pipefail

source ./common_values.sh

if [ $# -ne 1 ]; then
    echo "Usage: $0 <run-name>"
    exit 1
fi

RUN_NAME="$1"

case "$RUN_NAME" in
    first)
        FASTQ_BASE_PATH="../30-1189397265/00_fastq"
        BASE_FILES=("Exp1sh90KP3" "Exp1shCP3" "Exp4sh90KP3" "Exp4shCP3")
        ;;
    second)
        FASTQ_BASE_PATH="../30-1202121534/00_fastq"
        BASE_FILES=("Exp2sh90KP3_S2_L001" "Exp2shCP3_S1_L001" "Exp3sh90KP3_S3_L001" "Exp3shCP3_S4_L001")
        ;;
    *)
        echo "Unknown group: $GROUP"
        exit 1
        ;;
esac


OUTPUT_BASE="alignment/$RUN_NAME"

mkdir -p "$OUTPUT_BASE/sam" "$OUTPUT_BASE/results"

for BASE_FILE in "${BASE_FILES[@]}"; do
    for CURRENT_INDEX in "${INDEXES[@]}"; do
    # for CURRENT_INDEX in "$INDEX2" "$INDEX3" "$INDEX"; do
    # for CURRENT_INDEX in "$INDEX3" "$INDEX"; do
    # for CURRENT_INDEX in "$INDEX2"; do
        echo "base file: $BASE_FILE"
        echo "current index: $CURRENT_INDEX"
        R1_FILE="${FASTQ_BASE_PATH}/${BASE_FILE}_R1_001.fastq.gz"
        echo "R1: $R1_FILE"
        R2_FILE="${FASTQ_BASE_PATH}/${BASE_FILE}_R2_001.fastq.gz"
        echo "R2: $R2_FILE"

        OUTPUT_SAM="$OUTPUT_BASE/sam/$BASE_FILE/$(basename "$CURRENT_INDEX")---$BASE_FILE.sam"
        OUTPUT_BAM="$OUTPUT_BASE/bam/$BASE_FILE/$(basename "$CURRENT_INDEX")---$BASE_FILE.bam"
        OUTPUT_RESULTS="$OUTPUT_BASE/results/$BASE_FILE/$(basename "$CURRENT_INDEX")---$BASE_FILE.results"

        echo "Output SAM: $OUTPUT_SAM"
        echo "Output Results: $OUTPUT_RESULTS"

        mkdir -p "$OUTPUT_BASE/sam/$BASE_FILE" "$OUTPUT_BASE/bam/$BASE_FILE" "$OUTPUT_BASE/results/$BASE_FILE"
        # time bowtie2 --threads 8 -x "$CURRENT_INDEX" -1 "$R1_FILE" -2 "$R2_FILE" -S "$OUTPUT_SAM" 2>&1 | tee "$OUTPUT_RESULTS"
        samtools view -Sb "$OUTPUT_SAM" | samtools sort - > "$OUTPUT_BAM"
        echo
    done
done

wait

# for SAM_FILE in alignment/sam/$SAM_FILE.sam 
# do
# 	SRR=$(basename $file .sam)
#                  echo $SRR
#                  samtools view -S -b results/sam/${SRR}.sam > results/bam/${SRR}-aligned.bam
# done