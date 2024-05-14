#!/bin/bash

# Gets parent folder
parent_folder="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Threads count
threads=(1 2 4 8 16 32 64)


# Runs sysbench for each thread count and append the output to chameleonBMLogs_disk.log
  for thread_count in "${threads[@]}"; do
        echo sysbench fileio --file-num=128 --file-block-size=4096 --file-total-size=120G \
            --file-test-mode=rndrd --file-io-mode=sync --file-extra-flags=direct \
            --threads=$thread_count prepare >> "$parent_folder/logs/BareMetal/chameleonBMLogs_disk.log"
        sysbench fileio --file-num=128 --file-block-size=4096 --file-total-size=120G \
            --file-test-mode=rndrd --file-io-mode=sync --file-extra-flags=direct \
            --threads=$thread_count prepare >> "$parent_folder/logs/BareMetal/chameleonBMLogs_disk.log"
        echo sysbench fileio --file-num=128 --file-block-size=4096 --file-total-size=120G \
            --file-test-mode=rndrd --file-io-mode=sync --file-extra-flags=direct \
            --threads=$thread_count run >> "$parent_folder/logs/BareMetal/chameleonBMLogs_disk.log"
        sysbench fileio --file-num=128 --file-block-size=4096 --file-total-size=120G \
            --file-test-mode=rndrd --file-io-mode=sync --file-extra-flags=direct \
            --threads=$thread_count run >> "$parent_folder/logs/BareMetal/chameleonBMLogs_disk.log"
        echo sysbench fileio --file-num=128 --file-block-size=4096 --file-total-size=120G \
            --file-test-mode=rndrd --file-io-mode=sync --file-extra-flags=direct \
            --threads=$thread_count cleanup >> "$parent_folder/logs/BareMetal/chameleonBMLogs_disk.log"
        sysbench fileio --file-num=128 --file-block-size=4096 --file-total-size=120G \
            --file-test-mode=rndrd --file-io-mode=sync --file-extra-flags=direct \
            --threads=$thread_count cleanup >> "$parent_folder/logs/BareMetal/chameleonBMLogs_disk.log"
    done

echo "Sysbench benchmark completed."