
#!/bin/bash

# Generate filename using current date
REPORT_FILE="sysinfo_$(date +%Y-%m-%d).txt"

# Generate system report and save it
{
    echo "======================================"
    echo "          SYSTEM INFORMATION"
    echo "======================================"

    echo ""
    echo "Hostname:"
    hostname

    echo ""
    echo "Current Date and Time:"
    date

    echo ""
    echo "Logged-in User:"
    whoami

    echo ""
    echo "Disk Usage of Root Directory:"
    df -h /

    echo ""
    echo "Memory Usage:"
    free -h

    echo ""
    echo "Top 5 Processes by Memory Usage:"
    ps aux --sort=-%mem | head -n 6

    echo ""
    echo "======================================"
    echo "          REPORT COMPLETED"
    echo "======================================"

} > "$REPORT_FILE"

echo "System report saved to: $REPORT_FILE"
