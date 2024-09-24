# Publish IP Address and Setup Remote Access

This document outlines the steps to publish your IP address for remote access.

## Step 2: Check Your Current IP Address

You can check your public IP address using the following command:

```bash
curl ifconfig.me
```

Make note of your public IP address.

## Step 3: Find Your MAC Address

Use the following command to find the MAC address of your network interface:

```bash
ip a
```

Look for the line that starts with `link/ether` or `wlan0`.

## Step 4: Access Your Modem Settings: 

Open a web browser and enter your modem's IP address (usually `192.168.1.1`).

## Step 5: Login 

- Enter your username and password
- Navigate to section **LAN**
- Find the section for **DHCP Static IP Configuration**
- Add a New Entry:
   - **MAC Address**: `c8:3d:d4:9e:94:0b` (replace with your actual MAC address)
   - **IP Address**: `192.168.1.50` (the desired static IP)
- Save Changes

## Step 6: Setup Port Forwarding on Your Modem

To enable remote access to your Linux Mint device, you need to set up port forwarding on your HG8245H modem:

1. **Navigate to Forward Rules**:
   - Go to the **Port Mapping Configuration** section.
   
2. **Add a New Port Forwarding Rule**:
   - **Mapping Name**: `linux-mint`
   - **WAN Name**: `1_INTERNET_R_VID_2510`
   - **Internal Host**: `192.168.1.50` (your Linux Mint device's static IP)
   - **External Source IP Address**: `leave_empty`
   - **Protocol**: `TCP`
   - **External Port**: `22--22`
   - **Internal Port**: `22--22`
   - **Enable Port Mapping**: Checked

3. **Save Changes**.

## Step 7: Test SSH Access

To test SSH access from a different network, use:

```bash
ssh username@your_public_ip_address
```

Replace `username` with your actual username and `your_public_ip_address` with the public IP you noted earlier.

## Step 7: Change Your Password (Optional)

To change your user password:

1. Open Terminal:

    ```bash
    passwd
    ```

2. Follow the prompts to enter your current password and the new password.