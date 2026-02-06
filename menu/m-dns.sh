#!/bin/bash

# =========================================
# Owner: мαυт cσ∂єя | Telegram: @maut_coder_bot
# =========================================

# Color Definitions
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
y="\033[0;1;37m"
wh="\033[0m"

# Getting IP Address
MYIP=$(wget -qO- ipv4.icanhazip.com)
clear

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;96mDNS CONFIGURATION\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;97mмαυт cσ∂єя Panel\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Server IP: \e[1;93m$MYIP\e[0m                                    \e[36m│\e[0m"

dnsfile="/root/dns"
if test -f "$dnsfile"; then
    udns=$(cat /root/dns)
    echo -e "\e[36m│\e[0m  Active DNS: \e[1;92m$udns\e[0m                                \e[36m│\e[0m"
fi

echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;97mDNS OPTIONS\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[1]\e[0m  Change DNS Server                                 \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[2]\e[0m  Reset to Default DNS                              \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[0]\e[0m  Back to System Menu                               \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

read -p "  ╰─➤ Select option [0-2]: " dns
echo ""

case $dns in
    1)
        clear
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                   \e[1;96mCHANGE DNS SERVER\e[0m                       \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[97mEnter new DNS server (e.g., 1.1.1.1, 8.8.8.8):\e[0m           \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        echo ""
        read -p "  ╰─➤ Please Insert DNS: " dns1
        
        if [ -z $dns1 ]; then
            echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
            echo -e "\e[36m│\e[0m                    \e[1;91mERROR\e[0m                               \e[36m│\e[0m"
            echo -e "\e[36m│\e[0m  \e[97m• DNS cannot be empty!\e[0m                               \e[36m│\e[0m"
            echo -e "\e[36m│\e[0m  \e[97m• Please insert a valid DNS server.\e[0m                  \e[36m│\e[0m"
            echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
            sleep 2
            clear
            dns
        fi
        
        rm /etc/resolv.conf
        rm /etc/resolvconf/resolv.conf.d/head
        touch /etc/resolv.conf
        touch /etc/resolvconf/resolv.conf.d/head
        echo "$dns1" > /root/dns
        echo "nameserver $dns1" >> /etc/resolv.conf
        echo "nameserver $dns1" >> /etc/resolvconf/resolv.conf.d/head
        systemctl restart resolvconf.service
        
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                  \e[1;92mDNS CONFIGURED\e[0m                           \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• DNS Server: \e[1;93m$dns1\e[0m                               \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• Status: \e[1;92mSUCCESSFULLY CONFIGURED ✓\e[0m               \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        sleep 2
        clear
        dns
        ;;
    2)
        clear
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                  \e[1;96mRESET TO DEFAULT DNS\e[0m                     \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[97mReset DNS to default (8.8.8.8) ?\e[0m                         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        echo ""
        read -p "  ╰─➤ Confirm reset [Y/N]: " -e answer
        
        if [ "$answer" = 'y' ] || [ "$answer" = 'Y' ]; then
            rm /root/dns
            echo "nameserver 8.8.8.8" > /etc/resolv.conf
            echo "nameserver 8.8.8.8" > /etc/resolvconf/resolv.conf.d/head
            
            echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
            echo -e "\e[36m│\e[0m                  \e[1;92mDNS RESET COMPLETE\e[0m                     \e[36m│\e[0m"
            echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
            echo -e "\e[36m│\e[0m  \e[97m• Default DNS: \e[1;93m8.8.8.8\e[0m                           \e[36m│\e[0m"
            echo -e "\e[36m│\e[0m  \e[97m• Status: \e[1;92mRESET TO DEFAULT SUCCESSFULLY ✓\e[0m       \e[36m│\e[0m"
            echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        elif [ "$answer" = 'n' ] || [ "$answer" = 'N' ]; then
            echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
            echo -e "\e[36m│\e[0m                  \e[1;93mOPERATION CANCELLED\e[0m                     \e[36m│\e[0m"
            echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
            echo -e "\e[36m│\e[0m  \e[97m• DNS configuration unchanged\e[0m                          \e[36m│\e[0m"
            echo -e "\e[36m│\e[0m  \e[97m• Operation cancelled by user\e[0m                         \e[36m│\e[0m"
            echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        fi
        sleep 2
        clear
        dns
        ;;
    0)
        clear
        m-system
        ;;
    *)
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;91mINVALID OPTION\e[0m                         \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• Please select a valid option (0-2)\e[0m                     \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• Returning to DNS menu...\e[0m                             \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        sleep 2
        clear
        dns
        ;;
esac