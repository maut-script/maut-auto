#!/bin/bash
# Created by: мαυт cσ∂єя (@maut_coder_bot)
# Telegram Channel: https://t.me/maut_vpn

# Color Definitions
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'

# IP Check
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
IZIN=$( curl ipv4.icanhazip.com | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
exit 0
fi

clear

# ┌───────────────────────────────────────────────────────────────────┐
# │               ADD SHADOWSOCKS ACCOUNT                             │
# ├───────────────────────────────────────────────────────────────────┤
# │                    мαυт cσ∂єя VPN Panel                           │
# └───────────────────────────────────────────────────────────────────┘

source /var/lib/ipvps.conf
if [[ "$IP" = "" ]]; then
    domain=$(cat /etc/xray/domain)
else
    domain=$IP
fi

tls="$(cat ~/log-install.txt | grep -w "Shadowsocks WS TLS" | cut -d: -f2|sed 's/ //g')"
ntls="$(cat ~/log-install.txt | grep -w "Shadowsocks WS none TLS" | cut -d: -f2|sed 's/ //g')"

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
    clear
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m             \e[1;96mADD SHADOWSOCKS ACCOUNT\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                       \e[36m│\e[0m"
    echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[93m📝 Enter username:\e[0m                                        \e[36m│\e[0m"
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
    
    read -rp "  ╰─➤ Username: " -e user
    CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

    if [[ ${CLIENT_EXISTS} == '1' ]]; then
        clear
        echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m             \e[1;96mADD SHADOWSOCKS ACCOUNT\e[0m                         \e[36m│\e[0m"
        echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                       \e[36m│\e[0m"
        echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[31m⚠️ Username already exists!\e[0m                               \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97mPlease choose another name.\e[0m                              \e[36m│\e[0m"
        echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[97mPress any key to return to menu...\e[0m                          \e[36m│\e[0m"
        echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
        echo ""
        read -n 1 -s -r -p "  "
        m-ssws
    fi
done

cipher="aes-128-gcm"
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "  ╰─➤ Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#ssws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#ssgrpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json

echo $cipher:$uuid > /tmp/log
shadowsocks_base64=$(cat /tmp/log)
echo -n "${shadowsocks_base64}" | base64 > /tmp/log1
shadowsocks_base64e=$(cat /tmp/log1)
shadowsockslink="ss://${shadowsocks_base64e}@isi_bug_disini:$tls?path=ss-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
shadowsockslink1="ss://${shadowsocks_base64e}@isi_bug_disini:$ntls?path=ss-ws&security=none&host=${domain}&type=ws#${user}"
shadowsockslink2="ss://${shadowsocks_base64e}@${domain}:$tls?mode=gun&security=tls&type=grpc&serviceName=ss-grpc&sni=bug.com#${user}"

systemctl restart xray
rm -rf /tmp/log
rm -rf /tmp/log1

# Create client configuration file
cat > /home/vps/public_html/ss-$user.txt <<-END
# Shadowsocks WS Configuration
{ 
 "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "isi_bug_disini"
        },
        "wsSettings": {
          "headers": {
            "Host": "$domain"
          },
          "path": "/ss-ws"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
 }
 
 # Shadowsocks gRPC Configuration

{
    "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "grpcSettings": {
          "multiMode": true,
          "serviceName": "ss-grpc"
        },
        "network": "grpc",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "isi_bug_disini"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
}
END

systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1

clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m             \e[1;96mSHADOWSOCKS ACCOUNT CREATED\e[0m                        \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                         \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[92m✓ Account successfully created!\e[0m                               \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[97m• Remarks        : ${user}\e[0m                                   \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[97m• Domain         : ${domain}\e[0m                                 \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[97m• Wildcard       : (bug.com).${domain}\e[0m                       \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[97m• Port TLS       : ${tls}\e[0m                                    \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[97m• Port none TLS  : ${ntls}\e[0m                                   \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[97m• Port gRPC      : ${tls}\e[0m                                    \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[97m• Password       : ${uuid}\e[0m                                   \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[97m• Cipher         : ${cipher}\e[0m                                 \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[97m• Network        : ws/grpc\e[0m                                   \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[97m• Path           : /ss-ws\e[0m                                    \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[97m• ServiceName    : ss-grpc\e[0m                                   \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[93m🔗 Link TLS:\e[0m                                                \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  ${shadowsockslink}\e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[93m🔗 Link none TLS:\e[0m                                           \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  ${shadowsockslink1}\e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[93m🔗 Link gRPC:\e[0m                                               \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  ${shadowsockslink2}\e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[93m⏰ Expired On     : $exp\e[0m                                     \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m│\e[0m  \e[94m📁 Config file: /home/vps/public_html/ss-${user}.txt\e[0m          \e[36m│\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m" | tee -a /etc/log-create-shadowsocks.log
echo "" | tee -a /etc/log-create-shadowsocks.log

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mPress any key to return to menu...\e[0m                              \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
read -n 1 -s -r -p "  "

m-ssws