source ./common_values.sh

mkdir -p alignment

for BASE_FILE in "Exp1sh90KP3" "Exp1shCP3" "Exp4sh90KP3" "Exp4shCP3"; do
    for CURRENT_INDEX in "$INDEX2" "$INDEX3" "$INDEX"; do
        echo base file: $BASE_FILE
        echo current index: $CURRENT_INDEX
        R1_FILE="../30-1189397265/00_fastq/${BASE_FILE}_R1_001.fastq.gz"
        echo R1: $R1_FILE
        R2_FILE="../30-1189397265/00_fastq/${BASE_FILE}_R2_001.fastq.gz"
        echo R2: $R2_FILE

        bowtie2 -x "$CURRENT_INDEX" -1 "$R1_FILE" -2 "$R2_FILE" -S "alignment/$(basename "$CURRENT_INDEX")---$BASE_FILE.sam"
        echo
    done
done