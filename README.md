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
a. Membuat direktori && memasukkan ke direktori
```
mkdir soal_1 && cd soal_1
```
b. Membuat File poppo_siroyo.sh
```
nano poppo_siroyo.sh
```
c. Menjalankan script
```
./nano poopo_siroyo.sh
```
### Soal Tipe A
Menunjukkan jumlah buku-buku yang dibaca oleh Chris Hemsworth.
```
awk -F',' '$2 ~ "Chris Hemsworth" {count++} END {print "Chris Hemsworth membaca " count " buku "}' reading_data.
csv
```
### Soal Tipe B
Menghitung rata-rata dari pengguna yang menggunakan Tablet
```
awk -F',' '$8 == "Tablet" {sum += $6; count++} END {if (count > 0) print "Rata-rata durasi membaca dengan Tablet adalah "sum / count " buku "; else print "0"}' reading_data.csv
```
### Soal Tipe C
Mencari pembaca dengan rating tertinggi 
```
 awk -F',' 'NR > 1 {if ($7 > max) {title = $3; max = $7; name = $2}} END {print "Pembaca dengan rating tertinggi:
 " name, "-", title, "-", max}' reading_data.csv
```
### Soal Tipe D 
Menganalisi genre paling populer di Asia Tenggara
```
 awk -F',' '$9 == "Asia" && $5 > "2023-12-31" {genres[$4]++} END {
        max = 0;
        for (genre in genres) {
            if (genres[genre] > max) {
                max = genres[genre];
                most_popular = genre;
            }
        }
        print " Genre paling populer di Asia setelah 2023 adalah " most_popular, "dengan " max " buku "
    }' reading_data.csv
```
### Dokumentasi


## Soal-2
### A. “First Step in a New World”
Menggunakan conditional statement ```$# -ne 3``` untuk mengecek apakah jumlah parameter sama dengan 3
Parameter register yaitu email, username, dan password
```
 if [ $# -ne 3 ]; then
    echo "Usage: ./register.sh <email> <username> <password>"
    exit 1
fi
```
Mengecek parameter untuk login
```
if [ $# -ne 2 ]; then
    echo "Usage: ./login.sh <email> <password>"
    exit 1
fi
```
### B. “Radiant Genesis”
```
if [[ ${#password} -lt 8 ]] ||
   [[ ! "$password" =~ [A-Z] ]] ||
   [[ ! "$password" =~ [a-z] ]] ||
   [[ ! "$password" =~ [0-9] ]]; then
    echo "Password must have: 8+ chars, 1 uppercase, 1 lowercase, 1 digit!"
    exit 1
fi
```
### C. “Unceasing Spirit”
```
if [ -f "data/player.csv" ] && grep -q "^$email," "data/player.csv"; then
    echo "Email already registered!"
    exit 1
fi
```
Mengecek dalam data/player.csv apakah terdapat email yang sama menggunakan ```grep```
### D. “The Eternal Realm of Light”
Salt dideklarasikan dengan kata bebas lalu digunakan dalam pembuatan password yang digabung dengan ```sha256sum``` yang akan membuat password acak dan disimpan dalam variabel hashed_pw
```
SALT="NHK_ArcadiaSalty"
hashed_pw=$(echo -n "${password}${SALT}" | sha256sum | cut -d ' ' -f1)
```
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
### A. Melihat summary dari data
membuat sebuah fungsi yang akan menampilkan nama pokemon dengan Usage % tertinggi dan Raw Usage tertinggi
```
if [ "$2" == "--info" ]; then
    echo ""
    echo "Summary of $1"
    highest_usage=$(awk -F, 'NR>1 {print $1, $2}' $1 | sort -k2 -nr | head -n 1)
    highest_raw=$(awk -F, 'NR>1 {print $1, $3}' $1 | sort -k3 -nr | head -n 1)
    echo -e "Highest Adjusted Usage: \e[32m$highest_usage\e[0m"
    echo -e "Highest Raw Usage: \e[32m$highest_raw"
fi
```
fungsi ini menganalisis dari file csv yang telah diberikan lalu mengsortir data tersebut sesuai dengan Usage % dan Raw Usage tertinggi dan menampilkan data tersebut. ```highest_usage``` akan menyimpan data Usage % tertinggi, sedangkan ```highest_raw``` akan menyimpan data Raw Usage tertinggi. penggunaan ```awk -F ,``` digunakan untuk membaca file csv dengan tanda pemisah ",". Dilanjutkan ```'NR>1 {print $1, $3}' $1``` akan melewatai baris pertama pada file lalu mengprint kolom 1 dan 3 dari argumen pertama yaitu ```pokemon_usage.csv```. ```sort -k3 -nr | head -n 1``` dipakai untuk menyortir kolom 3 berdasarkan numerik dari tertinggi hingga terendah lalu hanya menampilkan baris pertamanya saja.
### B. Mengurutkan Pokemon berdasarkan data kolom
```
if [ "$2" == "--sort" ]; then
  if [ -z "$3" ]; then
    echo " "
    echo -e "\e[31mError: Argumemt is empty."
    exit 1
  fi
    echo " "
    column=$3
    case $column in
        "usage") sort_column=2 ;;
        "rawusage") sort_column=3 ;;
        "name") sort_column=1 ;;
        "Pokemon") sort_column=1 ;;
        "pokemon") sort_column=1 ;;
        "POKEMON") sort_column=1 ;;
        "Name") sort_column=1 ;;
        "NAME") sort_column=1 ;;
        "hp") sort_column=6 ;;
        "HP") sort_column=6 ;;
        "Hp") sort_column=6 ;;
        "atk") sort_column=7 ;;
        "Atk") sort_column=7 ;;
        "ATK") sort_column=7 ;;
        "def") sort_column=8 ;;
        "spatk") sort_column=9 ;;
        "spdef") sort_column=10 ;;
        "speed") sort_column=11 ;;
        *) echo -e "\e[31mColumn \e[36m$3 \e[31minvalid!"; exit 1 ;;
    esac
    echo "Pokemon,Usage%,RawUsage,Type1,Type2,HP,Atk,Def,SpAtk,SpDef,Speed"
    if [ "$sort_column" -eq 1 ]; then
    awk -F, 'NR>1' "$1" | sort -t, -k$sort_column
    else
    awk -F, 'NR>1' "$1" | sort -t, -k{$sort_column},${sort_column} -nr  
 fi
fi
```
Switch case digunakan untuk menerima inputan dari user dalam bentuk argumen ketiga yang disimpan dalam variabel ```$column```. Kemudian input akan diubah menjadi sebuah angka yang disimpan dalam variabel ```$sort_column``` untuk menentukan kolom yang akan disorting
### C. Mencari nama Pokemon tertentu
```
if [ "$2" == "--grep" ]; then
  if [ -z "$3" ]; then
    echo " "
    echo -e "\e[31mError: Argument is empty."
    exit 1
  fi
    name=$3
    echo " "
    if awk -F, -v nama="$name" '$1 ~ nama' "$1" | grep -q .; then
       awk -F, -v nama="$name" '$1 ~ nama' "$1" | sort -t, -k2 -nr
    else
       echo -e "\e[31mName \e[36m$3 \e[31mnot found" 
  fi
fi
```
Mendeklarasikan variabel baru dalam awk dengan ```-v``` yang akan menampung input dari user yang kemudian dibandingkan dengan data dan ```$1 ~ nama``` akan mencari data yang memiliki unsur dari variabel ```nama```
### D. Mencari Pokemon berdasarkan filter nama type
```
if [ "$2" == "--filter" ]; then
  if [ -z "$3" ]; then
    echo " "
    echo -e "\e[31mError: Argument is empty."
    exit 1
  fi
    type=$3
    echo ""
    if awk -F, -v tipe="$type" '$4 == tipe || $5 == tipe' "$1" | grep -q .; then
       echo "Pokemon,Usage%,RawUsage,Type1,Type2,HP,Atk,Def,SpAtk,SpDef,Speed"
       awk -F, -v tipe="$type" '($4 == tipe || $5 == tipe)' "$1" | sort -t, -k2 -nr
    else
       echo -e "\e[31mType \e[36m$3 \e[31mnot found"
    fi
fi
```
Pengecekan dilakukan untuk mengfilter tipe pada pokemon di mana ```$4 == tipe || $5 == tipe``` untuk memastikan apakah pada kolom 4 atau kolom 5 memiliki nama yang sama dengan input dari user. Jika ya, 
``` awk -F, -v tipe="$type" '($4 == tipe || $5 == tipe)' "$1" | sort -t, -k2 -nr```maka akan sorting data berdasarkan tipe yang sama dengan input dari user dengan usage tertingi
### E. Error handling
```
if [ -z "$3" ]; then
    echo " "
    echo -e "\e[31mError: Argument is empty."
    exit 1
  fi
```
Error handling dilakukan di tiap fungsi dengan melakukan pengecekan apakah terdapat argumen ketiga yang tidak terisi. Jika argumen ketiga tidak terisi, maka akan menampilkan tulisan "Error: Argument is empty.". 
```
 echo -e "\e[31mType \e[36m$3 \e[31mnot found"
```
Tidak lupa melakukan pengecekan apakah argumen yang diisi sesuai dengan yang dibutuhkan dan jika ternyata argumen tidak ditemukan, maka akan menampilkan "Argumen not found."


### F. Help screen yang menarik
Memberikan tampilan yang menarik dan juga simple guide dengan menambahkan warna pada tampilan ```--help```
<img width="836" alt="Screenshot 2025-03-19 190015" src="https://github.com/user-attachments/assets/ce6c113c-520b-43ee-85b4-83e4e8efdf07" />



