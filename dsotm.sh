clear

# Speak to Me
function speak_to_me() {
    while true; do
        affirmation=$(curl -s https://www.affirmations.dev | jq -r '.affirmation')
        echo "$affirmation"
        sleep 2
    done
}

# On the Run
function on_the_run() {
    echo "Ready, set, go!"
    local progress=0
    local bar_length=100

    while [ $progress -lt 100 ]; do
        sleep_time=$(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
        sleep "$sleep_time"
        progress=$((progress + RANDOM % 10 + 1))
        if [ $progress -gt 100 ]; then
            progress=100
        fi

        filled=$((progress * bar_length / 100))
        empty=$((bar_length - filled))
        bar=$(printf "%-${filled}s" "#" | tr ' ' '#')
        spaces=$(printf "%-${empty}s" " ")

        echo -ne "\r [${bar}${spaces}] ${progress}%"
    done
    echo -e "\nDone!\n"
}

# Time
function show_time() {
    while true; do
        clear
        echo "$(date '+%Y-%m-%d %H:%M:%S')"
        sleep 1
    done
}

# Money
function test() {
        trap "tput cnorm; exit" SIGINT
        while true; do
        unimatrix -u '$ € £ ¥ ¢ ₹ ₩ ₿ ₣ ₽ ¤ ₱ ₦ ƒ ₮ ௹ ฿ ៛ ₪ ₫'
        sleep 1
        done
}


# Brain Damage
function brain_damage() {
    while true; do
        clear
        echo "Task Manager"
        ps aux --sort=-%mem | head -10
        sleep 2
    done
}

# Main case statement
case "$1" in
    --play="Speak to Me")
        speak_to_me
        ;;
    --play="On the Run")
        on_the_run
        ;;
    --play="Time")
        show_time
        ;;
    --play="Money")
        test
        ;;
    --play="Brain Damage")
        brain_damage
        ;;
    --play="Test")
        test
        ;;
    *)
        echo "Penggunaan: ./dsot.sh --play=\"<Track>\""
        echo "Track yang tersedia: Speak to Me, On the Run, Time, Money, Brain Damage"
exit 1
;;

esac
