#!/bin/bash
 wget "https://drive.google.com/uc?export=download&id=1l8fsj5LZLwXBlHaqhfJVjz_T0p7EJjqV" -O reading_data.csv
 awk -F',' '$2 ~ "Chris Hemsworth" {count++} END {print "Chris Hemsworth membaca "count" buku"}' reading_data.csv
 awk -F',' '$8 ==  "Tablet" {sum += $6; count++} END {if (count > 0) print " Rata-rata durasi membaca dengan Tablet adalah " sum / count "menit"}' reading_data.csv

 awk -F',' 'NR > 1 {if ($7 > max) {title = $3;max = $7; name = $2}} END {print " Pembaca dengan rating tertinggi: " name " - " title" - "max}' reading_data.csv


