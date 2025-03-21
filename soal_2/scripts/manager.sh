#!/bin/bash

LOG_FILE_DIR="$HOME/College/sisop/MODUL1/Sisop-1-2025-IT12/soal_2/scripts/logs"
CORE_SCRIPT="$HOME/College/sisop/MODUL1/Sisop-1-2025-IT12/soal_2/scripts/core_monitor.sh"
FRAG_SCRIPT="$HOME/College/sisop/MODUL1/Sisop-1-2025-IT12/soal_2/scripts/frag_monitor.sh"

mkdir -p "$LOG_FILE_DIR"

add_cpu_monitor(){
    if [[ ! -f "$CORE_SCRIPT" ]]; then
        echo "Error: $CORE_SCRIPT tidak ditemukan!"
        return 1
    fi
    (crontab -l 2>/dev/null; echo "* * * * * $CORE_SCRIPT") | crontab -
    echo "CPU monitoring added to crontab."
}

add_ram_monitor(){
    if [[ ! -f "$FRAG_SCRIPT" ]]; then
        echo "Error: $FRAG_SCRIPT tidak ditemukan!"
        return 1
    fi
    (crontab -l 2>/dev/null; echo "* * * * * $FRAG_SCRIPT") | crontab -
    echo "RAM monitoring added to crontab."
}

rm_cpu_monitor(){
    crontab -l 2>/dev/null | grep -v "$CORE_SCRIPT" | crontab -
    echo "CPU monitoring removed from crontab."
}

rm_ram_monitor(){
    crontab -l 2>/dev/null | grep -v "$FRAG_SCRIPT" | crontab -
    echo "RAM monitoring removed from crontab."
}

view_active_job(){
    echo "Scheduled Jobs:"
    crontab -l 2>/dev/null | grep "$CORE_SCRIPT\|$FRAG_SCRIPT" || echo "Tidak ada monitoring yang aktif."
}

while true; do
    echo "======================"
    echo "   ARCAEA TERMINAL   "
    echo "======================"
    echo "1) Add CPU - Core Monitor to Crontab"
    echo "2) Add RAM - Fragment Monitor to Crontab"
    echo "3) Remove CPU - Core Monitor from Crontab"
    echo "4) Remove RAM - Fragment Monitor from Crontab"
    echo "5) View All Scheduled Monitoring Jobs"
    echo "6) Exit Arcaea Terminal"
    echo "======================"
    read -p "Enter option [1-6]: " choice

    case $choice in
        1) add_cpu_monitor ;;
        2) add_ram_monitor ;;
        3) rm_cpu_monitor ;;
        4) rm_ram_monitor ;;
        5) view_active_job ;;
        6) echo "Keluar Arcaea Terminal."; exit 0 ;;
        *) echo "Invalid option!" ;;
    esac
done
