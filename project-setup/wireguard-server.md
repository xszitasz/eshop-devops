# WireGuard Setup on Linux Mint

This guide provides step-by-step instructions for installing and configuring **WireGuard VPN** on **Linux Mint**. WireGuard is a fast, modern VPN that utilizes state-of-the-art cryptography for secure communications.

---

## Prerequisites

Before you begin, ensure you have the following:

- **Linux Mint**
- **Terminal access** with sudo privileges
- **WireGuard installed**

---

## Steps to Install and Configure WireGuard

### 1. Update System Packages

First, open your terminal and ensure your system is up to date by running:

```bash
sudo apt update && sudo apt upgrade
```

### 2. Install WireGuard
WireGuard is available in the default repositories for Linux Mint. Install it using the following command:

```bash
sudo apt install wireguard
```

### 3. Generate WireGuard Keys
If you need to create your own keys, use the following commands:

```bash
wg genkey | tee privatekey | wg pubkey > publickey
```

The privatekey file contains your private key.
The publickey file contains your public key.

### 4. Configure WireGuard
#### 5.1 Create a Configuration File
The WireGuard configuration file is stored in **/etc/wireguard/**. Create a configuration file for your VPN connection, typically named **wg0.conf**:

```bash
sudo nano /etc/wireguard/wg0.conf
```

Example Configuration for the Client:

```bash
PrivateKey = YOUR_PRIVATE_KEY
Address = 10.0.0.2/24  # Change this according to your VPN network

[Peer]
PublicKey = SERVER_PUBLIC_KEY
Endpoint = SERVER_IP:PORT
AllowedIPs = 0.0.0.0/0  # Route all traffic through the VPN
PersistentKeepalive = 25
```

Make sure to replace **YOUR_PRIVATE_KEY, SERVER_PUBLIC_KEY, SERVER_IP**, and **PORT** with your actual values.

### 6. Start the WireGuard Interface
To start the WireGuard interface, run:

```bash
sudo wg-quick up wg0
```

### 7. Enable WireGuard to Start at Boot
If you want WireGuard to start automatically at boot, use the following command:

```bash
sudo systemctl enable wg-quick@wg0
```

### 8. Verify the Connection
To verify that the WireGuard connection is up and running, execute:

```bash
sudo wg
```

You should see your connection details, including the interface, peer, and data transfer statistics.