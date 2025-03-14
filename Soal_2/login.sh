#!/bin/bash
#login.sh

# Static salt untuk hashing
SALT="arcaea_salt_etern1ty"

# Validasi jumlah argumen
if [ $# -ne 2 ]; then
    echo "Usage: ./login.sh <email> <password>"
    exit 1
fi

email=$1
password=$2

# Validasi keberadaan database
if [ ! -f "/data/player.csv" ]; then
    echo "Login failed: No registered players!"
    exit 1
fi

# Cek keberadaan email
if ! grep -q "^$email," "/data/player.csv"; then
    echo "Login failed: Email not found!"
    exit 1
fi

# Ekstrak hash dari database
stored_hash=$(grep "^$email," "/data/player.csv" | cut -d ',' -f3)

# Hash password input
input_hash=$(echo -n "${password}${SALT}" | sha256sum | cut -d ' ' -f1)

# Bandingkan hash
if [ "$input_hash" == "$stored_hash" ]; then
    echo "Login successful! Welcome to Arcaea!"
else
    echo "Login failed: Invalid credentials!"
fi
