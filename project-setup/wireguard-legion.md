# Setting Up WireGuard VPN on Legion

This guide will walk you through the steps to configure WireGuard VPN on your Legion machine using a `.conf` file.

## Prerequisites

- WireGuard installed on Legion and VMs
- WireGuard configuration files prepared for each device (Legion, CI/CD VM, Application VM)
- Proper firewall and routing configurations on all devices

## Steps for Setting Up the VPN

### 1. Create or Edit the Configuration File on Legion

Open a terminal on Legion and create or edit the WireGuard configuration file. Name it **legion.conf**

Add the following configuration:

```bash
[Interface]
Address = 10.0.0.1/24  # Legion's VPN IP
PrivateKey = <Legion_Private_Key>  # Replace with Legion's private key
ListenPort = 55125  # WireGuard listening port

[Peer]
PublicKey = <CI_CD_VM_Public_Key>  # Replace with CI/CD VM's public key
Endpoint = <Router_Public_IP>:51820  # Router's public IP and CI/CD VM port
AllowedIPs = 10.0.0.3/32  # CI/CD VM VPN IP

[Peer]
PublicKey = <App_VM_Public_Key>  # Replace with Application VM's public key
Endpoint = <Router_Public_IP>:51821  # Router's public IP and Application VM port
AllowedIPs = 10.0.0.2/32  # Application VM VPN IP
```

### 2. Replace Placeholder Values
**<Legion_Private_Key>**: The private key generated for your Legion machine.
**<CI_CD_VM_Public_Key>**: The public key of your CI/CD VM.
**<App_VM_Public_Key>**: The public key of your Application VM.
**<Router_Public_IP>**: The public IP address of your router.

### 3. Enable and Start WireGuard on Legion
To enable and start the WireGuard interface, run the following command:

```bash
sudo wg-quick up /etc/wireguard/legion.conf
```

On Windows you have to download wireguard application from: **https://www.wireguard.com/install/** and import the **legion.conf** file.

### 4. Configure Port Forwarding on Your Router
Ensure that your router is configured to forward the following ports:

Port 51820 for the CI/CD VM
Port 51821 for the Application VM
Port 55125 for Legion (if required for external access)

### 5. Verify VPN Connection
Check if the VPN is active by using the wg command:

```bash
sudo wg show
```

You should see successful handshakes between Legion and both the CI/CD and Application VMs. You can test connectivity by pinging the VPN IPs:

```bash
ping 10.0.0.2  # Application VM
ping 10.0.0.3  # CI/CD VM
```