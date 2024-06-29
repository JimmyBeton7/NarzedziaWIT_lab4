#!/bin/bash

function show_help() {
    echo "Available options:"
    echo "--date, -d      Display today's date"
    echo "--logs, -l [N]  Create N log files (default 100)"
    echo "--help, -h      Display this help message"
}

if [[ "$1" == "--date" || "$1" == "-d" ]]; then
    date
elif [[ "$1" == "--logs" || "$1" == "-l" ]]; then
    num_files=${2:-100}
    for ((i=1; i<=num_files; i++)); do
        filename="log${i}.txt"
        echo "Filename: ${filename}, Script: skrypt.sh, Date: $(date)" > ${filename}
    done
elif [[ "$1" == "--help" || "$1" == "-h" ]]; then
    show_help
else
    echo "Invalid option. Use --help or -h for available options."
fi