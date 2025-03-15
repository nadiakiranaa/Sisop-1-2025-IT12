clear

# Speak to Me
function speak_to_me() {
    while true; do
        affirmation=$(curl -s https://www.affirmations.dev | jq -r '.affirmation')
        echo "$affirmation"
        sleep 1
    done
}

# On the Run
function on_the_run() {
    echo "Ready, set, go!"
    local progress=0
    local cols=$(tput cols)
    local bar_length=$((cols - 10))

    while (( progress < 100 )); do
        sleep_time=$(echo "scale=2; 0.1 + ($RANDOM % 90) / 100" | bc)
        sleep "$sleep_time"

        (( progress += RANDOM % 10 + 1 ))
        (( progress > 100 )) && progress=100

        local filled=$((progress * bar_length / 100))
        local empty=$((bar_length - filled))


        local bar_filled=$(printf '%0.s>' $(seq 1 $filled))
        local bar_empty=$(printf '%0.s ' $(seq 1 $empty))

        echo -ne "\r\033[1;32m${bar_filled}\033[1;31m${bar_empty}\033[0m ${progress}% (${remaining_time}s)"
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
        unimatrix -a -b -c blue -g black -u '$ ﷼  € £ ¥ ¢ ₹ ₩ ₿ ₣ ₽ ¤ ₱ ₦ ƒ ₮ ௹ ฿ ៛ ₪ ₫'
        sleep 1
        done
}


# Brain Damage
function brain_damage() {
    while true; do
        clear
        echo "Task Manager"
        ps aux --sort=-%mem | head -10
        sleep 1
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
