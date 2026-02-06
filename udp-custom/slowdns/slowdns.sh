# =========================================
# VPS Control Panel | Script Setup Manager
# Edition : Stable Edition 1.0
# Owner   : мαυт cσ∂єя (@maut_coder_bot)
# =========================================

# Color Definitions
BGreen='\e[1;32m'
NC='\e[0m'

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                  \e[1;96mSLOWDNS INSTALLATION\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                    \e[97mmαυт cσ∂єя Edition\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

# Setting IPtables
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mConfiguring IPtables rules...\e[0m                            \e[36m│\e[0m"
iptables -I INPUT -p udp --dport 5300 -j ACCEPT
iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300
netfilter-persistent save
netfilter-persistent reload
echo -e "\e[36m│\e[0m  \e[92m✓ IPtables rules configured successfully\e[0m                \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

cd
# Delete directory
rm -rf /root/nsdomain
rm nsdomain

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mEnter your subdomain details:\e[0m                            \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
read -rp "  ╰─➤ Enter current subdomain used for hosting: " -e sub
SUB_DOMAIN=${sub}
NS_DOMAIN=ns-${SUB_DOMAIN}
echo $NS_DOMAIN > /root/nsdomain

nameserver=$(cat /root/nsdomain)
domen=$(cat /etc/xray/domain)

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mInstalling system dependencies...\e[0m                        \e[36m│\e[0m"
apt update -y
apt install -y python3 python3-dnslib net-tools
apt install ncurses-utils -y
apt install dnsutils -y
apt install git -y
apt install curl -y
apt install wget -y
apt install screen -y
apt install cron -y
apt install iptables -y
apt install -y git screen whois dropbear wget
apt install -y sudo gnutls-bin
apt install -y dos2unix debconf-utils
service cron reload
service cron restart
echo -e "\e[36m│\e[0m  \e[92m✓ System dependencies installed successfully\e[0m            \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mConfiguring SSH additional ports...\e[0m                      \e[36m│\e[0m"
cd
echo "Port 2222" >> /etc/ssh/sshd_config
echo "Port 2269" >> /etc/ssh/sshd_config
sed -i 's/#AllowTcpForwarding yes/AllowTcpForwarding yes/g' /etc/ssh/sshd_config
service ssh restart
service sshd restart
echo -e "\e[36m│\e[0m  \e[92m✓ SSH ports 2222 and 2269 configured\e[0m                    \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mDownloading and configuring SlowDNS...\e[0m                  \e[36m│\e[0m"
rm -rf /etc/slowdns
mkdir -m 777 /etc/slowdns
wget -q -O /etc/slowdns/server.key "https://raw.githubusercontent.com/fisabiliyusri/SLDNS/main/slowdns/server.key"
wget -q -O /etc/slowdns/server.pub "https://raw.githubusercontent.com/fisabiliyusri/SLDNS/main/slowdns/server.pub"
wget -q -O /etc/slowdns/sldns-server "https://raw.githubusercontent.com/fisabiliyusri/SLDNS/main/slowdns/sldns-server"
wget -q -O /etc/slowdns/sldns-client "https://raw.githubusercontent.com/fisabiliyusri/SLDNS/main/slowdns/sldns-client"
cd
chmod +x /etc/slowdns/server.key
chmod +x /etc/slowdns/server.pub
chmod +x /etc/slowdns/sldns-server
chmod +x /etc/slowdns/sldns-client
echo -e "\e[36m│\e[0m  \e[92m✓ SlowDNS components downloaded and prepared\e[0m           \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

cd
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mCreating systemd service files...\e[0m                        \e[36m│\e[0m"

# Install client-sldns.service
cat > /etc/systemd/system/client-sldns.service << END
[Unit]
Description=мαυт cσ∂єя SlowDNS Client Service
Documentation=https://t.me/maut_vpn
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/etc/slowdns/sldns-client -udp 8.8.8.8:53 --pubkey-file /etc/slowdns/server.pub $nameserver 127.0.0.1:2222
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# Install server-sldns.service
cat > /etc/systemd/system/server-sldns.service << END
[Unit]
Description=мαυт cσ∂єя SlowDNS Server Service
Documentation=https://t.me/maut_vpn
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/etc/slowdns/sldns-server -udp :5300 -privkey-file /etc/slowdns/server.key $nameserver 127.0.0.1:2269
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# Permission service slowdns
cd
chmod +x /etc/systemd/system/client-sldns.service
chmod +x /etc/systemd/system/server-sldns.service

pkill sldns-server
pkill sldns-client

systemctl daemon-reload
systemctl stop client-sldns
systemctl stop server-sldns

systemctl enable client-sldns
systemctl enable server-sldns

systemctl start client-sldns
systemctl start server-sldns

systemctl restart client-sldns
systemctl restart server-sldns
echo -e "\e[36m│\e[0m  \e[92m✓ SlowDNS services configured and started\e[0m              \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;92mSETUP COMPLETED\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97mNameserver:\e[0m \e[96m$nameserver\e[0m                             \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mDomain:\e[0m \e[96m$domen\e[0m                                    \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m⚠️  Please point NS type for \e[96m$nameserver\e[93m              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m   with target: \e[96m$domen\e[93m                                \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ SlowDNS service is now running\e[0m                          \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ Ports 2222 and 2269 are active for SSH\e[0m                 \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

sleep 10