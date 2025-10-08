#!/bin/bash

continue_archiving="y"

#Function to handle the actual archiving
archive_log() {
	log_name=$1           # e.g., heart_rate.log
	archive_folder=$2     # e.g., heart_data_archive

	timestamp=$(date +"%Y-%m-%d_%H:%M:%S")
	log_file="hospital_data/active_logs/$log_name"
	archive_file="hospital_data/archived_logs/$archive_folder/${log_name}_$timestamp.log"

# check if file exists
if [-f "$log_file" ]; then
	echo "Archiving $log_name ..."
	mv "$log_file" "archive_file"
	touch "$lof_file" # create new empty file
	echo "Archived successfully to $archive_file"
else
	echo "File $log_file not found!"
fi
}

