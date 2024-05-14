import matplotlib.pyplot as graph
import pandas as d
import os

def read_data(path):
    #reads the data from the specified file 
    return d.read_csv(path) 

def group_file_data(filedata):
    # groups the date read from file based on virtualizationType and thread count
    return filedata.groupby(['virtualizationType', 'threads']).mean().reset_index()

def pivot_virtualization(grouped_data):
    # sets virtualization as column
    return grouped_data.pivot(index='threads', columns='virtualizationType', values=['efficiency', 'totaloperations', 'throughput'])

def efficiency(ax, data,label):
    # plots efficiency graph
    data.plot(kind='bar', ax=ax,  label=label)
    ax.set_ylabel('Efficiency(%)')
    ax.legend(loc="upper right")
    ax.set_title(label)

def totaloperations(ax, data, label):
    # plots average latency graph
    data.plot(kind='bar', ax=ax, label=label)
    ax.set_ylabel('Total Operations')
    ax.legend(loc="upper right")
    ax.set_title(label)

def throughput(ax, data, label):
    # plots through put graph
    data.plot(kind='bar', ax=ax,  label=label)
    ax.set_ylabel('Measured Throughput(MiB/s)')
    ax.legend(loc="upper right")
    ax.set_title(label)

def set_subplot_labels(axes, grouped_data):
    # sets subplots labels
    axes[-1].set_xticks(range(len(grouped_data.index)))
    axes[-1].set_xticklabels(grouped_data.index)
    axes[-1].set_xlabel('threads')

def show_graph():
    # generated graph
    graph.show()
    #saves the graph in the specified path
    graph.savefig(os.path.join(os.path.dirname(os.path.abspath(__file__)),'..','graphs','disk_benchmark.png'))

def main(path):
    # reads the data from file
    file_data = read_data(path)
    # groups file data
    grouped_data = group_file_data(file_data)
    #pivot virtualization type
    pivot_data = pivot_virtualization(grouped_data)

    # plots 3 different graphs of mentioned size
    fig, axes = graph.subplots(3, 1, figsize=(12, 20))

    # plots Efficiency
    efficiency(axes[0], pivot_data['efficiency'], label='Efficiency Graph')

    # plots total operations
    totaloperations(axes[1], pivot_data['totaloperations'], label='Total Operations Graph')

    # plots Throughput
    throughput(axes[2], pivot_data['throughput'], label='Measured Throughput(MiB/s) Graph')

    set_subplot_labels(axes, pivot_data)

    # set graph title
    fig.suptitle('Disk Benchmark Results', y=1)

    show_graph()

main(os.path.join(os.path.dirname(os.path.abspath(__file__)),'..','input','disk_benchmark.txt'))
