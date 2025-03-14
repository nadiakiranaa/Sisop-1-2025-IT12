#!/bin/bash
wget "https://drive.google.com/uc?export=download&id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV" -O reading_data.csv
awk -F',' '$2 ~ "Chris Hemsworth" {count++} END {print "Chris Hemsworth membaca "count" buku"}' reading_data.csv 
 awk -F',' '$8 == "Tablet" {sum += $6; count++} END {if (count > 0) print " Rata-rata durasi membaca dengan Tablet adalah "sum / count " menit "}' reading_data.csv
 awk -F',' 'NR > 1 {if ($7 > max) {title = $3;max = $7; name = $2}} END {print " Pembaca dengan rating tertinggi : " name " - " title " - " max}' reading_data.csv
 awk -F, '$9 == "Asia" && $5 > "2023-12-31" {genres[$4]++} END {max = 0; for (genre in genres) {if (genres[genre] > max) {max = genres[genre];most_common = genre;}} print "Genre paling populer di Asia setelah 2023 adalah " most_common " dengan " max " buku"}' reading_data.csv 

#!/bin/bash

# Unduh file dataset dari Google Drive
DATA_FILE="reading_data.csv"
FILE_ID="1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV"

# Mengecek apakah file sudah ada, jika tidak maka mengunduhnya
if [[ ! -f "$DATA_FILE" ]]; then
    echo " Mengunduh dataset..."
    wget -q "https://drive.google.com/uc?export=download&id=$FILE_ID" -O "$DATA_FILE"
    echo "File berhasil diunduh."
fi

# Periksa apakah file ada setelah unduhan
if [[ ! -f "$DATA_FILE" ]]; then
    echo "Error: File $DATA_FILE tidak ditemukan!"
    exit 1
fi

# Menampilkan menu interaktif
echo "==============================="
echo "PETUALANGAN DI TABLET AJAIB"
echo "==============================="
echo " Hitung jumlah buku yang dibaca oleh Chris Hemsworth"
echo "Hitung rata-rata durasi membaca dengan Tablet"
echo "Temukan pembaca dengan rating tertinggi"
echo "Keluar"
echo "==============================="
read -p "Masukkan pilihan (1-4): " pilihan

case "$pilihan" in
    1)
        jumlah=$(awk -F',' '$2 ~ "Chris Hemsworth" {count++} END {print count+0}' "$DATA_FILE")
        echo " Chris Hemsworth membaca $jumlah buku."
        ;;
    2)
        rata_rata=$(awk -F',' '$8 == "Tablet" {sum += $6; count++} END {if (count > 0) print sum / count; else print "0"}' "$DATA_FILE")
        echo " Rata-rata durasi membaca dengan Tablet adalah $rata_rata menit."
        ;;
    3)
        hasil=$(awk -F',' 'NR > 1 {if ($7 > max) {title = $3; max = $7; name = $2}} END {print name, "-", title, "-", max}' "$DATA_FILE")
        echo " Pembaca dengan rating tertinggi: $hasil"
        ;;
    4)
        echo " Keluar dari program."
        exit 0
        ;;
    *)
        echo " Pilihan tidak valid! Silakan pilih angka 1-4."
        ;;
esac
