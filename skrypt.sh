#!/bin/bash

function show_help() {
    echo "Available options:"
    echo "--date, -d          Display today's date"
    echo "--logs, -l [N]      Create N log files (default 100)"
    echo "--error, -e [N]     Create N error files (default 100)"
    echo "--help, -h          Display this help message"
    echo "--init              Clone the repository and set PATH"
}

function create_files() {
    prefix=$1
    num_files=${2:-100}
    for ((i=1; i<=num_files; i++)); do
        dirname="${prefix}${i}"
        mkdir -p ${dirname}
        filename="${dirname}/${prefix}${i}.txt"
        echo "Filename: ${filename}, Script: skrypt.sh, Date: $(date)" > ${filename}
    done
}

if [[ "$1" == "--date" || "$1" == "-d" ]]; then
    date
elif [[ "$1" == "--logs" || "$1" == "-l" ]]; then
    create_files "log" $2
elif [[ "$1" == "--error" || "$1" == "-e" ]]; then
    create_files "error" $2
elif [[ "$1" == "--init" ]]; then
    git clone <URL_REPOZYTORIUM> cloned_repo
    export PATH=$PATH:$(pwd)/cloned_repo
elif [[ "$1" == "--help" || "$1" == "-h" ]]; then
    show_help
else
    echo "Invalid option. Use --help or -h for available options."
fi