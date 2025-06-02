#!/bin/bash

#System Health Checkup

log_file="system_health.log"
echo "System health checkup started $(date +"%Y/%m/%d_%H:%M")" >> $log_file

# Cpu usage 
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'.' -f1)

echo "CPU usage: $cpu_usage %" >> $log_file

if [ "$cpu_usage" -gt 80 ]; then
    echo "High Cpu usage." >> $log_file
fi

# # Memory Usage
total_memory_usage=$(free -g | grep "Mem" | awk '{print $2}')
memory_usage=$(free -g | grep "Mem" | awk '{print $3}')
avilable_memory=$(( memory_usage * 100 / total_memory_usage ))

echo "Total memory: $total_memory_usage gb" >> $log_file
echo "Used memory: $memory_usage gb" >> $log_file
echo "Avilable memory: $avilable_memory %" >> $log_file

if [ "$avilable_memory" -lt 20 ]; then 
    echo "Low avilable memory."
fi

echo "System health checkup completed." >> $log_file
