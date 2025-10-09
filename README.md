README.md
Log Analysis & Reporting System
Overview

This project is a bash-based log analysis and reporting system designed to help users efficiently archive, analyze, and summarize logs from various devices.

The system automates the workflow in three main steps:

Archiving logs – Safely move processed logs to an archive.

Analysis – Count occurrences of devices, and record timestamps of first and last entries.

Reporting – Append results to a centralized report file for record-keeping.

Project Structure
project/
│
├── logs/                     # Active log files to be analyzed
│   ├── heart_rate.log
│   ├── temperature.log
│   └── water_usage.log
│
├── archive/                  # Archived logs
│
├── reports/                  # Analysis reports
│   └── analysis_report.txt
│
├── archive_logs.sh           # Script for archiving logs
├── analyze_logs.sh           # Script for analyzing logs and generating reports
└── README.md                 # Project documentation

 Workflow Summary
 Archiving Logs (archive_logs.sh)

Purpose:

Moves selected logs from logs/ to archive/.

Ensures safe storage and avoids clutter in the active log folder.

Features:

Interactive menu for selecting logs to archive.

Renames archived logs to avoid overwriting.

Supports multiple log archiving in a loop.

Analyzing Logs (analyze_logs.sh)

Purpose:

Counts the number of occurrences for each device in a log file.

Records timestamps of first and last entries.

Appends the results to reports/analysis_report.txt.

Example Log Line:

[2025-10-09 12:34:56] DeviceA - Sample log message


Analysis Output Example:

Device          Count      First Entry               Last Entry
------          -----      -----------               -----------
DeviceA         15         2025-10-09 12:00:01       2025-10-09 14:42:33
DeviceB         9          2025-10-09 12:03:22       2025-10-09 13:51:20

Reporting

All analysis results are appended to reports/analysis_report.txt.

Maintains historical records of device activity and log insights.

Script Overview
Script	Function
archive_logs.sh	Interactive script for moving selected logs to archive.
analyze_logs.sh	Counts device occurrences and timestamps; appends results to report.
Workflow Summary

Logs are written into logs/ by devices or manually.

Use archive_logs.sh to archive old logs.

Run analyze_logs.sh to extract insights.

Check reports/analysis_report.txt for the summary report.

Requirements

Linux or macOS terminal (Windows users can use WSL).

Bash and standard Unix utilities (awk, mv, etc.).

Author

Ayomide Ojudun
Student Developer
African Leadership University, (ALU)
