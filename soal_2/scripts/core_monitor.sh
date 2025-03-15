#!/bin/bash

LOG_DIR="$HOME/log"
LOG_FILE="$HOME/log/core.log"

mkdir -p "$LOG_DIR"

TIME=$(date +"%Y-%m-%d %H:%M:%S")
CPUU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPUM=$(lscpu | grep -m1 "Model name" | cut -d ':' -f2 | sed 's/^ *//')

echo "[$TIME] - Core Usage [$CPUU%] - Terminal Model [$CPUM]" >> "$LOG_FILE"
