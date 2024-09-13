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
