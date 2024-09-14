# GitHub SSH Setup Guide

## Step 1: Generate an SSH Key (if you don’t have one)

1. Open a terminal on your local machine and run the following command to generate a new SSH key pair:
   ```bash
   ssh-keygen -t rsa -b 4096
   ```

## Step 2: Add Your SSH Key to GitHub
Write out the SHH public key with the command and copy it to you clipboard:

```bash
cat .ssh/id_rsa.pub
```

- Go to ``GitHub.com`` and log in.
- In the top-right corner, click your profile picture, then click Settings.
- In the left sidebar, click ``SSH and GPG keys``.
- Click ``New SSH key``.
- Give your key a title (e.g., "My Laptop SSH Key") and paste the public key into the "Key" field.
- Click ``Add SSH key``.

## Step 4: Clone a GitHub Repository Using SSH
In the terminal, clone the repository using SSH:

```bash
git clone git@github.com:username/repository.git
```