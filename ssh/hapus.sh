#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com)
clear

echo -e "\e[36m┌─────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                  \e[1;96mDELETE USER ACCOUNT\e[0m                   \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;97mмαυт cσ∂єя Panel\e[0m                    \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Server IP: \e[1;93m$MYIP\e[0m                                  \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────┘\e[0m"
echo ""

read -p "  ╰─➤ Username to Delete : " Pengguna

echo ""
echo -e "\e[36m┌─────────────────────────────────────────────────────────┐\e[0m"

if getent passwd $Pengguna > /dev/null 2>&1; then
    userdel $Pengguna > /dev/null 2>&1
    echo -e "\e[36m│\e[0m  \e[1;92m✓ SUCCESS:\e[0m User '\e[1;93m$Pengguna\e[0m' has been \e[31mremoved\e[0m         \e[36m│\e[0m"
else
    echo -e "\e[36m│\e[0m  \e[1;91m✗ FAILURE:\e[0m User '\e[1;93m$Pengguna\e[0m' does \e[31mnot exist\e[0m        \e[36m│\e[0m"
fi

echo -e "\e[36m├─────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m        \e[94mOwner: мαυт cσ∂єя (@maut_coder_bot)\e[0m         \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────┘\e[0m"
echo ""
read -n 1 -s -r -p "  ╰─➤ Press any key to return to menu... "

m-sshovpn