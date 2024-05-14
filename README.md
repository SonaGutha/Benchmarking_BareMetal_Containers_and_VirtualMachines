### CS553 Cloud Computing Assignment 2 Repo
**Illinois Institute of Technology**  

**Student**:  
* Sona Shree Reddy Gutha

- hw2-report.pdf consists of overall assignment2 report. It includes the chameleon bare metal instance details, virtual machine and container setup. It consists of the CPU, Memory, Disk, Network benchmarking results summarized in tabular format and grahical representation. It also consists screenshots of manual execution of benchmark commands

- scripts folder consists python scripts which is used to generate bargraphs for the benchmark results. python script requires python matplotlib and pandas. If not already install, it can be installed by running "pip install matplotlib" & "pip install pandas" in terminal and the python script can be executed after installing.

    Ex : python3 cpu_benchmark_graph.py

- input folder consists of the benchmark summarized results for cpu, memory, disk, network in txt files, which is used as an input to generate graphs

- graphs folder consists of the benchmark results summarized as graphs generated which areb generated while running python scripts 
 
- logs folder consists of the raw output logs containing the output of each of a benchmark conducted. There are different log files based on the different virtualization type. Each virtualization log folder contains separate log file for CPU,Memory,Disk,Network benchmark logs
    logs
        -BareMetal
        -Container
        -VirtualMachine

- bashscripts folder consists of the benchmark bash scripts. These are separate scripts for CPU,Memory,disk,Network for each vitualization type. These scripts runs upto 64 threads automatically. These scripts can be run as below.
eg: chmod +x cpu_benchmark_bm.sh  which gives permission to be executed as script and then run to execute the script
    ./cpu_benchmark_bm.sh

  







