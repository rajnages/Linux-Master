#!/bin/bash

# Set the report file location
report_file="/tmp/disk_usage_report.log"

# Generate the disk usage report and save to the file
echo "Disk Usage Report - $(date)" >$report_file
df -h >>$report_file
du -sh /home/* >>$report_file

echo "Disk usage report saved to $report_file"
