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
A. Membuat direktori && memasukkan ke direktori
```
mkdir soal_1 && cd soal_1
```
B. Membuat File poppo_siroyo.sh
```
nano poppo_siroyo.sh
```
C. Menjalankan script
```
./nano poopo_siroyo.sh
```
 D. Izin execute pada script
```
chmod +x poppo_siroyo.sh
```
F. Menjalakan script kembali
```
./poppo_siroyo.sh
```
G. Melihat isi file CSV
```
more reading_data.csv
```
H.Menggunakan Strings dan grep untuk mencari data. Menampilkan semua string yang dapat dibaca dari file reading_data.csv kemudian menyaring output untuk mencari baris yang mengandung nama "Chris Hemsworth".
```
I.strings reading_data.csv |grep "Chris Hemsworth"
```
J. Menunjukkan jumlah buku-buku yang dibaca oleh Chris Hemsworth.

## Soal-2
### A. “First Step in a New World”
--
### B. “Radiant Genesis”
--
### C. “Unceasing Spirit”
--
### D. “The Eternal Realm of Light”
--
### E. “The Brutality of Glass”
pada soal ini kita diminta untuk membuat program dimana kita dapat melacak penggunaan cpu(dalam percent) serta cpu model,
```
TIME=$(date +"%Y-%m-%d %H:%M:%S")
CPUU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPUM=$(lscpu | grep -m1 "Model name" | cut -d ':' -f2 | sed 's/^ *//')

echo "[$TIME] - Core Usage [$CPUU%] - Terminal Model [$CPUM]"
```
Dimana ```TIME=$(date +"%Y-%m-%d %H:%M:%S")``` mengambil waktu saat ini dalam format YYYY-MM-DD HH:MM:SS. ```top -bn1``` menjalankan top dalam mode batch (-b) hanya dnegan satu iterasi (-n1). ```grep Cpu(s)```berfungsi untuk menemukan baris yang berisi info CPU. ```awk '{print 100 - $8}'``` menghitung penggunaan CPU dengan rumus 100 - idle CPU ($8).
### F. “In Grief and Great Delight”
pada soal yang ini, kita membuat program untuk melacak percent usage RAM dan pengggunaan nya RAM saat ini, serta memastikan sudah sesuai dengan package resource checker yang ada(top, htop, btop), 
```
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

echo "[$TIMESTAMP] - Fragment Usage [$RAM_PERCENTAGE%] - Fragment Count [$RAM_USED MB] - Details [Total: $RAM_TOTAL MB, Available: $RAM_AVAILABLE MB]"
```
```grep MemTotal``` digunakan untuk mengambil total RAM dalam satuan KB, ```/proc/meminfo``` berisi informasi tentang penggunaan RAM. Kemudian ```awk '{print $2}'``` digunakan untuk mengekstrak kolom kedua dari suatu output teks yang diproses oleh ```awk```. ```printf "%.2f"``` memastikan hasilnya memiliki dua angka di belakang koma.
### G. “On Fate's Approach”
Pada soal ini, kita disuruh untuk buat suatu menu(Crontab Manager) yang mempunyai fungsi menambah maupun menghapus CPU/RAM serta melihat Active Jobs yang sedang berjalan, contoh terminal nya seperti ini : 
```echo "======================"
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
```
kita tambahkan fungsi yang sesuai dengan yang ada di menu crontab tersebut ygy,
```
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
```
```crontab -l``` berguna untuk menampilkan daftar tugas yang sudah ada dalam crontab sedangkan ```2>/dev/null``` untuk menyembunyikan error jika crontab kosong. kemudian menambahkan baris baru ```"* * * * * $CORE_SCRIPT"```, yang artinya menjalankan script setiap menit. output tersebut dikirim ke ```corntab -```, sehingga memeperbarui crontab yang ada. ```grep -v``` berarti mencari semua baris kecuali yang mengandung suatu kata tersbut.
### H. “The Disfigured Flow of Time”
kemudian setelah kita membuat crontab manager, kita tambahkan 2 log file (core.log dan fragment.log) di folder ```./log/``` untuk menghubungkan ke prgram usage monitorinng kita tadi. didapatkan output sebagai berikut, 
![Screenshot 2025-03-20 045316](https://github.com/user-attachments/assets/94836556-7430-4e8f-a112-0e8fd3cf5a9a)
### I. “Irruption of New Color”
kita disuruh untuk mwmbuat antarmuka utama yang memggabungkan semua elemen berbentuk ```terminal.sh```,
```
# Fungsi untuk registrasi
register() {
    echo -e "\n\e[90m=========== \e[33mREGIST PLAYER ACCOUNT\e[90m==========\e[0m"
    read -p "Email: " email
    read -p "Username: " username
    read -sp "Password: " password
    echo
    ./register.sh "$email" "$username" "$password"
}

# Fungsi untuk login
login() {
    echo -e "\n\e[90m========== \e[33mLOGIN PLAYER ACCOUNT \e[90m==========\e[0m"
    read -p "Email: " email
    read -sp "Password: " password
    echo
    ./login.sh "$email" "$password"
}
delete() {
    echo -e "\n\e[90m========== \e[33mDELETE PLAYER ACCOUNT \e[90m==========\e[0m"
    read -p "Email: " email
    read -sp "Password: " password
    echo
    ./delete.sh "$email" "$password"
}
# Menu utama
while true; do
    echo -e "\n\e[90m========== \e[33mARCACEA PLAYER SYSTEM \e[90m==========\e[0m"
    echo -e "\e[34m1. Register"
    echo    "2. Login"
    echo    "3. Delete"
    echo -e "4. Exit\e[0m"
    read -p "Choose Option (1-4): " choice

    case $choice in
        1) register ;;
        2) login ;;
        3) delete ;;
        4) echo "Shutting down..."; exit 0 ;;
        *) echo -e "\e[31mOption not valid! Please choose 1-4." ;;
    esac
done
```
```\e[90m``` adalah kode warna ANSI untuk abu-abu (gray/light black) sedangkan ```\e[33m``` adalah kode warna ANSI untuk kuning (yellow). Berikut adalah tampilan dari ```terminal.sh``` :                                                                             
![image](https://github.com/user-attachments/assets/bd156aff-e195-46f2-9f2e-f63618e3709c)

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
soal-3 done sir
## Soal-4
kasih penjelasan disini..
