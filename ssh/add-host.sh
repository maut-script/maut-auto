#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com)
clear

cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
clear

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;96mDOMAIN CONFIGURATION\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя Panel\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Server IP: \e[1;93m$MYIP\e[0m                                    \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mADD SUBDOMAIN\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Enter your custom subdomain (e.g., vpn.yourdomain.com)    \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

read -rp "  ╰─➤ Add Subdomain: " -e host
echo ""

if [ -z $host ]; then
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                    \e[1;91mINPUT ERROR\e[0m                           \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[91m⚠️  Subdomain cannot be empty!\e[0m                            \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mPlease enter a valid subdomain.\e[0m                          \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    echo ""
    read -n 1 -s -r -p "  ╰─➤ Press any key to return to menu... "
    m-domain
else
    echo "IP=$host" > /var/lib/ipvps.conf
    echo "$host" > /root/domain
    
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                  \e[1;92mSUBDOMAIN CONFIGURED\e[0m                     \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• New Subdomain: \e[1;93m$host\e[0m                            \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Status: \e[1;92mSUCCESSFULLY UPDATED ✓\e[0m                      \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[93m⚠️  IMPORTANT: Don't forget to renew SSL certificates\e[0m     \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mfor the new domain configuration.\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    echo ""
    read -n 1 -s -r -p "  ╰─➤ Press any key to return to menu... "
    m-domain
fi