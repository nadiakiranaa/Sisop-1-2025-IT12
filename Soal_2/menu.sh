#!/bin/bash

# Fungsi untuk registrasi
register() {
    echo -e "\n=== REGISTRASI PLAYER ==="
    read -p "Email: " email
    read -p "Username: " username
    read -sp "Password: " password
    echo
    ./register.sh "$email" "$username" "$password"
}

# Fungsi untuk login
login() {
    echo -e "\n=== LOGIN PLAYER ==="
    read -p "Email: " email
    read -sp "Password: " password
    echo
    ./login.sh "$email" "$password"
}

# Menu utama
while true; do
    echo -e "\n===== ARCACEA PLAYER SYSTEM ====="
    echo "1. Registrasi"
    echo "2. Login"
    echo "3. Exit"
    read -p "Pilih opsi (1-3): " choice

    case $choice in
        1) register ;;
        2) login ;;
        3) echo "Keluar dari sistem..."; exit 0 ;;
        *) echo "Opsi tidak valid! Silakan pilih 1-3." ;;
    esac
done
