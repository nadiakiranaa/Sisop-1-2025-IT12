#!/bin/bash

LOG_FILE_DIR= "$HOME/log"
CORE_SCRIPT="$HOME/scripts/core_monitor.sh"
FRAG_SCRIPT="$HOME/scripts/frag_monitor.sh"
CORE_JOB_FILE="$HOME/.cron_jobs"

mkdir -p "LOG_DIR"

add_cpu_monitor(){
(crontab -l 2>/dev/null; echo "* * * * * $CORE_SCRIPT") | crontab -
echo "CPU monitoring added to crontab."
}

add_ram_monitor(){
(crontab -l 2>/dev/null; echo "* * * * * $FRAG_SCRIPT") | crontab -
echo "RAM monitoring added to crontab."
}

rm_cpu_monitor(){
crontab -l 2>/dev/null | grep -v "$CORE_SCRIPT" | crontab -
echo "CPU monitoring removed from corntab."
}

rm_ram_monitor(){
crontab -l 2>/dev/null | grep -v "$FRAG_SCRIPT" | crontab -
echo "RAM monitoring removed from corntab."
}

view_active_job(){
echo "Scheduled Jobs B**:"
crontab -l 2>/dev/null | grep "$CORE_SCRIPT\|$FRAG_SCRIPT" || echo "Tidak ada monitoring yang aktif sir"
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
        6) echo "Keluar ArCaea Terminal."
           exit 0 
	   ;;
        *) echo "Invalid option!"
	   ;;
    esac
done
