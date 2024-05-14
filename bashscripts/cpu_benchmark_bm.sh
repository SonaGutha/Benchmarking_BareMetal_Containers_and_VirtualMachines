#!/bin/bash
#gets parent folder
parent_folder="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# threads count
threads=(1 2 4 8 16 32 64)

# Runs sysbench for each thread count and append the output to chameleonBMLogs.log
for thread_count in "${threads[@]}"; do
    echo sysbench cpu --cpu-max-prime=100000 --threads=$thread_count run >> "$parent_folder/logs/BareMetal/chameleonBMLogs.log"
    sysbench cpu --cpu-max-prime=100000 --threads=$thread_count run >> "$parent_folder/logs/BareMetal/chameleonBMLogs.log"
done

echo "Sysbench benchmark completed."
