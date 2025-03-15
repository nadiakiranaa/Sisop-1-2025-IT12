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
        4) echo    "Shutting down..."; exit 0 ;;
        *) echo -e "\e[31mOption not valid! Please choose 1-4." ;;
    esac
done
