#!/bin/bash
# =========================================
# VPS Control Panel | Script Setup Manager
# Edition : Stable Edition 1.0
# Owner   : мαυт cσ∂єя (@maut_coder_bot)
# =========================================

BGreen='\e[1;32m'
NC='\e[0m'
domain=$(cat /etc/xray/domain)
echo "$domain" > /root/domain
clear
MYIP=$(wget -qO- ifconfig.co);
MYIP2="s/xxxxxxxxx/$MYIP/g";

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                \e[1;96mVPN SERVICES INSTALLATION\e[0m                 \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                  \e[97mmαυт cσ∂єя Edition\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mInstalling Squid Proxy...\e[0m                               \e[36m│\e[0m"
apt -y install squid3
sleep 1
echo -e "\e[36m│\e[0m  \e[92m✓ Squid Proxy installation complete\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mConfiguring Squid...\e[0m                                   \e[36m│\e[0m"
apt -y install squid
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/udp-custom/openvpn/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf
echo -e "\e[36m│\e[0m  \e[92m✓ Squid configuration complete\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mInstalling OpenVPN...\e[0m                                  \e[36m│\e[0m"
wget https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/udp-custom/openvpn/vpn.sh && chmod +x vpn.sh && ./vpn.sh
echo -e "\e[36m│\e[0m  \e[92m✓ OpenVPN installation complete\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

cd
chown -R www-data:www-data /home/vps/public_html
sleep 0.5

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mRestarting all services...\e[0m                             \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"

/etc/init.d/nginx restart >/dev/null 2>&1
sleep 0.5
echo -e "\e[36m│\e[0m  \e[92m● Nginx service restarted\e[0m                              \e[36m│\e[0m"

/etc/init.d/openvpn restart >/dev/null 2>&1
sleep 0.5
echo -e "\e[36m│\e[0m  \e[92m● OpenVPN service restarted\e[0m                            \e[36m│\e[0m"

/etc/init.d/cron restart >/dev/null 2>&1
sleep 0.5
echo -e "\e[36m│\e[0m  \e[92m● Cron service restarted\e[0m                               \e[36m│\e[0m"

/etc/init.d/ssh restart >/dev/null 2>&1
sleep 0.5
echo -e "\e[36m│\e[0m  \e[92m● SSH service restarted\e[0m                                \e[36m│\e[0m"

/etc/init.d/dropbear restart >/dev/null 2>&1
sleep 0.5
echo -e "\e[36m│\e[0m  \e[92m● Dropbear service restarted\e[0m                           \e[36m│\e[0m"

/etc/init.d/fail2ban restart >/dev/null 2>&1
sleep 0.5
echo -e "\e[36m│\e[0m  \e[92m● Fail2ban service restarted\e[0m                           \e[36m│\e[0m"

/etc/init.d/stunnel4 restart >/dev/null 2>&1
sleep 0.5
echo -e "\e[36m│\e[0m  \e[92m● Stunnel4 service restarted\e[0m                           \e[36m│\e[0m"

/etc/init.d/vnstat restart >/dev/null 2>&1
sleep 0.5
echo -e "\e[36m│\e[0m  \e[92m● Vnstat service restarted\e[0m                             \e[36m│\e[0m"

/etc/init.d/squid restart >/dev/null 2>&1
echo -e "\e[36m│\e[0m  \e[92m● Squid service restarted\e[0m                              \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m                \e[1;96mмαυт cσ∂єя VPN PANEL\e[0m                    \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m                 \e[97mStable Edition 1.0\e[0m                       \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m" | tee -a log-install.txt
echo "" | tee -a log-install.txt

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m                    \e[1;97mSERVICES & PORTS\e[0m                     \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● OpenSSH                 :\e[0m \e[96m22\e[0m                         \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● OpenVPN                 :\e[0m \e[96m1194\e[0m                       \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Squid Proxy             :\e[0m \e[96m3128, 8000\e[0m                \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● SSH Websocket           :\e[0m \e[96m80\e[0m                         \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● SSH SSL Websocket       :\e[0m \e[96m443\e[0m                        \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Stunnel4                :\e[0m \e[96m222, 777\e[0m                  \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Dropbear                :\e[0m \e[96m109, 143\e[0m                  \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Badvpn                  :\e[0m \e[96m7100-7900\e[0m                 \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Nginx                   :\e[0m \e[96m81\e[0m                         \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Vmess WS TLS            :\e[0m \e[96m443\e[0m                        \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Vless WS TLS            :\e[0m \e[96m443\e[0m                        \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Trojan WS TLS           :\e[0m \e[96m443\e[0m                        \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Shadowsocks WS TLS      :\e[0m \e[96m443\e[0m                        \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Vmess WS none TLS       :\e[0m \e[96m80\e[0m                         \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Vless WS none TLS       :\e[0m \e[96m80\e[0m                         \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Trojan WS none TLS      :\e[0m \e[96m80\e[0m                         \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Shadowsocks WS none TLS :\e[0m \e[96m80\e[0m                         \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Vmess gRPC              :\e[0m \e[96m443\e[0m                        \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Vless gRPC              :\e[0m \e[96m443\e[0m                        \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Trojan gRPC             :\e[0m \e[96m443\e[0m                        \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[90m● Shadowsocks gRPC        :\e[0m \e[96m443\e[0m                        \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m" | tee -a log-install.txt

echo "" | tee -a log-install.txt
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m                      \e[1;97mCONTACT INFORMATION\e[0m                 \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[94mOwner:\e[0m \e[97mмαυт cσ∂єя (@maut_coder_bot)\e[0m             \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m│\e[0m  \e[94mChannel:\e[0m \e[96mhttps://t.me/maut_vpn\e[0m                  \e[36m│\e[0m" | tee -a log-install.txt
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m" | tee -a log-install.txt

echo -e "" | tee -a log-install.txt
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ All services have been installed and configured\e[0m       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ Installation log saved to /root/log-install.txt\e[0m        \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

rm -rf openvpn.sh
sleep 5
cd
clear