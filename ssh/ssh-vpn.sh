#!/bin/bash
# VPS Control Panel Installation Script
# Owner: мαυт cσ∂єя (@maut_coder_bot)

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m               \e[1;96mVPS CONTROL PANEL INSTALLATION\e[0m               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                 \e[97mmαυт cσ∂єя Edition\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mUpgrading system and installing core packages...\e[0m           \e[36m│\e[0m"
apt dist-upgrade -y
apt install netfilter-persistent -y
apt-get remove --purge ufw firewalld -y
apt install -y screen curl jq bzip2 gzip vnstat coreutils rsyslog iftop zip unzip git apt-transport-https build-essential -y
echo -e "\e[36m│\e[0m  \e[92m✓ System upgraded and core packages installed\e[0m             \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

# Initializing variables
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

# Company details
country=ID
state=Indonesia
locality=Jakarta
organization=none
organizationalunit=none
commonname=none
email=none

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mConfiguring password policies...\e[0m                           \e[36m│\e[0m"
curl -sS https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/password | openssl aes-256-cbc -d -a -pass pass:scvps07gg -pbkdf2 > /etc/pam.d/common-password
chmod +x /etc/pam.d/common-password
echo -e "\e[36m│\e[0m  \e[92m✓ Password policies configured\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

cd

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mConfiguring rc-local service...\e[0m                           \e[36m│\e[0m"
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

chmod +x /etc/rc.local
systemctl enable rc-local
systemctl start rc-local.service
echo -e "\e[36m│\e[0m  \e[92m✓ rc-local service configured\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mDisabling IPv6 and performing system updates...\e[0m            \e[36m│\e[0m"
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y
echo -e "\e[36m│\e[0m  \e[92m✓ IPv6 disabled and system updated\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mInstalling essential packages and tools...\e[0m                \e[36m│\e[0m"
apt -y install jq shc wget curl figlet ruby python make cmake coreutils rsyslog net-tools zip unzip nano sed gnupg gnupg1 bc dirmngr libxml-parser-perl neofetch git lsof libsqlite3-dev libz-dev gcc g++ libreadline-dev zlib1g-dev libssl-dev libssl1.0-dev dos2unix
gem install lolcat
echo -e "\e[36m│\e[0m  \e[92m✓ Essential packages installed\e[0m                          \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mSetting timezone and locale...\e[0m                           \e[36m│\e[0m"
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
echo -e "\e[36m│\e[0m  \e[92m✓ Timezone and locale configured\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mInstalling and configuring Nginx web server...\e[0m            \e[36m│\e[0m"
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT//master/ssh/nginx.conf"
rm /etc/nginx/conf.d/vps.conf
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/vps.conf"
/etc/init.d/nginx restart

mkdir /etc/systemd/system/nginx.service.d
printf "[Service]\nExecStartPost=/bin/sleep 0.1\n" > /etc/systemd/system/nginx.service.d/override.conf
rm /etc/nginx/conf.d/default.conf
systemctl daemon-reload
service nginx restart
cd
mkdir /home/vps
mkdir /home/vps/public_html
wget -O /home/vps/public_html/index.html "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/index"
wget -O /home/vps/public_html/.htaccess "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/.htaccess"
mkdir /home/vps/public_html/ss-ws
mkdir /home/vps/public_html/clash-ws
echo -e "\e[36m│\e[0m  \e[92m✓ Nginx web server configured\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mInstalling and configuring BadVPN...\e[0m                      \e[36m│\e[0m"
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/newudpgw"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
echo -e "\e[36m│\e[0m  \e[92m✓ BadVPN installed and configured\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mConfiguring SSH ports and services...\e[0m                      \e[36m│\e[0m"
cd
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 500' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 40000' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 53' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 51443' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 58080' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 666' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 200' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 22' /etc/ssh/sshd_config
/etc/init.d/ssh restart
echo -e "\e[36m│\e[0m  \e[92m✓ SSH ports configured\e[0m                                 \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mInstalling and configuring Dropbear...\e[0m                     \e[36m│\e[0m"
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 50000 -p 109 -p 110 -p 69"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
echo -e "\e[36m│\e[0m  \e[92m✓ Dropbear installed and configured\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mInstalling and configuring Stunnel4...\e[0m                     \e[36m│\e[0m"
cd
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 222
connect = 127.0.0.1:22

[dropbear]
accept = 777
connect = 127.0.0.1:109

[ws-stunnel]
accept = 2096
connect = 700

[openvpn]
accept = 442
connect = 127.0.0.1:1194

END

openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/lib/systemd/systemd-sysv-install enable stunnel4
systemctl start stunnel4
/etc/init.d/stunnel4 restart
echo -e "\e[36m│\e[0m  \e[92m✓ Stunnel4 installed and configured\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mInstalling security packages...\e[0m                           \e[36m│\e[0m"
apt -y install fail2ban

# Install DDOS Deflate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi

wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo -e "\e[36m│\e[0m  \e[92m✓ Security packages installed\e[0m                          \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mConfiguring SSH banner...\e[0m                                \e[36m│\e[0m"
wget -O /etc/issue.net "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/banner/banner.conf"
echo "Banner /etc/issue.net" >> /etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear
echo -e "\e[36m│\e[0m  \e[92m✓ SSH banner configured\e[0m                                \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mConfiguring firewall rules...\e[0m                            \e[36m│\e[0m"
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
echo -e "\e[36m│\e[0m  \e[92m✓ Firewall rules configured\e[0m                            \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mDownloading and installing control panel scripts...\e[0m        \e[36m│\e[0m"
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/menu.sh"
wget -O m-vmess "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/m-vmess.sh"
wget -O m-vless "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/m-vless.sh"
wget -O running "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/running.sh"
wget -O clearcache "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/clearcache.sh"
wget -O m-ssws "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/m-ssws.sh"
wget -O m-trojan "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/m-trojan.sh"

wget -O m-sshovpn "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/m-sshovpn.sh"
wget -O usernew "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/trial.sh"
wget -O renew "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/renew.sh"
wget -O hapus "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/hapus.sh"
wget -O cek "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/cek.sh"
wget -O member "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/member.sh"
wget -O delete "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/delete.sh"
wget -O autokill "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/tendang.sh"
wget -O sshws "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/sshws.sh"
wget -O user-lock "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/user-lock.sh"
wget -O user-unlock "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/user-unlock.sh"

wget -O m-system "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/m-system.sh"
wget -O m-domain "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/m-domain.sh"
wget -O add-host "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/add-host.sh"
wget -O certv2ray "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/xray/certv2ray.sh"
wget -O speedtest "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/speedtest_cli.py"
wget -O auto-reboot "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/auto-reboot.sh"
wget -O restart "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/restart.sh"
wget -O bw "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/bw.sh"
wget -O m-tcp "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/tcp.sh"
wget -O xp "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/ssh/xp.sh"
wget -O m-dns "https://raw.githubusercontent.com/NETWORKTWEAKER/AUTO-SCRIPT/master/menu/m-dns.sh"

chmod +x menu
chmod +x m-vmess
chmod +x m-vless
chmod +x running
chmod +x clearcache
chmod +x m-ssws
chmod +x m-trojan

chmod +x m-sshovpn
chmod +x usernew
chmod +x trial
chmod +x renew
chmod +x hapus
chmod +x cek
chmod +x member
chmod +x delete
chmod +x autokill
chmod +x ceklim
chmod +x tendang
chmod +x sshws
chmod +x user-lock
chmod +x user-unlock

chmod +x m-system
chmod +x m-domain
chmod +x add-host
chmod +x certv2ray
chmod +x speedtest
chmod +x auto-reboot
chmod +x restart
chmod +x bw
chmod +x m-tcp
chmod +x xp
chmod +x m-dns
echo -e "\e[36m│\e[0m  \e[92m✓ Control panel scripts installed\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

cd

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mConfiguring cron jobs...\e[0m                                 \e[36m│\e[0m"
cat > /etc/cron.d/re_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 2 * * * root /sbin/reboot
END

cat > /etc/cron.d/xp_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 0 * * * root /usr/bin/xp
END

cat > /home/re_otm <<-END
7
END

service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
echo -e "\e[36m│\e[0m  \e[92m✓ Cron jobs configured\e[0m                                 \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mCleaning up unnecessary files...\e[0m                         \e[36m│\e[0m"
apt autoclean -y >/dev/null 2>&1

if dpkg -s unscd >/dev/null 2>&1; then
apt -y remove --purge unscd >/dev/null 2>&1
fi

apt-get -y --purge remove samba* >/dev/null 2>&1
apt-get -y --purge remove apache2* >/dev/null 2>&1
apt-get -y --purge remove bind9* >/dev/null 2>&1
apt-get -y remove sendmail* >/dev/null 2>&1
apt autoremove -y >/dev/null 2>&1
echo -e "\e[36m│\e[0m  \e[92m✓ System cleaned up\e[0m                                   \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

cd
chown -R www-data:www-data /home/vps/public_html
sleep 0.5

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mRestarting all services...\e[0m                              \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
/etc/init.d/nginx restart >/dev/null 2>&1
sleep 0.5
echo -e "\e[36m│\e[0m  \e[92m● Nginx service restarted\e[0m                             \e[36m│\e[0m"

/etc/init.d/openvpn restart >/dev/null 2>&1
sleep 0.5
echo -e "\e[36m│\e[0m  \e[92m● OpenVPN service restarted\e[0m                           \e[36m│\e[0m"

/etc/init.d/cron restart >/dev/null 2>&1
sleep 0.5
echo -e "\e[36m│\e[0m  \e[92m● Cron service restarted\e[0m                              \e[36m│\e[0m"

/etc/init.d/ssh restart >/dev/null 2>&1
sleep 0.5
echo -e "\e[36m│\e[0m  \e[92m● SSH service restarted\e[0m                               \e[36m│\e[0m"

/etc/init.d/dropbear restart >/dev/null 2>&1
sleep 0.5
echo -e "\e[36m│\e[0m  \e[92m● Dropbear service restarted\e[0m                          \e[36m│\e[0m"

/etc/init.d/fail2ban restart >/dev/null 2>&1
sleep 0.5
echo -e "\e[36m│\e[0m  \e[92m● Fail2ban service restarted\e[0m                          \e[36m│\e[0m"

/etc/init.d/stunnel4 restart >/dev/null 2>&1
sleep 0.5
echo -e "\e[36m│\e[0m  \e[92m● Stunnel4 service restarted\e[0m                          \e[36m│\e[0m"

/etc/init.d/vnstat restart >/dev/null 2>&1
sleep 0.5
echo -e "\e[36m│\e[0m  \e[92m● Vnstat service restarted\e[0m                            \e[36m│\e[0m"

/etc/init.d/squid restart >/dev/null 2>&1
echo -e "\e[36m│\e[0m  \e[92m● Squid service restarted\e[0m                             \e[36m│\e[0m"

screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
echo -e "\e[36m│\e[0m  \e[92m● BadVPN services started\e[0m                             \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

history -c
echo "unset HISTFILE" >> /etc/profile

rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh
rm -f /root/bbr.sh

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                  \e[1;92mINSTALLATION COMPLETE\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97m✓ All services have been installed and configured\e[0m       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m✓ Control panel is ready for use\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m✓ System security has been configured\e[0m                  \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[94mOwner: \e[97mмαυт cσ∂єя (@maut_coder_bot)\e[0m             \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[94mChannel: \e[96mhttps://t.me/maut_vpn\e[0m                  \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

clear