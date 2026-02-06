#!/bin/bash
# Created by: мαυт cσ∂єя (@maut_coder_bot)
# Telegram Channel: https://t.me/maut_vpn

# Color Definitions
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'

# IP Check
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
IZIN=$( curl ipv4.icanhazip.com | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Fuck You!!"
exit 0
fi
clear

# ┌───────────────────────────────────────────────────────────────────┐
# │                DELETE SHADOWSOCKS ACCOUNT                         │
# ├───────────────────────────────────────────────────────────────────┤
# │                    мαυт cσ∂єя VPN Panel                           │
# └───────────────────────────────────────────────────────────────────┘

NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m              \e[1;96mDELETE SHADOWSOCKS ACCOUNT\e[0m                       \e[36m│\e[0m"
    echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                       \e[36m│\e[0m"
    echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[31m⚠️ You don't have any existing clients!\e[0m                       \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m"
    echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mPress any key to return to menu...\e[0m                          \e[36m│\e[0m"
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
    echo ""
    read -n 1 -s -r -p "  "
    m-ssws
fi

clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m              \e[1;96mDELETE SHADOWSOCKS ACCOUNT\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[92m📋 Available Shadowsocks Accounts:\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mUser       Expired\e[0m                                          \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m"
grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | while read line; do
    echo -e "\e[36m│\e[0m  $line                                       \e[36m│\e[0m"
done
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93mEnter to go back to menu\e[0m                                     \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
read -rp "  ╰─➤ Input Username : " user

if [ -z "$user" ]; then
    m-ssws
else
    exp=$(grep -wE "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
    sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
    systemctl restart xray > /dev/null 2>&1
    
    clear
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                \e[1;96mACCOUNT DELETED SUCCESSFULLY\e[0m                  \e[36m│\e[0m"
    echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                       \e[36m│\e[0m"
    echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[92m✓ Shadowsocks account successfully deleted!\e[0m                  \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Client Name :\e[0m $user                                      \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Expired On  :\e[0m $exp                                       \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Deleted On  :\e[0m $(date +"%Y-%m-%d")                         \e[36m│\e[0m"
    echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[92mService restarted successfully\e[0m                              \e[36m│\e[0m"
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
    echo ""
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mPress any key to return to menu...\e[0m                          \e[36m│\e[0m"
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
    read -n 1 -s -r -p "  "
    m-ssws
fi