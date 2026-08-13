#!/bin/bash
apt update -y
apt install openssh iproute2 -y
ssh-keygen -A
printf "00000000\n00000000\n" | passwd
sshd
MY_IP=$(ip route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="src") print $(i+1)}')
USER_NAME=$(whoami)
echo "User: ${USER_NAME}"
echo "IP address: ${MY_IP:-nie znaleziono}"
echo "port: 8022"
echo "Command to connect:"
echo "ssh ${USER_NAME}@${MY_IP} -p 8022"