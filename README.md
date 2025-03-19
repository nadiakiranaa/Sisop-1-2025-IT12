# Sisop-1-2025-IT12

### Soal Modul 1 Sistem Operasi 2025

## Anggota
| Nama                            | NRP        |
|---------------------------------|------------|
| Nadia Kirana Afifah Prahandita  | 5027241005 |
| Hansen Chang                    | 5027241028 |
| Muhammad Khosyi Syehab          | 5027241089 |

## PENJELASAN

## Soal-1
kasih penjelasan disini..

## Soal-2
kasih penjelasan disini..

## Soal-3
Pada soal ini kita diberikan 5 bentuk program yakni, "Speak to Me", "On the Run", "Time", "Money", dan "Brain Damage".
Pertama kita perlu membuat sebuah file dsotm.sh yang dapat menampung semua fungsi dari program diatas, 
```
clear
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
```
### A. Fungsi "Speak to Me"
Membuat fungsi untuk memanggil API yang menampilkan word of affirmation di tiap detiknya
```
function speak_to_me() {
    while true; do
        affirmation=$(curl -s https://www.affirmations.dev | jq -r '.affirmation')
        echo "$affirmation"
        sleep 1
    done
}
```
### B. Fungsi "On the Run"
Membuat sebuah progress bar yang berjalan dengan interval random
```
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
        local bar_empty=$(printf '%0.s░' $(seq 1 $empty))

        echo -ne "\r\033[1;32m${bar_filled}\033[1;31m${bar_empty}\033[0m ${progress}% (${remaining_time}s)"
    done
    echo -e "\nDone!\n"
}
```
Script tersebut akan menjalankan sebuah bar progress dengan interval random
### C. Fungsi "Time"
Membuat fungsi yang dapat menampilkan live clock yang menunjukkan waktu setiap saat, singkat saja :
```
function show_time() {
    while true; do
        clear
        echo "$(date '+%Y-%m-%d %H:%M:%S')"
        sleep 1
    done
}
```
### D. Fungsi "Money"
Membuat sebuah program yang "mirip" dengan "cmatrix" dengan modifikasi simbol berupa mata uang
```
function test() {
        trap "tput cnorm; exit" SIGINT
        while true; do
        unimatrix -a -b -c blue -g black -u '$ ﷼  € £ ¥ ¢ ₹ ₩ ₿ ₣ ₽ ¤ ₱ ₦ ƒ ₮ ௹ ฿ ៛ ₪ ₫'
        sleep 1
        done
}
```
menggunakan unimatrix, dimana fungsi ini sangat mudah untuk dimodifikasi output nya
### E. Fungsi "Brain Damage"
Membuat sebuah program yang dapat menampilkan proses yang sedang berjalan di dalam terminal dan diperbarui tiap detiknya
```
function brain_damage() {
    while true; do
        clear
        echo "Task Manager"
        ps aux --sort=-%mem | head -10
        sleep 1
    done
}
```
script tersebut akan terus mengambil data terbaru dari proses yang sedang berjalan di terminal kita
soal-3 done sir
## Soal-4
kasih penjelasan disini..
