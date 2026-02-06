#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com)
clear

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;96mSYSTEM MAINTENANCE\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя Panel\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Server IP: \e[1;93m$MYIP\e[0m                                     \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                 \e[1;97mCLEARING RAM CACHE\e[0m                          \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Releasing cached memory...\e[0m                               \e[36m│\e[0m"
echo 1 > /proc/sys/vm/drop_caches
sleep 3
echo -e "\e[36m│\e[0m  \e[97m• Status: \e[1;92mRAM CACHE CLEARED SUCCESSFULLY ✓\e[0m           \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Returning to main menu...\e[0m                               \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

sleep 2
menu