#!/bin/bash
apt update -y > /dev/null 2>&1
apt install openssh iproute2 -y > /dev/null 2>&1
ssh-keygen -A > /dev/null 2>&1
printf "00000000\n00000000\n" | passwd > /dev/null 2>&1
sshd
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
echo -e "IP address: ${CYAN}${MY_IP:-nie znaleziono}${NC}"
echo -e "Port:       ${CYAN}8022${NC}"
echo "--------------------------------------------------"
echo "Command to connect:"
echo -e "${GREEN}ssh ${USER_NAME}@${MY_IP:-<IP>} -p 8022${NC}"
echo "--------------------------------------------------"
