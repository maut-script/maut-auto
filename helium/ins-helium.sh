#!/bin/bash
# =========================================
# VPS Control Panel | Script Setup Manager
# Edition : Stable Edition 1.0
# Owner   : мαυт cσ∂єя (@maut_coder_bot)
# =========================================

# Color Definitions
BGreen='\e[1;32m'
NC='\e[0m'

clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;96mVPS PANEL UPDATER\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                  \e[97mmαυт cσ∂єя Edition\e[0m                          \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

# Update System Menu
rm -rf /usr/bin/m-system
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mUpdating System Menu...\e[0m                                   \e[36m│\e[0m"
wget -q -O /usr/bin/m-system https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/helium/menu/m-system.sh
chmod +x /usr/bin/m-system
echo -e "\e[36m│\e[0m  \e[92m✓ System Menu updated successfully\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

# Update Webmin Panel
rm -rf /usr/bin/wbmn
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mDownloading Webmin Panel...\e[0m                               \e[36m│\e[0m"
wget -q -O /usr/bin/wbmn https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/helium/webmin/wbmn.sh
chmod +x /usr/bin/wbmn
echo -e "\e[36m│\e[0m  \e[92m✓ Webmin Panel downloaded successfully\e[0m                    \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

# Update ADS Block Panel
rm -rf /usr/bin/helium
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mDownloading ADS Block Panel...\e[0m                           \e[36m│\e[0m"
wget -q -O /usr/bin/helium https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/helium/helium.sh
chmod +x /usr/bin/helium
echo -e "\e[36m│\e[0m  \e[92m✓ ADS Block Panel downloaded successfully\e[0m                \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ Setup completed successfully\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

# Cleanup and Reboot
rm -rf /usr/bin/ins-helium
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[93m⚠️  System will reboot in 5 seconds...\e[0m                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mPlease save any ongoing work.\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
sleep 5
reboot