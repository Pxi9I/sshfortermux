#!/bin/bash
apt update -y > /dev/null 2>&1
apt install openssh iproute2 -y > /dev/null 2>&1
ssh-keygen -A > /dev/null 2>&1
printf "00000000\n00000000\n" | passwd > /dev/null 2>&1

# Install the "sshtermux" command (starts sshd and prints connection details)
BIN_DIR="${PREFIX:-/data/data/com.termux/files/usr}/bin"
cat > "$BIN_DIR/sshtermux" << 'EOF'
#!/bin/bash
pgrep -x sshd > /dev/null 2>&1 || sshd

MY_IP=$(ifconfig 2>/dev/null | grep -E 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | sed 's/addr://' | head -n1)

if [ -z "$MY_IP" ]; then
    MY_IP=$(ip -4 addr show 2>/dev/null | grep -v '127.0.0.1' | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n1)
fi
USER_NAME=$(whoami)
GREEN='\033[1;32m'
CYAN='\033[0;36m'
NC='\033[0m'
echo "--------------------------------------------------"
echo -e "User:       ${CYAN}${USER_NAME}${NC}"
echo -e "IP address: ${CYAN}${MY_IP:-not found}${NC}"
echo -e "Port:       ${CYAN}8022${NC}"
echo "--------------------------------------------------"
echo "Command to connect:"
echo -e "${GREEN}ssh ${USER_NAME}@${MY_IP:-<IP>} -p 8022${NC}"
echo "--------------------------------------------------"
EOF
chmod +x "$BIN_DIR/sshtermux"

# Start the server and show connection details
"$BIN_DIR/sshtermux"

echo "The password has been set to: 00000000"
echo "Change it now with: passwd"
echo "Next time, just run: sshtermux"
