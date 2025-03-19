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
Pertama kita perlu membuat sebuah file dsotm.sh yang dapat menampung semua fungsi dari program diatas, pada awal script ini terdapat ```clear``` untuk memastikan bahwa setelah menjalankan program ini, terminal selalu dibersihkan agar tampilan lebih rapi,
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
Membuat fungsi untuk memanggil API yang menampilkan word of affirmation di tiap detiknya,
```
function speak_to_me() {
    while true; do
        affirmation=$(curl -s https://www.affirmations.dev | jq -r '.affirmation')
        echo "$affirmation"
        sleep 1
    done
}
```
fungsi ```speak_to_me``` akan terus berjalan selamanya kita tidak menghentikan program, sedangkan ```curl -s``` akan mengambil data dari situs yang ada dan tidak menambahkan informasi tambahan. Kemudian ```jq -r``` adalah alat untuk memproses JSON, dimana kita hanya mengambil di bagian "affirmation". baris berikutnya ```echo``` berfungsi untuk menampilkan kutipan yang didapat dan ```sleep``` untuk menunggu proses sebelum menjalankannya lagi.                              
![Screenshot 2025-03-20 014734](https://github.com/user-attachments/assets/59a210be-6ba1-47dd-ab00-a2479fcf85b9)
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
Script tersebut akan menjalankan sebuah bar progress dengan interval random, dimana ```tput cols``` untuk mengambil jumlah kolom di terminal dan ```bar_length``` untuk menentukan panjang pregress bar. Script ini akan terus berjalan selama progressnya kurang dari 100. ```$RANDOM``` adalah variabel bawaan bash yang dapat menghasilkan angka acak kemudian kita ambil sisa pembagian yang berkisar 0-89 dengan ```% 90```. Lalu ```bc``` disini digunakan untuk perhitungan float(command-line) dan memastikan bahwa hasilnya memiliki 2 angka dibelakang koma. ```%0.s>``` berfungsi untuk mencetak hanya karakter ">". ```\033[``` adalah kode escape ANSI untuk mengubah warna teks di terminal. ```1;32m``` berarti hijau terang (1 = bold, 32 = hijau). 
![Screenshot 2025-03-20 014227](https://github.com/user-attachments/assets/67c73688-581a-4dea-abe8-87de4cee72b7)
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
date ```'+%Y-%m-%d %H:%M:%S'``` digunakan untuk menampilkan waktu dalam format YYYY-MM-DD HH:MM:SS. serta ```sleep 1``` untuk memperbarui tiap 1 detik.            
![Screenshot 2025-03-20 014356](https://github.com/user-attachments/assets/b3e6dbc1-9a79-4477-becd-8c9be148d04c)
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
menggunakan unimatrix, dimana fungsi ini sangat mudah untuk dimodifikasi output nya. ```trap``` adalah perintah bawaan Bash untuk menangani sinyal (signals) sedangkan SIGNIT adlah sinyal yang dikirim ketika menekan ctrl+c. setelah pengguna menekan ctrl+c ```tput cnorm``` mengembalikan tampilan kursor ke normal kemudian menghentikan program dengan ```quit```. Untuk simbol di dalam script unimatrix ```-a``` Asynchronous scroll. Lines will move at varied speeds. ```-b``` Use only bold characters. ```-c``` color. ```-g``` background color. ```-u``` custom-characters.
![Screenshot 2025-03-20 014450](https://github.com/user-attachments/assets/5d968592-799f-497f-a6df-922cdf0b0a18)
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
script tersebut akan terus mengambil data terbaru dari proses yang sedang berjalan di terminal kita. ```ps aux``` untuk menampilkan semua daftar proses yang sedang berjalan, ```--sort=-%mem``` berarti mengurutkan hasil berdasarkan kolom %MEM dalam urutan menurun (terbesar ke terkecil). kemudian hanya menampilkan 10 baris pertama dari ps aux dengan ```head -10```
![Screenshot 2025-03-20 014544](https://github.com/user-attachments/assets/efb92d28-f789-45c5-ae24-fbe714358e21)
soal-3 done sir
## Soal-4
kasih penjelasan disini..
