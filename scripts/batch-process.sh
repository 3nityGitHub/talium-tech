#!/bin/bash
FOLDER_PATH=~/talium-tech/database/patients
LOG_FILE=~/talium-tech/logs/batch.log
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
DATE=$(date +%F)
COUNTER=1
TOTAL=0

# Step 1 — create folder
mkdir -p $FOLDER_PATH

# Step 2 — create 10 patient files
for i in {1..10}; do
    echo "Patient ID: $i" > $FOLDER_PATH/patient_$i.txt
    echo "Date: $(date)" >> $FOLDER_PATH/patient_$i.txt
    echo "Created patient_$i.txt"
done

echo ""
echo "--- Files created ---"
ls $FOLDER_PATH

# Step 3 — preview rename
echo ""
echo "--- Rename preview ---"
for file in $FOLDER_PATH/patient_*.txt; do
    echo "Will rename: $(basename $file) → ${DATE}_$(basename $file)"
done

# Step 4 — apply rename
for file in $FOLDER_PATH/patient_*.txt; do
    mv "$file" "$FOLDER_PATH/${DATE}_$(basename $file)"
done

echo ""
echo "--- Files after rename ---"
ls $FOLDER_PATH

# Step 5 — count lines in each file
echo ""
echo "--- Line count per file ---"
for file in $FOLDER_PATH/*.txt; do
    lines=$(wc -l < $file)
    echo "$(basename $file) — $lines lines"
    TOTAL=$((TOTAL + 1))
done

# Step 6 — while loop
echo ""
echo "--- Processing patients ---"
while [ $COUNTER -le 10 ]; do
    echo "Processing patient $COUNTER"
    COUNTER=$((COUNTER + 1))
done

# Step 7 — save summary to log
echo "$TIMESTAMP | Total files processed: $TOTAL" >> $LOG_FILE
echo ""
echo "Done"
echo "Summary saved to $LOG_FILE"
