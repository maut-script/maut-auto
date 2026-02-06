#!/bin/bash
# =========================================
# VPS Control Panel | Script Setup Manager
# Edition : Stable Edition 1.0
# Owner   : мαυт cσ∂єя (@maut_coder_bot)
# =========================================

# Initialisasi variabel
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ifconfig.co);
MYIP2="s/xxxxxxxxx/$MYIP/g";
ANU=$(ip -o $ANU -4 route show to default | awk '{print $5}');
domain=$(cat /root/domain)

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                  \e[1;96mOPENVPN INSTALLATION\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                    \e[97mmαυт cσ∂єя Edition\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mInstalling OpenVPN and dependencies...\e[0m                    \e[36m│\e[0m"
apt install openvpn easy-rsa unzip -y
apt install openssl iptables iptables-persistent -y
mkdir -p /etc/openvpn/server/easy-rsa/
cd /etc/openvpn/
wget https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/udp-custom/openvpn/vpn.zip
unzip vpn.zip
rm -f vpn.zip
chown -R root:root /etc/openvpn/server/easy-rsa/
echo -e "\e[36m│\e[0m  \e[92m✓ OpenVPN and dependencies installed\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

cd
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mConfiguring OpenVPN plugins...\e[0m                           \e[36m│\e[0m"
mkdir -p /usr/lib/openvpn/
cp /usr/lib/x86_64-linux-gnu/openvpn/plugins/openvpn-plugin-auth-pam.so /usr/lib/openvpn/openvpn-plugin-auth-pam.so
sed -i 's/#AUTOSTART="all"/AUTOSTART="all"/g' /etc/default/openvpn
echo -e "\e[36m│\e[0m  \e[92m✓ OpenVPN plugins configured\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mStarting OpenVPN services...\e[0m                            \e[36m│\e[0m"
systemctl enable --now openvpn-server@server-tcp-1194
systemctl enable --now openvpn-server@server-udp-2200
/etc/init.d/openvpn restart
/etc/init.d/openvpn status
echo -e "\e[36m│\e[0m  \e[92m✓ OpenVPN services started successfully\e[0m                \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mEnabling IPv4 forwarding...\e[0m                             \e[36m│\e[0m"
echo 1 > /proc/sys/net/ipv4/ip_forward
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
echo -e "\e[36m│\e[0m  \e[92m✓ IPv4 forwarding enabled\e[0m                              \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mCreating OpenVPN client configurations...\e[0m               \e[36m│\e[0m"

# Buat config client TCP 1194
cat > /etc/openvpn/client-tcp-1194.ovpn <<-END
setenv FRIENDLY_NAME "мαυт cσ∂єя OVPN TCP"
client
dev tun
proto tcp
setenv CLIENT_CERT 0
remote $domain 1194
http-proxy xxxxxxxxx 8000
resolv-retry infinite
route-method exe
nobind
remote-cert-tls server
cipher AES-256-CBC
auth SHA256
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END

sed -i $MYIP2 /etc/openvpn/client-tcp-1194.ovpn;

# Buat config client UDP 2200
cat > /etc/openvpn/client-udp-2200.ovpn <<-END
setenv FRIENDLY_NAME "мαυт cσ∂єя OVPN UDP"
client
dev tun
proto udp
setenv CLIENT_CERT 0
remote $domain 2200
resolv-retry infinite
route-method exe
nobind
remote-cert-tls server
cipher AES-256-CBC
auth SHA256
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END

sed -i $MYIP2 /etc/openvpn/client-udp-2200.ovpn;

# Buat config client SSL
cat > /etc/openvpn/client-tcp-ssl.ovpn <<-END
setenv FRIENDLY_NAME "мαυт cσ∂єя OVPN SSL"
client
dev tun
proto tcp
setenv CLIENT_CERT 0
remote $domain 442
resolv-retry infinite
route-method exe
nobind
remote-cert-tls server
cipher AES-256-CBC
auth SHA256
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END

sed -i $MYIP2 /etc/openvpn/client-tcp-ssl.ovpn;

cd
/etc/init.d/openvpn restart
echo -e "\e[36m│\e[0m  \e[92m✓ Client configurations created\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mAdding certificates to client configurations...\e[0m          \e[36m│\e[0m"

# masukkan certificatenya ke dalam config client TCP 1194
echo '<ca>' >> /etc/openvpn/client-tcp-1194.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/client-tcp-1194.ovpn
echo '</ca>' >> /etc/openvpn/client-tcp-1194.ovpn

# Copy config OpenVPN client ke home directory root agar mudah didownload ( TCP 1194 )
cp /etc/openvpn/client-tcp-1194.ovpn /home/vps/public_html/client-tcp-1194.ovpn

# masukkan certificatenya ke dalam config client UDP 2200
echo '<ca>' >> /etc/openvpn/client-udp-2200.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/client-udp-2200.ovpn
echo '</ca>' >> /etc/openvpn/client-udp-2200.ovpn

# Copy config OpenVPN client ke home directory root agar mudah didownload ( UDP 2200 )
cp /etc/openvpn/client-udp-2200.ovpn /home/vps/public_html/client-udp-2200.ovpn

# masukkan certificatenya ke dalam config client SSL
echo '<ca>' >> /etc/openvpn/client-tcp-ssl.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/client-tcp-ssl.ovpn
echo '</ca>' >> /etc/openvpn/client-tcp-ssl.ovpn

# Copy config OpenVPN client ke home directory root agar mudah didownload ( SSL )
cp /etc/openvpn/client-tcp-ssl.ovpn /home/vps/public_html/client-tcp-ssl.ovpn
echo -e "\e[36m│\e[0m  \e[92m✓ Certificates added and configurations copied\e[0m         \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mConfiguring firewall rules...\e[0m                           \e[36m│\e[0m"
iptables -t nat -I POSTROUTING -s 10.6.0.0/24 -o $ANU -j MASQUERADE
iptables -t nat -I POSTROUTING -s 10.7.0.0/24 -o $ANU -j MASQUERADE
iptables-save > /etc/iptables.up.rules
chmod +x /etc/iptables.up.rules

iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
echo -e "\e[36m│\e[0m  \e[92m✓ Firewall rules configured\e[0m                            \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mFinalizing OpenVPN setup...\e[0m                             \e[36m│\e[0m"
systemctl enable openvpn
systemctl start openvpn
/etc/init.d/openvpn restart
echo -e "\e[36m│\e[0m  \e[92m✓ OpenVPN setup completed\e[0m                              \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;92mINSTALLATION COMPLETE\e[0m                    \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97mOpenVPN Services:\e[0m                                        \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[90m● TCP Port:\e[0m \e[96m1194\e[0m                                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[90m● UDP Port:\e[0m \e[96m2200\e[0m                                   \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[90m● SSL Port:\e[0m \e[96m442\e[0m                                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[90m● Domain:\e[0m \e[96m$domain\e[0m                                 \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97mClient Configuration Files:\e[0m                              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[90m● TCP Config:\e[0m \e[96mhttp://$MYIP:81/client-tcp-1194.ovpn\e[0m \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[90m● UDP Config:\e[0m \e[96mhttp://$MYIP:81/client-udp-2200.ovpn\e[0m \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[90m● SSL Config:\e[0m \e[96mhttp://$MYIP:81/client-tcp-ssl.ovpn\e[0m  \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

# Cleanup
history -c
rm -f /root/vpn.sh