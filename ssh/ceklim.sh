#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com)
clear

echo -e "\e[36m┌───────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                \e[1;96mMULTI-LOGIN MONITOR\e[0m                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                 \e[1;97mмαυт cσ∂єя Panel\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Server IP: \e[1;93m$MYIP\e[0m                                \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────┘\e[0m"
echo ""

echo -e "\e[36m┌───────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m               \e[1;97mVIOLATION REPORTS\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────┤\e[0m"

if [ -e "/root/log-limit.txt" ]; then
    echo -e "\e[36m│\e[0m  \e[1;91m⚠️  Users Exceeding Multi-Login Limit:\e[0m              \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m                                                    \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mTIMESTAMP - USERNAME - CONNECTIONS\e[0m                  \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[90m─────────────────────────────────────────\e[0m          \e[36m│\e[0m"
    
    if [ -s "/root/log-limit.txt" ]; then
        while IFS= read -r line; do
            echo -e "\e[36m│\e[0m  \e[97m$line\e[0m                     \e[36m│\e[0m"
        done < /root/log-limit.txt
    else
        echo -e "\e[36m│\e[0m                                                    \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[1;92m✓ No active violations found\e[0m                      \e[36m│\e[0m"
    fi
else
    echo -e "\e[36m│\e[0m                                                    \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[1;93mℹ️  No violation data available\e[0m                      \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m                                                    \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mPossible reasons:\e[0m                                   \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  • No users have violated limits yet             \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  • User-limit script hasn't been executed        \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  • Log file was removed                          \e[36m│\e[0m"
fi

echo -e "\e[36m├───────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m       \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────┘\e[0m"
echo ""
read -n 1 -s -r -p "  ╰─➤ Press any key to return to menu... "

m-sshovpn