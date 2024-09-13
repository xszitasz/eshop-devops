# SSH Connection Setup: Device-1(Windows/Terminus) to Device-2(OpenSSH/Ubuntu)

This guide explains how to set up an SSH connection between two machines:
- **Device-1**: A machine with **Terminus** installed.
- **Device-2**: A machine running **Ubuntu** with SSH enabled.

## Prerequisites
1. **Device-1**: Terminus installed and working.
2. **Device-2**: OpenSSH server installed and running on Ubuntu.
3. Both machines are connected to the same network or accessible via the internet.

---

## Step 1: Install and Configure OpenSSH on Device-2

1. **Install OpenSSH Server** on Device-2 (Ubuntu):
    ```bash
    sudo apt update
    sudo apt install openssh-server
    ```

2. **Start, enable and check SSH service/status**:
    ```bash
    sudo systemctl start ssh
    sudo systemctl enable ssh
    sudo systemctl status ssh
    ```

## Step 2: Get IP Address of device-2
We will need the value of inet and also the username, which we can get by executing the following commands
```bash
sudo ifconfig
sudo whoami
```

## Step 3: Configure Terminus on device-1
Now that you have the IP address and username of device-2, we can configure Terminus to connect via SSH.

- Open Terminus on device-1.
- Click the "+" icon to create a new connection.
- Choose SSH as the connection type.
- Host: The IP address of device-2 (e.g., 192.168.1.100).
- Port: Use the default SSH port, 22, unless you have changed it.
- Username: The username you retrieved from device-2.
- Password/Key: Enter the password for the user on device-2 or set up an SSH key (see Step 5).
- Click Connect.

The first time you connect, you may be prompted to accept the SSH fingerprint. Type yes to proceed.

## Troubleshooting
1. ``Unmet Dependencies``: If you encounter unmet dependencies when installing OpenSSH on device-2, try the following:
```bash
sudo apt --fix-broken install
sudo apt install libpam-modules libsmbclient
sudo apt install openssh-server
```

## Possible improvements:
- Set Up SSH Key Authentication