#!/bin/bash

# Ensure the script is run as root
if [ "${EUID}" -ne 0 ]; then
    echo "┌──────────────────────────────────────────────┐"
    echo "│  ⚠️  You need to run this script as root      │"
    echo "└──────────────────────────────────────────────┘"
    sleep 5
    exit 1
fi

# Check virtualization
if [ "$(systemd-detect-virt)" == "openvz" ]; then
    echo "┌──────────────────────────────────────────────┐"
    echo "│  ⚠️  OpenVZ is not supported                 │"
    echo "└──────────────────────────────────────────────┘"
    sleep 5
    exit 1
fi

# Create necessary directories and files
mkdir -p /etc/xray /etc/v2ray
touch /etc/xray/domain /etc/v2ray/domain /etc/xray/scdomain /etc/v2ray/scdomain

# Update and install required packages
apt-get update
apt-get install -y software-properties-common build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev git dos2unix

# Download and install Python 2.7 from source
cd /usr/src
wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz
tar xzf Python-2.7.18.tgz
cd Python-2.7.18
./configure --enable-optimizations
make altinstall

# Ensure python2.7 is the command for Python 2.7
update-alternatives --install /usr/bin/python python /usr/local/bin/python2.7 1
update-alternatives --set python /usr/local/bin/python2.7

# Check that 'python' command works and points to Python 2.7
if ! python --version 2>&1 | grep -q "Python 2.7"; then
    echo "┌──────────────────────────────────────────────┐"
    echo "│  ⚠️  Failed to set python to Python 2.7      │"
    echo "└──────────────────────────────────────────────┘"
    exit 1
fi

# ┌───────────────────────────────────────────────────────────────────┐
# │                    VPS & VPN PANEL MENU                           │
# ├───────────────────────────────────────────────────────────────────┤
# │  Owner   : мαυт cσ∂єя (@maut_coder_bot)                           │
# │  Channel : https://t.me/maut_vpn                                  │
# └───────────────────────────────────────────────────────────────────┘

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;96mVPS & VPN PANEL MENU\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Owner   : \e[1;97mмαυт cσ∂єя\e[0m (\e[94m@maut_coder_bot\e[0m)                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  Channel : \e[94mhttps://t.me/maut_vpn\e[0m                                \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo ""
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                         \e[1;97mDOMAIN SETUP\e[0m                            \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  1. Use Random Domain                                        \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  2. Use Custom Domain                                        \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
echo ""

read -rp "  ╰─➤ Select option (1-2): " dns

if [ "$dns" -eq 1 ]; then
    # Download cf script and convert line endings
    wget https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/cf
    dos2unix cf
    bash cf
elif [ "$dns" -eq 2 ]; then
    read -rp "  ╰─➤ Enter Your Domain: " dom
    echo "$dom" > /var/lib/ipvps.conf
    echo "$dom" > /root/scdomain
    echo "$dom" > /etc/xray/scdomain
    echo "$dom" > /etc/xray/domain
    echo "$dom" > /etc/v2ray/domain
    echo "$dom" > /root/domain
else
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m  \e[31m⚠️ Invalid option!\e[0m                                          \e[36m│\e[0m"
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
    exit 1
fi

# Install services
wget -q https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/ssh-vpn.sh
dos2unix ssh-vpn.sh
bash ssh-vpn.sh

wget -q https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/xray/ins-xray.sh
dos2unix ins-xray.sh
bash ins-xray.sh

wget -q https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/sshws/insshws.sh
dos2unix insshws.sh
bash insshws.sh

# Setup environment for auto-reboot
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1

# Log setup
mkdir -p /var/lib/
echo "IP=" >> /var/lib/ipvps.conf

# Installation summary
echo ""
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;96mINSTALLATION COMPLETE\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97mServices and Ports:\e[0m                                            \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m OpenSSH: 22                                                   \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m SSH Websocket: 80                                             \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m SSH SSL Websocket: 443                                        \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m Stunnel4: 222, 777                                            \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m Dropbear: 109, 143                                            \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m Badvpn: 7100-7900                                             \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m Nginx: 81                                                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m Vmess WS TLS: 443                                             \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m Vless WS TLS: 443                                             \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m Trojan WS TLS: 443                                            \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m Shadowsocks WS TLS: 443                                       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m Vmess WS none TLS: 80                                         \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m Vless WS none TLS: 80                                         \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m Trojan WS none TLS: 80                                        \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m Shadowsocks WS none TLS: 80                                   \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m Vmess gRPC: 443                                               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m Vless gRPC: 443                                               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m Trojan gRPC: 443                                              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m•\e[0m Shadowsocks gRPC: 443                                         \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя\e[0m                                              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[94mTelegram: @maut_coder_bot\e[0m                                       \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

# Additional commands
bash <(curl -Ls https://raw.githubusercontent.com/lalfulsk/Auto/main/dnsdisable.sh)
wget -O /root/log-install.txt https://github.com/NETWORKTWEAKER/SCRIPTS/raw/main/log-install.txt
bash <(curl -Ls https://raw.githubusercontent.com/lalfulsk/NT-A.I.O/main/dropbearconfig.sh)
bash <(curl -Ls https://github.com/lalfulsk/NT-A.I.O/raw/main/dropbear.sh)
bash <(curl -Ls https://github.com/NETWORKTWEAKER/SCRIPTS/raw/main/swap.sh)
sudo systemctl start dropbear
sudo systemctl enable dropbear

# Cleanup and reboot
rm -f /root/setup.sh /root/ins-xray.sh /root/insshws.sh cf ssh-vpn.sh ins-xray.sh insshws.sh

echo ""
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[93m⚠️  System will reboot in 40 seconds...\e[0m                          \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mPlease save any ongoing work.\e[0m                                   \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
sleep 40

# Reboot
reboot