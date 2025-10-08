#!/bin/bash

continue_archiving="y"

#Function to handle the actual archiving
archive_log() {
	log_name=$1       # e.g., heart_rate.log
	archive_folder=$2 # e.g., heart_rate_archive

	timestamp=$(date +"%Y-%m-%d_%H:%M:%S")
	log_file="hospital_data/active_logs/$log_name"
	archive_file="hospital_data/archive_logs/$archive_folder/${log_name}_$timpestamp.log"

	#check if file exists
	if [ -f "$log_file" ]; then
		echo "Archiving $log_name ..."
		mv "$log_file" "$archive_file"
		touch "$log_file"  # create new empty file"
		echo "Archived successfully to $archive_file"
	fi
}

