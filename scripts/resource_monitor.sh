#!/bin/bash

# Resource Monitoring Script
# Logs CPU and memory usage to a file and displays it on the terminal

# Log file
LOG_FILE="/var/log/resource_monitor.log"

# Ensure the log file exists and is writable
if [ ! -w "$LOG_FILE" ]; then
  echo "Log file $LOG_FILE does not exist or is not writable. Creating it..."
  sudo touch "$LOG_FILE"
  sudo chmod 666 "$LOG_FILE"
fi

# Function to monitor resources
monitor_resources() {
  while true; do
    # Get current timestamp
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

    # Get CPU usage
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')

    # Get memory usage
    MEM_USAGE=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')

    # Log and display the usage
    echo "$TIMESTAMP - CPU Usage: $CPU_USAGE, Memory Usage: $MEM_USAGE" | tee -a "$LOG_FILE"

    # Wait for 5 seconds before the next check
    sleep 5
  done
}

# Start monitoring
monitor_resources
