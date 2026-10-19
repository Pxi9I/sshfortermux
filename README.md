# Termux SSH Auto-Setup

A Bash script that automatically installs, configures, and starts an OpenSSH server on Termux.

---

## Features

- Updates packages (`apt update`)
- Installs required dependencies: `openssh` and `iproute2`
- Generates SSH host keys (`ssh-keygen -A`)
- Sets the default user password to `00000000`
- Starts the SSH server (`sshd`)
- Displays connection details: username, local IP address, port (8022), and a ready-to-use SSH command

---

## Installation

### Option 1: One-line install

Run the following command in the Termux app:

```bash
curl -sL bit.ly/sshtermux | bash
```

### Option 2: Manual install

```bash
pkg install git -y
git clone https://github.com/Pxi9I/sshfortermux.git
cd sshfortermux
chmod +x sshtermux.sh
./sshtermux.sh
```

---

## Usage

### Connecting from another Termux device

To connect from another Android device running Termux, first install the OpenSSH client on that device:

```bash
pkg install openssh -y
```

Then connect using the details displayed by the script:

```bash
ssh <username>@<ip_address> -p 8022
```

---

## Security Notice

The script sets a default password (`00000000`) for the current user. This password is insecure and should be changed immediately after setup:

```bash
passwd
```

Only run the SSH server on trusted networks, and consider switching to key-based authentication. As with any script piped directly into a shell, review the source code before running it.
