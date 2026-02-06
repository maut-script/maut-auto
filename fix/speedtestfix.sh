#!/bin/bash
# Created by: мαυт cσ∂єя (@maut_coder_bot)
# Telegram Channel: https://t.me/maut_vpn

BGreen='\e[1;32m'
NC='\e[0m'

clear

# ┌───────────────────────────────────────────────────────────────────┐
# │                    SPEEDTEST INSTALLATION                         │
# ├───────────────────────────────────────────────────────────────────┤
# │                    мαυт cσ∂єя VPN Panel                           │
# └───────────────────────────────────────────────────────────────────┘

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                 \e[1;96mSPEEDTEST INSTALLATION\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

rm -rf /usr/bin/speedtest
echo -e "\e[92m📥 Downloading speedtest tool...\e[0m"
wget -q -O /usr/bin/speedtest https://raw.githubusercontent.com/givpn/AutoScriptXray/master/fix/speedtest.sh
chmod +x /usr/bin/speedtest

clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                 \e[1;96mINSTALLATION COMPLETE\e[0m                            \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ Speedtest tool installed successfully!\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Location: /usr/bin/speedtest\e[0m                                \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Permissions: Executable\e[0m                                    \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

sleep 2
rm -rf speedtestfix.sh

clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                  \e[1;96mSYSTEM REBOOT NOTICE\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m⚠️  System will reboot in 5 seconds...\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Changes require system restart\e[0m                              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• All services will restart automatically\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

sleep 5
reboot