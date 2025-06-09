source ./common_values.sh

for BASE_FILE in "Exp1sh90KP3" "Exp1shCP3" "Exp4sh90KP3" "Exp4shCP3"; do
    echo base file: $BASE_FILE
    R1_FILE="../30-1189397265/00_fastq/${BASE_FILE}_R1_001.fastq.gz"
    echo R1: $R1_FILE
    R2_FILE="../30-1189397265/00_fastq/${BASE_FILE}_R2_001.fastq.gz"
    echo R2: $R2_FILE

    bowtie2 -x "$INDEX2" -1 "$R1_FILE" -2 "$R2_FILE" -S "$BASE_FILE.sam"
    echo
done