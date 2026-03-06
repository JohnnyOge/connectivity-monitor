# connectivity-monitor
A Bash-based tool to log ISP stability and network downtime in Haiti.
# Connectivity Monitor 🇭🇹
A lightweight Bash utility designed for the Haitian context to track and log ISP stability.

## Features
- **Real-time Monitoring:** Checks connection every 30 seconds.
- **Data Logging:** Saves results to `network_log.csv` for technical analysis.
- **Latency Tracking:** Measures response time to detect "slow" vs "down" internet.

## How to Run
1. Give execution permission: `chmod +x monitor.sh`
2. Run the script: `./monitor.sh`
