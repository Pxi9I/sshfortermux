# Termux SSH Auto-Setup

A Bash script that automatically installs, configures, and starts an OpenSSH server on Termux.

---

## Features

- Updates packages (`apt update`)
- Installs required dependencies: `openssh` and `iproute2`
- Generates SSH host keys (`ssh-keygen -A`)
- Sets the default user password to `00000000`
- Starts the SSH server (`sshd`)
- Installs the `sshtermux` command for restarting the server later
- Displays connection details: username, local IP address, port (8022), and a ready-to-use SSH command
- Installs the `sshtermux` command, which restarts the server and displays the connection details without updating or reinstalling anything

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

## Restarting the Server

After the initial installation, the `sshtermux` command is available in Termux. Use it to start the SSH server again (for example, after restarting Termux) and display the connection details. It does not update packages or reinstall anything:

```bash
sshtermux
```

If the server is already running, the command only displays the connection details.

---

## Usage

### Restarting the SSH server

After the initial installation, the `sshtermux` command is available in Termux. Use it whenever you need to start the SSH server again (for example, after restarting Termux):

```bash
sshtermux
```

The command starts `sshd` if it is not already running and displays the connection details. It does not update packages, reinstall OpenSSH, or change the password.

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
