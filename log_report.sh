
#!/bin/bash

# Check whether a log file argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

# Store the filename
LOG_FILE="$1"

# Check whether the file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File does not exist."
    exit 1
fi

# Check whether the file is readable
if [ ! -r "$LOG_FILE" ]; then
    echo "Error: File is not readable."
    exit 1
fi

# Check whether the file is empty
if [ ! -s "$LOG_FILE" ]; then
    echo "Error: Log file is empty."
    exit 1
fi

# Calculate total requests
TOTAL_REQUESTS=$(wc -l < "$LOG_FILE")

# Count HTTP 404 errors
ERROR_404=$(awk '$8 == 404 {count++} END {print count+0}' "$LOG_FILE")

# Find top 3 IP addresses
TOP_IPS=$(awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 3)

# Display report
echo "======================================"
echo "              LOG REPORT"
echo "======================================"

echo ""
echo "Log File       : $LOG_FILE"
echo "Total Requests : $TOTAL_REQUESTS"
echo "404 Errors     : $ERROR_404"

echo ""
echo "Top 3 IP Addresses:"
echo "$TOP_IPS"

echo ""
echo "======================================"
echo "           REPORT COMPLETED"
echo "======================================"
