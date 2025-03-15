#!/bin/bash
#register.sh

# Static salt untuk hashing
SALT="NHK_ArcadiaSalty"

# Validasi jumlah argumen
if [ $# -ne 3 ]; then
    echo "Usage: ./register.sh <email> <username> <password>"
    exit 1
fi

email=$1
username=$2
password=$3

# Validasi format email
if [[ ! "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
    echo "Registration Failed: Invalid email format! Must contain @ and domain."
    exit 1
fi

# Validasi kompleksitas password
if [[ ${#password} -lt 8 ]] ||
   [[ ! "$password" =~ [A-Z] ]] ||
   [[ ! "$password" =~ [a-z] ]] ||
   [[ ! "$password" =~ [0-9] ]]; then
    echo "Password must have: 8+ chars, 1 uppercase, 1 lowercase, 1 digit!"
    exit 1
fi

# Cek keberadaan email di database
if [ -f "data/player.csv" ] && grep -q "^$email," "data/player.csv"; then
    echo "Email already registered!"
    exit 1
fi

# Hash password dengan salt statis
hashed_pw=$(echo -n "${password}${SALT}" | sha256sum | cut -d ' ' -f1)

# Simpan ke database
echo "$email,$username,$hashed_pw" >> /data/player.csv
echo "Registration successful for $username!"
