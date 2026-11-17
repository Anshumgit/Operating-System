#!/bin/bash

WARNING=70
CRITICAL=90

echo "=============================================="
echo "          DISK SPACE USAGE REPORT"
echo "=============================================="

printf "%-15s %-15s %-15s %-15s %-15s %-15s %-15s\n" \
"File System" "Mount Point" "Total" "Used" "Available" "Usage" "Status"

echo "------------------------------------------------------------"

df -hP | tail -n +2 | awk -v warning="$WARNING" -v critical="$CRITICAL" '
{
    usage = $5
    gsub("%", "", usage)

    if (usage >= critical)
        status = "CRITICAL"
    else if (usage >= warning)
        status = "WARNING"
    else
        status = "OK"

    printf "%-15s %-15s %-15s %-15s %-15s %-15s %-15s\n", \
    $1, $6, $2, $3, $4, $5, status

    count++
}

END {
    print "------------------------------------------------------------"
    print "Total File Systems:", count
    print "Warning Threshold:", warning "%"
    print "Critical Threshold:", critical "%"
}
'

echo
echo "Do you want to save the report?"
echo "1. Yes"
echo "2. No"

read -p "Enter the number: " choice

case $choice in
    1)
        df -hP > disk.log
        echo "Report saved successfully."
        ;;
    2)
        echo "Report was not saved."
        ;;
    *)
        echo "Invalid choice."
        ;;
esac
