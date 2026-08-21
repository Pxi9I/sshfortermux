#!/bin/bash
apt update -y > /dev/null 2>&1
apt install openssh iproute2 -y > /dev/null 2>&1
ssh-keygen -A > /dev/null 2>&1
printf "00000000\n00000000\n" | passwd > /dev/null 2>&1
sshd
MY_IP=$(ip route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="src") print $(i+1)}')
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
