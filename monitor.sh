#!/bin/bash

# --- Connectivity Monitor for Haiti ISP Stability ---
# Created by: Johnny Oge (A.S. Computer Science)
# This script logs network uptime/downtime to assist in ISP SLA monitoring.

TARGET="8.8.8.8"           # Google DNS (Reliable target)
LOG_FILE="network_log.csv"  # CSV format for easy Excel export
INTERVAL=30                # Seconds between checks

# Create CSV header if file doesn't exist
if [ ! -f "$LOG_FILE" ]; then
    echo "Timestamp,Status,Latency" > "$LOG_FILE"
fi

echo "Monitoring started... Press [CTRL+C] to stop."
echo "Logging to $LOG_FILE"

while true; do
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    
    # Capture ping output and latency
    PING_RESULT=$(ping -c 1 -W 2 $TARGET)
    
    if [ $? -eq 0 ]; then
        # Extract latency (ms) from ping output
        LATENCY=$(echo "$PING_RESULT" | grep 'time=' | awk -F'time=' '{print $2}' | cut -d' ' -f1)
        STATUS="ONLINE"
        echo "[$TIMESTAMP] $STATUS - ${LATENCY}ms"
    else
        LATENCY="N/A"
        STATUS="OFFLINE"
        echo "[$TIMESTAMP] $STATUS - Connection Lost"
    fi

    # Append data to CSV
    echo "$TIMESTAMP,$STATUS,$LATENCY" >> "$LOG_FILE"
    
    sleep $INTERVAL
done
