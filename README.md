# 🚀 Termux SSH Auto-Setup

A simple and fast Bash script to automatically install, configure, and start an **OpenSSH** server on **Termux**.

---

## 🛠️ Features

* 🔄 **Updates packages** (`apt update`).
* 📦 **Installs dependencies**: `openssh` and `iproute2`.
* 🔑 **Generates SSH host keys** (`ssh-keygen -A`).
* 🔐 **Sets default user password** to: `00000000`.
* 🚀 **Starts the SSH server** (`sshd`).
* 🌐 **Displays connection details**: Username, local IP address, port (8022), and a ready-to-use SSH command.

---

## 🚀 Quick Start

Run this single command inside your **Termux** app:

```bash
pkg install git -y && git clone https://github.com/Pxi9I/sshfortermux.git && cd sshfortermux && chmod +x sshtermux.sh && ./sshtermux.sh
```
> **Or if you prefer step-by-step:**

```bash
pkg install git -y
git clone https://github.com/Pxi9I/sshfortermux.git
cd sshfortermux
chmod +x sshtermux.sh
./sshtermux.sh
```
