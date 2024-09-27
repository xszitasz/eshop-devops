# IP Change Notification Script

This project sets up an IP monitoring system that sends an email notification whenever the public IP address of the device changes. We implemented two versions of the script for two different Linux distributions: **Linux Mint** and **Alpine Linux**.

## Table of Contents
- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Linux Mint Version (sendemail)](#linux-mint-version-sendemail)
  - [1. Install Required Packages](#1-install-required-packages)
  - [2. IP Monitoring Script](#2-ip-monitoring-script)
- [Alpine Linux Version (msmtp)](#alpine-linux-version-msmtp)
  - [1. Install Required Packages](#1-install-required-packages-alpine)
  - [2. Configure msmtp](#2-configure-msmtp)
  - [3. IP Monitoring Script](#3-ip-monitoring-script)
- [Cron Setup](#cron-setup)
- [Notes](#notes)

## Overview
This repository contains two scripts that monitor the public IP address and send an email when the IP address changes. One version uses **sendemail** on Linux Mint, and the other uses **msmtp** on Alpine Linux.

## Prerequisites
- Basic understanding of Linux commands
- Root access to the machine or the ability to use `sudo`
- A Gmail account with "Less Secure Apps" enabled or an App Password for security

---

## Linux Mint Version (sendemail)

### 1. Install Required Packages

To use `sendemail` on Linux Mint, follow these steps:

```bash
sudo apt update
sudo apt install sendemail
```

### 2. IP Monitoring Script

- Create the following script at `/opt/ip-monitor/ip-monitor-mint.sh`
- We have this scriptin ip-monitoring folder in our repository
- Make the script executable:

    ```bash
    sudo chmod +x /opt/ip-monitor/ip-monitor-mint.sh
    ```

---

## Alpine Linux Version (msmtp)

### 1. Install Required Packages

On Alpine Linux, use `msmtp` to send emails. First, install the necessary packages:

```bash
apk update
apk add msmtp
```

### 2. Configure msmtp

Create a configuration file for `msmtp` with the folowing command: `vim ~/.msmtprc`:

```bash
# /etc/msmtprc
account gmail
host smtp.gmail.com
port 587
auth on
user your-email@gmail.com
password your-app-password
tls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile /var/log/msmtp.log

# Set default account to use
account default : gmail
```

### 3. IP Monitoring Script

- Update the script for Alpine Linux to use `msmtp` instead of `sendemail`:
- Create the following script at `/opt/ip-monitor/ip-monitor-mint.sh`
- We have this scriptin ip-monitoring folder in our repository

---

## Cron Setup

You can automate this IP check by creating a cron job that runs every minute. Edit the cron jobs by running:

```bash
crontab -e
```

Then add the following line:

```bash
* * * * * /opt/ip-monitor/ip-monitor.sh
```

This will run the script every minute.

---

## Notes

- **App Password**: To use Gmail with third-party apps, enable "App Passwords" in your Google account.
- **File Permissions**: Ensure the script is executable and has the correct permissions.