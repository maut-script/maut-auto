#!/bin/bash
# Quick Setup | Script Setup Manager
# Edition : Stable Edition 1.0
# Owner   : мαυт cσ∂єя (@maut_coder_bot)
# Channel : https://t.me/maut_vpn
# (C) Copyright 2024
# =========================================

# Color definitions
BGreen='\e[1;32m'
NC='\e[0m'

clear
cd

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;96mSCRIPT UPDATER\e[0m                            \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя Panel\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"

# Remove old files
rm -rf debian.sh
rm -rf /usr/bin/clearcache
rm -rf /usr/bin/menu

echo -e "\e[36m│\e[0m  \e[97m• Downloading latest menu files...\e[0m                       \e[36m│\e[0m"
sleep 1

# Download updated files
wget -q -O /usr/bin/clearcache https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/clearcache.sh
wget -q -O /usr/bin/menu https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/menu.sh

sleep 1

# Set permissions
chmod +x /usr/bin/clearcache
chmod +x /usr/bin/menu

clear
rm -rf debian.sh

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;96mUPDATE COMPLETE\e[0m                            \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Status: \e[1;92mSUCCESSFULLY UPDATED ✓\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Files Updated: \e[1;93m2 files\e[0m                            \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• System will reboot in 5 seconds...\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"

sleep 5

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                  \e[1;96mSYSTEM REBOOTING\e[0m                            \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Please wait while system restarts...\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"

# Reboot system
reboot
/sbin/reboot