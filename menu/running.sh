#!/bin/bash

# ┌─────────────────────────────────────────────────────────────────┐
# │                   мαυт cσ∂єя VPN Panel                          │
# ├─────────────────────────────────────────────────────────────────┤
# │  Telegram: @maut_coder_bot | Channel: https://t.me/maut_vpn     │
# └─────────────────────────────────────────────────────────────────┘

# Color Definitions
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
BPurple='\e[1;35m'
NC='\033[0m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'

# IP Validation
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`

# Color Functions
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

clear

# GETTING OS INFORMATION
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID

# VPS ISP INFORMATION
echo -e ""
MYIP=$(curl -s ifconfig.me)
REGION=$(curl -s ipinfo.io/region?token=ce3da57536810d)
CITY=$(curl -s ipinfo.io/city?token=ce3da57536810d)

# CHECK SERVICE STATUS
tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
shadowsocks=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_server=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
stunnel_service=$(/etc/init.d/stunnel4 status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vnstat_service=$(/etc/init.d/vnstat status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron_service=$(/etc/init.d/cron status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wstls=$(systemctl status ws-stunnel.service | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsdrop=$(systemctl status ws-dropbear.service | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

# STATUS SERVICE OPENVPN
if [[ $oovpn == "active" ]]; then
  status_openvpn="${GREEN}✓ Running${NC}"
else
  status_openvpn="${RED}✗ Not Running${NC}"
fi

# STATUS SERVICE SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${GREEN}✓ Running${NC}"
else
   status_ssh="${RED}✗ Not Running${NC}"
fi

# STATUS SERVICE SQUID 
if [[ $squid_service == "running" ]]; then 
   status_squid="${GREEN}✓ Running${NC}"
else
   status_squid="${RED}✗ Not Running${NC}"
fi

# STATUS SERVICE VNSTAT 
if [[ $vnstat_service == "running" ]]; then 
   status_vnstat="${GREEN}✓ Running${NC}"
else
   status_vnstat="${RED}✗ Not Running${NC}"
fi

# STATUS SERVICE CRONS 
if [[ $cron_service == "running" ]]; then 
   status_cron="${GREEN}✓ Running${NC}"
else
   status_cron="${RED}✗ Not Running${NC}"
fi

# STATUS SERVICE FAIL2BAN 
if [[ $fail2ban_service == "running" ]]; then 
   status_fail2ban="${GREEN}✓ Running${NC}"
else
   status_fail2ban="${RED}✗ Not Running${NC}"
fi

# STATUS SERVICE TLS 
if [[ $tls_v2ray_status == "running" ]]; then 
   status_tls_v2ray="${GREEN}✓ Running${NC}"
else
   status_tls_v2ray="${RED}✗ Not Running${NC}"
fi

# STATUS SERVICE NON TLS V2RAY
if [[ $nontls_v2ray_status == "running" ]]; then 
   status_nontls_v2ray="${GREEN}✓ Running${NC}"
else
   status_nontls_v2ray="${RED}✗ Not Running${NC}"
fi

# STATUS SERVICE VLESS HTTPS
if [[ $vless_tls_v2ray_status == "running" ]]; then
  status_tls_vless="${GREEN}✓ Running${NC}"
else
  status_tls_vless="${RED}✗ Not Running${NC}"
fi

# STATUS SERVICE VLESS HTTP
if [[ $vless_nontls_v2ray_status == "running" ]]; then
  status_nontls_vless="${GREEN}✓ Running${NC}"
else
  status_nontls_vless="${RED}✗ Not Running${NC}"
fi

# STATUS SERVICE TROJAN
if [[ $trojan_server == "running" ]]; then 
   status_virus_trojan="${GREEN}✓ Running${NC}"
else
   status_virus_trojan="${RED}✗ Not Running${NC}"
fi

# STATUS SERVICE DROPBEAR
if [[ $dropbear_status == "running" ]]; then 
   status_beruangjatuh="${GREEN}✓ Running${NC}"
else
   status_beruangjatuh="${RED}✗ Not Running${NC}"
fi

# STATUS SERVICE STUNNEL
if [[ $stunnel_service == "running" ]]; then 
   status_stunnel="${GREEN}✓ Running${NC}"
else
   status_stunnel="${RED}✗ Not Running${NC}"
fi

# STATUS SERVICE WEBSOCKET TLS
if [[ $wstls == "running" ]]; then 
   swstls="${GREEN}✓ Running${NC}"
else
   swstls="${RED}✗ Not Running${NC}"
fi

# STATUS SERVICE WEBSOCKET DROPBEAR
if [[ $wsdrop == "running" ]]; then 
   swsdrop="${GREEN}✓ Running${NC}"
else
   swsdrop="${RED}✗ Not Running${NC}"
fi

# STATUS SHADOWSOCKS
if [[ $shadowsocks == "running" ]]; then 
   status_shadowsocks="${GREEN}✓ Running${NC}"
else
   status_shadowsocks="${RED}✗ Not Running${NC}"
fi

# TOTAL RAM
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))

# KERNEL VERSION
kernelku=$(uname -r)

# GETTING DOMAIN NAME
Domen="$(cat /etc/xray/domain)"

# Display System Information
echo -e "\e[36m┌─────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;96mSYSTEM INFORMATION\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;97mмαυт cσ∂єя Panel\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Hostname    : \e[1;93m$HOSTNAME\e[0m                              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• OS Name     : \e[1;93m$Tipe\e[0m                                 \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Total RAM   : \e[1;93m${totalram} MB\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Public IP   : \e[1;93m$MYIP\e[0m                                 \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Domain      : \e[1;93m$Domen\e[0m                                \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Kernel      : \e[1;93m$kernelku\e[0m                              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Location    : \e[1;93m$CITY, $REGION\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌─────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;96mSUBSCRIPTION INFORMATION\e[0m                    \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Client Name : \e[1;93ммαυт cσ∂єя VPN\e[0m                          \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Owner       : \e[94мαυт cσ∂єя\e[0m                                \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Version     : \e[1;93mPremium 2024\e[0m                             \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Telegram    : \e[94m@maut_coder_bot\e[0m                          \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────────┘\e[0m"

echo -e "\e[36m┌─────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;96mSERVICE STATUS\e[0m                             \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• SSH / Tunnel           : $status_ssh\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Dropbear               : $status_beruangjatuh\e[0m                \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Stunnel4               : $status_stunnel\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Fail2Ban               : $status_fail2ban\e[0m                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Cron Jobs              : $status_cron\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• VnStat                 : $status_vnstat\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• XRAY Vmess TLS         : $status_tls_v2ray\e[0m                   \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• XRAY Vmess None TLS    : $status_nontls_v2ray\e[0m                \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• XRAY Vless TLS         : $status_tls_vless\e[0m                   \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• XRAY Vless None TLS    : $status_nontls_vless\e[0m                \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• XRAY Trojan            : $status_virus_trojan\e[0m                \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• XRAY Shadowsocks       : $status_shadowsocks\e[0m                 \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Websocket TLS          : $swstls\e[0m                             \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97m• Websocket None TLS     : $swstls\e[0m                             \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m               \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────────┘\e[0m"

echo ""
read -n 1 -s -r -p "  ╰─➤ Press any key to return to menu... "
menu