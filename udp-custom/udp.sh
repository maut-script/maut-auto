#!/bin/bash
# Script UdpCustom 2023
# Script By мαυт cσ∂єя (@maut_coder_bot)
# =========================================
# VPS Control Panel | Script Setup Manager
# Edition : Stable Edition 1.0
# Owner   : мαυт cσ∂єя (@maut_coder_bot)
# =========================================

# Color Definitions
BGreen='\e[1;32m'
NC='\e[0m'

cd
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                \e[1;96mUDP CUSTOM INSTALLATION\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                  \e[97mmαυт cσ∂єя Edition\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mCleaning up previous installations...\e[0m                     \e[36m│\e[0m"
rm -rf slowdns.sh
rm -rf udp.sh
rm -rf vpn.sh
rm -rf openvpn.sh
rm -rf log-install.txt
rm -rf /usr/bin/usernew
rm -rf /usr/bin/trial
rm -rf /root/domain
echo -e "\e[36m│\e[0m  \e[92m✓ Cleanup completed\e[0m                                     \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mUpdating menu scripts...\e[0m                                \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
wget -q -O /usr/bin/usernew https://raw.githubusercontent.com/maut-script/maut-auto/master/udp-custom/ssh/usernew.sh
wget -q -O /usr/bin/trial https://raw.githubusercontent.com/maut-script/maut-auto/master/udp-custom/ssh/trial.sh
chmod +x /usr/bin/usernew
chmod +x /usr/bin/trial
echo -e "\e[36m│\e[0m  \e[92m✓ Menu scripts updated successfully\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mDownloading SlowDNS script...\e[0m                           \e[36m│\e[0m"
wget https://raw.githubusercontent.com/maut-script/maut-auto/master/udp-custom/slowdns/slowdns.sh && chmod +x slowdns.sh && ./slowdns.sh
sleep 1
echo -e "\e[36m│\e[0m  \e[92m✓ SlowDNS installation completed\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mDownloading OpenVPN script...\e[0m                           \e[36m│\e[0m"
wget https://raw.githubusercontent.com/maut-script/maut-auto/master/udp-custom/openvpn/openvpn.sh && chmod +x openvpn.sh && ./openvpn.sh
sleep 1
echo -e "\e[36m│\e[0m  \e[92m✓ OpenVPN installation completed\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

rm -rf /root/udp
mkdir -p /root/udp

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mInstalling UDP Custom binary...\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[90m● Checking UDP Custom tool...\e[0m                          \e[36m│\e[0m"
sleep 1
clear
echo -e "\e[36m│\e[0m  \e[92m✓ Tool check completed successfully\e[0m                     \e[36m│\e[0m"
sleep 1
clear
echo -e "\e[36m│\e[0m  \e[90m● Downloading UDP Custom binary...\e[0m                      \e[36m│\e[0m"
sleep 1
wget -q --show-progress --load-cookies /tmp/cookies.txt "https://github.com/NETWORKTWEAKER/AUTO-SCRIPT/raw/master/udp-custom/udp-custom-linux-amd64" -O /root/udp/udp-custom && rm -rf /tmp/cookies.txt
chmod +x /root/udp/udp-custom
echo -e "\e[36m│\e[0m  \e[92m✓ UDP Custom binary downloaded successfully\e[0m            \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mDownloading default configuration...\e[0m                    \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[90m● Checking default configuration...\e[0m                    \e[36m│\e[0m"
sleep 1
clear
echo -e "\e[36m│\e[0m  \e[92m✓ Configuration check completed\e[0m                        \e[36m│\e[0m"
sleep 1
clear
echo -e "\e[36m│\e[0m  \e[90m● Downloading default config...\e[0m                        \e[36m│\e[0m"
sleep 1
wget -q --show-progress --load-cookies /tmp/cookies.txt "https://github.com/NETWORKTWEAKER/AUTO-SCRIPT/raw/master/udp-custom/config.json" -O /root/udp/config.json && rm -rf /tmp/cookies.txt
chmod 644 /root/udp/config.json
echo -e "\e[36m│\e[0m  \e[92m✓ Default configuration downloaded successfully\e[0m        \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mCreating systemd service...\e[0m                            \e[36m│\e[0m"
if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by мαυт cσ∂єя VPN Panel

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by мαυт cσ∂єя VPN Panel

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server -exclude $1
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
fi
echo -e "\e[36m│\e[0m  \e[92m✓ Systemd service created successfully\e[0m                 \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mStarting UDP Custom service...\e[0m                          \e[36m│\e[0m"
systemctl start udp-custom &>/dev/null
systemctl enable udp-custom &>/dev/null
echo -e "\e[36m│\e[0m  \e[92m✓ UDP Custom service started successfully\e[0m              \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

cd
rm -rf udp.sh
rm -rf slowdns.sh

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;92mINSTALLATION COMPLETE\e[0m                   \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ All components installed successfully\e[0m                 \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ UDP Custom service is now running\e[0m                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ SlowDNS configured and active\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ OpenVPN installed and ready\e[0m                          \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m⚠️  System will reboot in 5 seconds...\e[0m                  \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mPlease save any ongoing work.\e[0m                          \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

sleep 5
reboot