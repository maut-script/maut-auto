#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com)
clear

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;96mVLESS MANAGEMENT\e[0m                          \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;97mмαυт cσ∂єя Panel\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Server IP: \e[1;93m$MYIP\e[0m                                     \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;97mMANAGEMENT OPTIONS\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[1]\e[0m  Create Vless Account                               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[2]\e[0m  Trial Vless Account                                \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[3]\e[0m  Extend Vless Account                               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[4]\e[0m  Delete Vless Account                               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[5]\e[0m  Check Vless Login                                  \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[6]\e[0m  View All Vless Accounts                            \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[0]\e[0m  \e[31mBack to Main Menu\e[0m                                \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Press 'x' or [Ctrl+C] to Exit                       \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m          \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

read -p "  ╰─➤ Select option: "  opt
echo ""

case $opt in
    1) clear ; add-vless ; exit ;;
    2) clear ; trialvless ; exit ;;
    3) clear ; renew-vless ; exit ;;
    4) clear ; del-vless ; exit ;;
    5) clear ; cek-vless ; exit ;;
    6) clear ; cat /etc/log-create-vless.log ; exit ;;
    0) clear ; menu ; exit ;;
    x) exit ;;
    *) 
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;91mINVALID OPTION\e[0m                          \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• Please select a valid option (0-6 or x)\e[0m                 \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• Returning to VLess menu...\e[0m                            \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        sleep 2
        m-sshovpn
        ;;
esac