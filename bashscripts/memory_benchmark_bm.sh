#!/bin/bash
#gets parent folder
parent_folder="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# threads count
threads=(1 2 4 8 16 32 64)

# Runs sysbench for each thread count and append the output to chameleonBMlogs_memory.log
for thread_count in "${threads[@]}"; do
    echo memory --memory-block-size=1K --memory-total-size=120G --threads=$thread_count run >> "$parent_folder/logs/BareMetal/chameleonBMlogs_memory.log"
    sysbench memory --memory-block-size=1K --memory-total-size=120G --threads=$thread_count run >> "$parent_folder/logs/BareMetal/chameleonBMlogs_memory.log"
done

echo "Sysbench benchmark completed."
