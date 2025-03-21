LOG_FILE="$HOME/College/sisop/MODUL1/Sisop-1-2025-IT12/soal_2/scripts/logs/fragment.log"

RAM_USAGE=$(free | awk '/Mem:/ {print $3/$2 * 100}')
TOTAL_RAM=$(free -m | awk '/Mem:/ {print $2}')
AVAILABLE_RAM=$(free -m | awk '/Mem:/ {print $7}')

echo "$(date '+%Y-%m-%d %H:%M:%S') - Fragment Usage [$RAM_USAGE%] - Fragment Count [$TOTAL_RAM MB] - Details [Total: $TOTAL_RAM MB, Available: $AVAILABLE_RAM MB]" >> "$LOG_FILE"
