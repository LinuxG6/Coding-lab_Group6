#!/bin/bash
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
    logfile="hospital_data/active_logs/heart_rate.log"
elif [ "$choice" == "2" ]; then
    logfile="hospital_data/active_logs/temperature.log"
else
    logfile="hospital_data/active_logs/water_usage.log"
fi

