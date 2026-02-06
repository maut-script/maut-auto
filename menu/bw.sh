#!/bin/bash

# ┌─────────────────────────────────────────────────────────────────┐
# │                   мαυт cσ∂єя VPN Panel                          │
# ├─────────────────────────────────────────────────────────────────┤
# │  Telegram: @maut_coder_bot | Channel: https://t.me/maut_vpn     │
# └─────────────────────────────────────────────────────────────────┘

# Color Definitions
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
BPurple='\e[1;35m'
NC='\e[0m'

MYIP=$(wget -qO- ipv4.icanhazip.com)
clear

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                  \e[1;96mBANDWIDTH MONITOR\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;97mмαυт cσ∂єя Panel\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Server IP: \e[1;93m$MYIP\e[0m                                     \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mMONITORING OPTIONS\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[1]\e[0m  View Total Remaining Bandwidth                       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[2]\e[0m  Usage Table (Every 5 Minutes)                        \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[3]\e[0m  Usage Table (Every Hour)                            \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[4]\e[0m  Usage Table (Every Day)                             \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[5]\e[0m  Usage Table (Every Month)                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[6]\e[0m  Usage Table (Every Year)                            \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[7]\e[0m  Highest Usage Table                                 \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[8]\e[0m  Hourly Usage Statistics                             \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[9]\e[0m  View Current Active Usage                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[10]\e[0m View Active Traffic Usage [5s]                      \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[0]\e[0m  Back to System Menu                                \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[x]\e[0m  Exit Menu                                          \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

read -p "  ╰─➤ Select option: " opt
echo ""

case $opt in
1)
    clear 
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                \e[1;96mTOTAL REMAINING BANDWIDTH\e[0m                     \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    vnstat
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
    bw
    ;;

2)
    clear 
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                \e[1;96mBANDWIDTH USAGE (5 MINUTES)\e[0m                   \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    vnstat -5
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
    bw
    ;;

3)
    clear 
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                \e[1;96mBANDWIDTH USAGE (HOURLY)\e[0m                       \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    vnstat -h
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
    bw
    ;;

4)
    clear 
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                \e[1;96mBANDWIDTH USAGE (DAILY)\e[0m                        \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    vnstat -d
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
    bw
    ;;

5)
    clear 
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m               \e[1;96mBANDWIDTH USAGE (MONTHLY)\e[0m                       \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    vnstat -m
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
    bw
    ;;

6)
    clear 
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m               \e[1;96mBANDWIDTH USAGE (YEARLY)\e[0m                        \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    vnstat -y
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
    bw
    ;;

7)
    clear 
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                 \e[1;96mHIGHEST BANDWIDTH USAGE\e[0m                       \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    vnstat -t
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
    bw
    ;;

8)
    clear 
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                \e[1;96mHOURLY USAGE STATISTICS\e[0m                        \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    vnstat -hg
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
    bw
    ;;

9)
    clear 
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                  \e[1;96mLIVE BANDWIDTH USAGE\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[93mPress [Ctrl+C] to exit live monitoring\e[0m                    \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    echo ""
    vnstat -l
    echo ""
    read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
    bw
    ;;

10)
    clear 
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                \e[1;96mLIVE TRAFFIC MONITORING\e[0m                        \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    vnstat -tr
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
    bw
    ;;

0)
    sleep 1
    m-system
    ;;
x)
    exit
    ;;
*)
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                    \e[1;91mINVALID OPTION\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Please select a valid option (0-10 or x)\e[0m               \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Returning to Bandwidth menu...\e[0m                        \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    sleep 1
    bw
    ;;
esac