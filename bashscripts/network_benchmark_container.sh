#!/bin/bash
#gets parent folder
parent_folder="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Function to run client with specified thread count
run_client() {
    local thread_count=$1

    echo iperf -c 127.0.0.1 -e -i 1 --nodelay -l 8192K --trip-times --parallel $thread_count  >> "$parent_folder/logs/Container/chameleonContainerLogs_nw.log"
    iperf -c 127.0.0.1 -e -i 1 --nodelay -l 8192K --trip-times --parallel $thread_count  >> "$parent_folder/logs/Container/chameleonContainerLogs_nw.log"
}

# Run iperf server 
echo iperf -s -w 1M >> "$parent_folder/logs/Container/chameleonContainerLogs_nw.log"
iperf -s -w 1M >> "$parent_folder/logs/Container/chameleonContainerLogs_nw.log" &

# sleep for 2 for the server to start
sleep 2

# Run iperf client with multiple threads 
thread_counts=(1 2 4 8 16 32 64)
for threads in "${thread_counts[@]}"; do
    run_client "$threads" >> "$parent_folder/logs/Container/chameleonContainerLogs_nw.log"
done
echo "Sysbench benchmark completed."
# Terminate the iperf server
kill $(pgrep iperf) >> "$parent_folder/logs/Container/chameleonContainerLogs_nw.log"
