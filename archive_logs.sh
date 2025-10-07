#!/bin/bash

continue_archiving="y"

#Function to handle the actual archiving
archive_log() {
  log_name=$1         # e.g., heart_rate.log
  archive_folder=$2   # e.g., heart_data_archive

  timestamp=$(date +"%Y-%m-%d_%H:%M:%S")
  log_file="hospital_data/active_logs/$log_name"
  archive_file="hospital_data/archived_logs/$archive_folder/${log_name}_$timestamp.log"


  # Check if file exists
  if [ -f "$log_file" ]; then
    echo "Archiving $log_name..."
    mv "$log_file" "$archive_file"
    touch "$log_file"  # create new empty file
    echo "Archived successfully to $archive_file"
  else
    echo "⚠️ File $log_file not found!"
  fi
}

#Loop until user says no
while [[ "$continue_archiving" == "y" || "$continue_archiving" == "Y" ]]; do
  echo "Select log to archive:"
  echo "1) Heart Rate"
  echo "2) Temperature"
  echo "3) Water Usage"
  read -p "Enter choice (1-3): " choice

  case $choice in
    1)
      archive_log "heart_rate_log.log" "heart_data_archive"
      ;;
    2)
      archive_log "temperature_log.log" "temperature_data_archive"
      ;;
    3)
      archive_log "water_usage_log.log" "water_usage_data_archive"
      ;;
    *)
      echo "Invalid choice! Please enter 1, 2, or 3."
      ;;
  esac

  read -p "Do you want to archive another log? (y/n): " continue_archiving
done

echo "Archiving complete. Goodbye!"

