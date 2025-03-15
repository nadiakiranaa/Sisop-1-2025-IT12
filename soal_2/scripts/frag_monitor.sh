#!/bin/bash

LOG_DIR="$HOME/log"
LOG_FILE="$LOG_DIR/fragment.log"

mkdir -p "$LOG_DIR"

TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Ambil nilai RAM Total dan RAM Available dalam KB
RAM_TOTAL_KB=$(grep MemTotal /proc/meminfo | awk '{print $2}')
RAM_AVAILABLE_KB=$(grep MemAvailable /proc/meminfo | awk '{print $2}')

# Konversi ke MB
RAM_TOTAL=$((RAM_TOTAL_KB / 1024))
RAM_AVAILABLE=$((RAM_AVAILABLE_KB / 1024))
RAM_USED=$((RAM_TOTAL - RAM_AVAILABLE))

# Hitung persentase penggunaan RAM
RAM_PERCENTAGE=$(awk "BEGIN {printf \"%.2f\", ($RAM_USED / $RAM_TOTAL) * 100}")

echo "[$TIMESTAMP] - Fragment Usage [$RAM_PERCENTAGE%] - Fragment Count [$RAM_USED MB] - Details [Total: $RAM_TOTAL MB, Available: $RAM_AVAILABLE MB]" >> "$LOG_FILE"


