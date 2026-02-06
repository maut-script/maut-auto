#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
clear

# ┌───────────────────────────────────────────────────────────────────┐
# │                   DELETE VMESS ACCOUNT                            │
# ├───────────────────────────────────────────────────────────────────┤
# │                    мαυт cσ∂єя VPN Panel                           │
# └───────────────────────────────────────────────────────────────────┘

NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                \e[1;96mDELETE VMESS ACCOUNT\e[0m                           \e[36m│\e[0m"
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
    m-vmess
fi

clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                \e[1;96mDELETE VMESS ACCOUNT\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[92m📋 Available VMESS Accounts:\e[0m                                 \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m"
grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl | while read line; do
    echo -e "\e[36m│\e[0m   $line                                       \e[36m│\e[0m"
done
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93mEnter to go back to menu\e[0m                                     \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
read -rp "  ╰─➤ Input Username : " user

if [ -z "$user" ]; then
    m-vmess
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
    echo -e "\e[36m│\e[0m  \e[92m✓ VMESS account successfully deleted!\e[0m                         \e[36m│\e[0m"
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
    m-vmess
fi