#!/bin/bash
# menu for log selection
echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3):" choice

# Timestamp for archive naming
timestamp=$(date +"%Y-%m-%d_%H:%M:%S")

# Case structure to handle the user's choice
case $choice in 
1) echo "Archiving heart_rate log..."
log_file="hospital_data/active_logs/heart_rate.log"
archive_dir="heart_data_archive"
archive_file="$archive_dir/heart_rate_$timestamp.log"
;;
2) echo "Archiving temperature_log..."
log_file="hospital_data/active_logs/temperature.log"
archive_dir="temp_data_archive"
archive_file="$archive_dir/temperature_$timestamp.log"
;;
3) echo "Archiving water_usage_log..."
log_file="hospital_data/active_logs/water_usage.log"
archive_dir="water_data_archive"
archive_file="$archive_dir/water_usage_$timestamp.log"
;;
*) echo "Invalid choice.Please enter 1,2,3."
exit 1
;;
esac

#check if the selected log file exists
if [ ! -f "$log_file" ]; then
	echo " Error: Log file not found at $log_file"
	exit 1
fi
#Create the achrive directory if it doesn't exist
mkdir -p "$archive_file"

# Move the active log to the archive with timestamped name
mv "$log_file" "$archive_file"

#Create a new empty log file
touch "$log_file"
echo "Successfully archived to $archive_file"
