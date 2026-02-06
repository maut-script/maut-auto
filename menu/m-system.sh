#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com)
clear

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;96mSYSTEM MANAGEMENT\e[0m                          \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя Panel\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Server IP: \e[1;93m$MYIP\e[0m                                     \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;97mSYSTEM OPTIONS\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[1]\e[0m  Domain Management                                 \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[2]\e[0m  Speedtest VPS                                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[3]\e[0m  Auto Reboot Settings                              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[4]\e[0m  Restart All Services                              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[5]\e[0m  Bandwidth Monitoring                              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[6]\e[0m  Install TCP BBR                                   \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[7]\e[0m  DNS Configuration                                 \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[0]\e[0m  \e[31mBack to Main Menu\e[0m                               \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Press 'x' or [Ctrl+C] to Exit                       \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m          \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

read -p "  ╰─➤ Select option: " opt
echo ""

case $opt in
    1) clear ; m-domain ; exit ;;
    2) clear ; speedtest ; exit ;;
    3) clear ; auto-reboot ; exit ;;
    4) clear ; restart ; exit ;;
    5) clear ; bw ; exit ;;
    6) clear ; m-tcp ; exit ;;
    7) clear ; m-dns ; exit ;;
    0) clear ; menu ; exit ;;
    x) exit ;;
    *) 
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;91mINVALID OPTION\e[0m                         \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• Please select a valid option (0-7 or x)\e[0m                \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• Returning to System menu...\e[0m                          \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        sleep 1
        m-system
        ;;
esac