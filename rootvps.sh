# Created by: мαυт cσ∂єя (@maut_coder_bot)
# Telegram Channel: https://t.me/maut_vpn

# System Information
MYIP=$(wget -qO- ifconfig.me);

# Color Definitions
BRed="\e[1;31m"
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
BPurple='\e[1;35m'
NC='\e[0m'

# Configure SSH
wget -qO- -O /etc/ssh/sshd_config https://raw.githubusercontent.com/maut-script/maut-auto/master/sshd_config;
systemctl restart sshd;
clear;

# ┌───────────────────────────────────────────────────────────────────┐
# │                  VPS ROOT ACCESS SETUP                            │
# ├───────────────────────────────────────────────────────────────────┤
# │                     мαυт cσ∂єя VPN Panel                          │
# └───────────────────────────────────────────────────────────────────┘

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;96mROOT ACCESS CONFIGURATION\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                          \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
echo ""

read -p "  ╰─➤ Enter Password : " pass
clear

if [[ ! -z "${pass}" ]]; then
    echo ""
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m             \e[1;93m⚠️  SAVE THIS VPS INFORMATION\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[92m• IP Address \e[0m : $MYIP                                 \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[92m• SSH Port   \e[0m : 22 or 2269                              \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[92m• Username   \e[0m : root                                    \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[92m• Password   \e[0m : ********                                \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m"
    echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[92m✓ Successfully enabled root access!\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
    echo ""
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m  \e[93m⚠️  System will reboot in 5 seconds...\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
    read -n 1 -s -r -p "  Press any key to reboot immediately..."
    rm -rf rootvps.sh
    reboot
fi