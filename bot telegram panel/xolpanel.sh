#!/bin/bash

# ┌───────────────────────────────────────────────────────────────────┐
# │                    XOLPANEL INSTALLATION                          │
# ├───────────────────────────────────────────────────────────────────┤
# │                    мαυт cσ∂єя VPN Panel                           │
# └───────────────────────────────────────────────────────────────────┘

# Clean and update
rm -rf xolpanel.sh
apt update && apt upgrade
apt install python3 python3-pip git
git clone https://github.com/givpn/xolpanel.git
unzip xolpanel/xolpanel.zip
pip3 install -r xolpanel/requirements.txt
pip3 install pillow

# Configuration input
clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                 \e[1;96mXOLPANEL CONFIGURATION\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo ""

read -e -p "  ╰─➤ Input your Bot Token : " bottoken
read -e -p "  ╰─➤ Input Your Id Telegram : " admin
read -e -p "  ╰─➤ Input Your Subdomain : " domain

echo -e BOT_TOKEN='"'$bottoken'"' >> /root/xolpanel/var.txt
echo -e ADMIN='"'$admin'"' >> /root/xolpanel/var.txt
echo -e DOMAIN='"'$domain'"' >> /root/xolpanel/var.txt

clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                 \e[1;96mINSTALLATION COMPLETE\e[0m                            \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ Configuration saved successfully!\e[0m                            \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Bot Token     : $bottoken\e[0m                                 \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Telegram ID   : $admin\e[0m                                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Subdomain     : $domain\e[0m                                   \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m⏳ Setting up service... (10 seconds)\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

sleep 10

# Service configuration
cat > /etc/systemd/system/xolpanel.service << END
[Unit]
Description=мαυт cσ∂єя VPN Panel - XOLPanel Service
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 -m xolpanel
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start xolpanel 
systemctl enable xolpanel

clear

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                 \e[1;96mXOLPANEL READY TO USE\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ Installation complete!\e[0m                                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mTo start using the panel:\e[0m                                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  1. Open your Telegram bot                                  \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  2. Type /menu to access the control panel                  \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m⚠️  System will reboot in 5 seconds...\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

read -n 1 -s -r -p "  Press any key to reboot immediately"
rm -rf xolpanel.sh
clear
reboot