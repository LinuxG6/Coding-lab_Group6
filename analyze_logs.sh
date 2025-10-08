#!/bin/bash
echo ""
echo "Which log do you want to analyze?"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " choice
if [ "$choice" != "1" ] && [ "$choice" != "2" ] && [ "$choice" != "3" ]; then
    echo "Invalid choice! Run the script again and enter 1, 2, or 3."
    exit
fi
if [ "$choice" == "1" ]; then
    logfile="hospital_data/active_logs/heart_rate_log.log"
elif [ "$choice" == "2" ]; then
    logfile="hospital_data/active_logs/temperature_log.log"
else
    logfile="hospital_data/active_logs/water_usage_log.log"
fi

#see if the file to be analysed exists

if [ ! -f "$logfile" ]; then
    echo "Error: Log file '$logfile' not found!"
    exit 1
fi

#Then Analysis starts
echo ""
echo "Analyzing $logname log..."
echo "------------------------------------------"

#Counting occurences of each device

echo "Device Counts:"
awk '{print $3}' "$logfile" | sort | uniq -c

#First and last time stamp

echo ""
echo "Timestamp Summary (Bonus):"

# First, get a list of unique devices
devices=$(awk '{print $3}' "$logfile" | sort | uniq)

for dev in $devices; do
    # Filter log lines for this device
    dev_lines=$(grep "$dev" "$logfile")

    # Get first timestamp for the device
    first_ts=$(echo "$dev_lines" | head -1 | awk '{print $1"_"$2}')

    # Get last timestamp for the device
    last_ts=$(echo "$dev_lines" | tail -1 | awk '{print $1"_"$2}')

    # Print nicely
    echo "$dev -> First: $first_ts | Last: $last_ts"
done
echo ""

# ----------------------------
# Save results to report
# ----------------------------
report_file="hospital_data/reports/analysis_report.txt"

{
    echo "------------------------------------------"
    echo "Analysis Report - $logname"
    echo "Date: $(date)"
    echo "------------------------------------------"
    
    echo "Device Counts:"
    awk '{print $3}' "$logfile" | sort | uniq -c
    
    echo ""
    echo "Timestamp Summary:"
    for dev in $devices; do
        dev_lines=$(grep "$dev" "$logfile")
        first_ts=$(echo "$dev_lines" | head -1 | awk '{print $1"_"$2}')
        last_ts=$(echo "$dev_lines" | tail -1 | awk '{print $1"_"$2}')
        echo "$dev -> First: $first_ts | Last: $last_ts"
    done
    
    echo ""
} >> "$report_file"

echo ""
echo "✅ Analysis complete! Results appended to $report_file"
echo ""
