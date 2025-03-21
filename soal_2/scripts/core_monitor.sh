LOG_FILE="$HOME/College/sisop/MODUL1/Sisop-1-2025-IT12/soal_2/scripts/logs/core.log"
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
CPU_MODEL=$(lscpu | grep "Model name" | awk -F ':' '{print $2}' | sed 's/^[ \t]*//')

echo "$(date '+%Y-%m-%d %H:%M:%S') - Core Usage [$CPU_USAGE%] - Terminal Model [$CPU_MODEL]" >> "$LOG_FILE"
