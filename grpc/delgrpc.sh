#!/bin/bash
# Color Definitions
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'

# Getting IP
MYIP=$(wget -qO- ipv4.icanhazip.com);

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;96mChecking VPS Status\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

clear

NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/vmessgrpc.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m  \e[1;31m⚠️  You have no existing VMESS GRPC clients!\e[0m            \e[36m│\e[0m"
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
    exit 1
fi

clear

NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/vlessgrpc.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m  \e[1;31m⚠️  You have no existing VLESS GRPC clients!\e[0m            \e[36m│\e[0m"
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
    exit 1
fi

clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                \e[1;96mDELETE GRPC ACCOUNT\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m              \e[97mmαυт cσ∂єя VPN Panel\e[0m                             \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93mSelect the existing client you want to delete\e[0m               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mPress CTRL+C to return to menu\e[0m                              \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97m     No  Expired   User\e[0m                                    \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"

grep -E "^### " "/etc/xray/vmessgrpc.json" | cut -d ' ' -f 2-3 | nl -s ') ' | while read -r line; do
    echo -e "\e[36m│\e[0m  \e[96m$line\e[0m"
done

grep -E "^### " "/etc/xray/vlessgrpc.json" | cut -d ' ' -f 2-3 | nl -s ') ' | while read -r line; do
    echo -e "\e[36m│\e[0m  \e[96m$line\e[0m"
done

echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
    if [[ ${CLIENT_NUMBER} == '1' ]]; then
        read -rp "  ╰─➤ Select one client [1]: " CLIENT_NUMBER
    else
        read -rp "  ╰─➤ Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
    fi
done

user=$(grep -E "^### " "/etc/xray/vmessgrpc.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/vmessgrpc.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/etc/xray/vlessgrpc.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/vlessgrpc.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)

sed -i "/^### $user $exp/,/^},{/d" /etc/xray/vmessgrpc.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/vlessgrpc.json
rm -f /etc/xray/$user-tls.json

systemctl restart vmess-grpc.service
systemctl restart vless-grpc.service

clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                  \e[1;92mGRPC ACCOUNT DELETED\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97mUsername:\e[0m \e[96m$user\e[0m                                   \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mExpiry Date:\e[0m \e[96m$exp\e[0m                                 \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ Account removed from VMESS GRPC\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ Account removed from VLESS GRPC\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ Configuration files cleaned\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ Services restarted successfully\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
echo ""
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mOwner: \e[94mмαυт cσ∂єя (@maut_coder_bot)\e[0m              \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"