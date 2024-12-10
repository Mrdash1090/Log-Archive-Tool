URL: https://roadmap.sh/projects/log-archive-tool

# Log Archiver Tool

The **Log Archiver Tool** is a CLI utility for compressing and archiving system logs. It supports both Python and Bash implementations, allowing you to manage system logs efficiently by compressing them into timestamped `.tar.gz` archives and maintaining a log history.

---

## Features

- Compress logs into `.tar.gz` files with unique timestamps.
- Log the archive history in a text file.
- Support for custom output directories.
- Available in both Python and Bash for flexibility.
- Ideal for Unix-based systems where logs are stored in `/var/log`.

---

## Requirements

### Python Script
- Python 3.6 or higher.

### Bash Script
- A Unix-based system with `bash`, `tar`, and `mkdir` installed.

---

## Installation

1. Clone this repository:
   git clone <project-page-url>
   cd log-archiver
   

2. For Python:
   Ensure Python is installed:
  
   python --version
   
   *(No additional dependencies are required.)*



## Usage

### Python Script

1. Save the Python script as `log_archiver.py`.
2. Run the script from the command line:
   - Archive logs in `/var/log` and store them in the default directory (`log_archives`):
   
     python log_archiver.py /var/log
     
   - Archive logs with a custom output directory:
   
     python log_archiver.py /var/log -o /path/to/output
    

### Bash Script

1. Save the Bash script as `log_archiver.sh`.
2. Make it executable:
  
   chmod +x log_archiver.sh
  
3. Run the script:
   - Archive logs in `/var/log` and store them in the default directory (`log_archives`):
    
     ./log_archiver.sh /var/log
 
   - Archive logs with a custom output directory:
   
     ./log_archiver.sh /var/log -o /path/to/output
   


## Output

- Compressed archive: `logs_archive_<timestamp>.tar.gz`
- Archive log file: `archive_log.txt`

Both will be stored in the specified or default output directory.

---

## Logging

The tool automatically maintains a log file (`archive_log.txt`) in the output directory, recording:
- Source directory
- Archive file path
- Date and time of each operation

---


---



---

## Contributing

Feel free to submit issues or pull requests to improve this tool. Contributions are welcome!


