#!/bin/bash

# File to store the last known IP
IP_FILE="/opt/ip-monitor/last_ip.txt"

# Get the current public IP address
CURRENT_IP=$(curl -s ifconfig.me)

# Check if the file exists, if not create it
if [ ! -f "$IP_FILE" ]; then
    echo "No IP file found, creating one with the current IP."
    echo "$CURRENT_IP" > "$IP_FILE"
fi

# Get the last known IP address from the file
LAST_IP=$(cat "$IP_FILE")

# If the IP has changed, send an email and update the file
if [ "$CURRENT_IP" != "$LAST_IP" ]; then
    echo "IP has changed from $LAST_IP to $CURRENT_IP, sending email..."
    
    # Send the email using sendemail
    sendemail -f lenovo-linux-mint@gmail.com -t xszitasz@gmail.com -u IP-Change-Linux-Mint -m "The public IP has changed from $LAST_IP to $CURRENT_IP" -s smtp.gmail.com:587 -o tls=yes -xu xszitasz@gmail.com -xp xkezfxglrybfopbg
    
    # Update the file with the new IP
    echo "$CURRENT_IP" > "$IP_FILE"
else
    echo "IP has not changed. Current IP is still $CURRENT_IP."
fi