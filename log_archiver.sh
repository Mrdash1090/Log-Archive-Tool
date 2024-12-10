#!/bin/bash

# Function to display usage information

function usage(){
    echo "Usage: $0 <log_directory> [-o <output_directory>]"
    echo " - log_directory: The directory containing logs to be archived."
    echo " - output_directory (optional): The directory to store the archive. Defaults to 'log_archives'."
    exit 1

}

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    usage
fi

# Parse arguments
LOG_DIR=$1
OUTPUT_DIR="log_archives" # Default output directory

while [ "$#" -gt 0 ]; do
    case $1 in
        -o|--output_directory)
            shift
            OUTPUT_DIR=$1
            ;;
    esac
    shift
done


# Ensure the log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: The directory '$LOG_DIR' does not exist."
    exit 1
fi

# Ensure the output directory exists or create it
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
fi


# Generate timestamped archive name
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="${OUTPUT_DIR}/${ARCHIVE_NAME}"


# Compress logs
tar -czf "$ARCHIVE_PATH" -C "$LOG_DIR" .


# Log the operation
LOG_FILE="${OUTPUT_DIR}/archive_log.txt"
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Archived $LOG_DIR to $ARCHIVE_PATH" >> "$LOG_FILE"

# Print success message
echo "Logs compressed to: $ARCHIVE_PATH"
echo "Archive log updated at: $LOG_FILE"