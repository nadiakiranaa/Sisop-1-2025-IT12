#!/bin/bash

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

# Menu utama
while true; do
    echo -e "\n\e[90m========== \e[33mARCACEA PLAYER SYSTEM \e[90m==========\e[0m"    
    echo -e "\e[34m1. Register"
    echo    "2. Login"
    echo -e "3. Exit\e[0m"
    read -p "Choose Option (1-3): " choice

    case $choice in
        1) register ;;
        2) login ;;
        3) echo    "Shutting down..."; exit 0 ;;
        *) echo -e "\e[31mOption not valid! Please choose 1-3." ;;
    esac
done
