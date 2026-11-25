# Linux Shell Scripting and Automation

## Project Overview

This project demonstrates practical Linux administration and automation using Bash scripting.

It contains two shell scripts:

1. **sysinfo.sh** – Collects system information, including hostname, date and time, logged-in user, disk usage, memory usage and top five processes by memory consumption.
2. **log_report.sh** – Analyzes web server access logs and generates a report containing total requests, HTTP 404 errors and the top three IP addresses generating requests.

The project also demonstrates Linux file permissions, command-line arguments, error handling, Cron scheduling and Git version control.

## Technologies Used

- Ubuntu Linux (WSL 2)
- Bash Shell Scripting
- Git and GitHub
- Linux utilities: `awk`, `grep`, `sort`, `uniq`, `head`, `df`, `free`, `ps`
- Cron

## Project Structure

```text
Linux-Scripting/
│
├── sysinfo.sh
├── log_report.sh
├── sample_access.log
├── sysinfo_2026-11-25.txt
└── README.md
```

## 1. System Information Script

### Description

The `sysinfo.sh` script collects and displays important system information.

### Features

- Displays hostname.
- Displays current date and time.
- Displays logged-in username.
- Displays root filesystem disk usage.
- Displays memory usage.
- Lists the top five processes by memory consumption.
- Saves the report into a dated text file.

### Execution

```bash
chmod +x sysinfo.sh
./sysinfo.sh
```

### Output

```text
System report saved to: sysinfo_2026-11-25.txt
```

The generated report can be viewed using:

```bash
cat sysinfo_$(date +%Y-%m-%d).txt
```

## 2. Web Server Log Analysis Script

### Description

The `log_report.sh` script analyzes an Apache-style access log and generates a summary report.

### Features

- Counts total requests.
- Counts HTTP 404 errors.
- Identifies the top three IP addresses by request frequency.
- Validates command-line arguments.
- Checks whether the specified file exists and is readable.
- Handles empty log files.

### Execution

```bash
chmod +x log_report.sh
./log_report.sh sample_access.log
```

### Sample Output

```text
======================================
              LOG REPORT
======================================

Log File       : sample_access.log
Total Requests : 10
404 Errors     : 4

Top 3 IP Addresses:
      5 192.168.1.10
      3 192.168.1.15
      2 192.168.1.20

======================================
           REPORT COMPLETED
======================================
```

### Error Handling

Missing argument:

```bash
./log_report.sh
```

Non-existent file:

```bash
./log_report.sh unknown.log
```

Empty file:

```bash
./log_report.sh empty.log
```

## 3. Cron Job Automation

The system information script can be scheduled to execute automatically every hour using Cron.

### Cron Configuration

```bash
crontab -e
```

Add:

```bash
0 * * * * cd /home/nihal/devops-assignment/assignment-1 && ./sysinfo.sh
```

Verify the scheduled job:

```bash
crontab -l
```

This schedules the script to run at the beginning of every hour.

Note: Cron execution requires the Cron service and WSL environment to be running.

## 4. Important Linux Commands Used

| Command | Purpose |
|---|---|
| `hostname` | Displays system hostname |
| `date` | Displays current date and time |
| `whoami` | Displays logged-in user |
| `df -h` | Displays disk usage |
| `free -h` | Displays memory usage |
| `ps aux` | Lists running processes |
| `awk` | Extracts and processes log fields |
| `sort` | Sorts data |
| `uniq -c` | Counts repeated entries |
| `head` | Displays the first lines |
| `chmod +x` | Adds executable permission |
| `crontab -e` | Edits scheduled tasks |
| `git` | Tracks and manages project versions |

## 5. Concepts Demonstrated

- Bash scripting and command execution
- Linux file permissions
- Variables and command-line arguments
- Conditional statements
- Command substitution
- Pipes and output redirection
- Text processing and log analysis
- Input validation and error handling
- Task scheduling using Cron
- Git version control

## 6. Repository

GitHub: https://github.com/ASEEMNIHAL1/Linux-Scripting

---

**Project:** Linux Shell Scripting and Automation  
**Environment:** Ubuntu Linux on WSL 2  
**Language:** Bash
