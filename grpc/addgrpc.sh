#!/bin/bash
# Color Definitions
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`

# Getting IP
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
domain=$(cat /etc/xray/domain)
tls=$(cat /etc/xray/vmessgrpc.json | grep port | awk '{print $2}' | sed 's/,//g')
vl=$(cat /etc/xray/vlessgrpc.json | grep port | awk '{print $2}' | sed 's/,//g')

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                 \e[1;96mCREATE GRPC ACCOUNT\e[0m                          \e[36m│\e[0m"
echo -e "\e[36m│\e[0m               \e[97mmαυт cσ∂єя VPN Panel\e[0m                            \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
    read -rp "  ╰─➤ Username: " -e user
    CLIENT_EXISTS=$(grep -w $user /etc/xray/vmessgrpc.json | wc -l)

    if [[ ${CLIENT_EXISTS} == '1' ]]; then
        echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m  \e[1;31m⚠️  A client with this name already exists!\e[0m             \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97mPlease choose another username.\e[0m                         \e[36m│\e[0m"
        echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
        exit 1
    fi
done

read -p "  ╰─➤ Expired (Days): " masaaktif

uuid=$(cat /proc/sys/kernel/random/uuid)
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/vmessgrpc.json
sed -i '/#vlessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/vlessgrpc.json

cat > /etc/xray/$user-tls.json << EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "GunService",
      "type": "none",
      "host": "${sni}",
      "tls": "tls"
}
EOF

vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmesslink1="vmess://${uuid}@${domain}:${tls}/?type=grpc&encryption=auto&serviceName=GunService&security=tls&sni=${domain}#$user"
vlesslink1="vless://${uuid}@${domain}:${vl}?mode=gun&security=tls&encryption=none&type=grpc&serviceName=GunService&sni=${domain}#$user"

systemctl restart fb-vmess-grpc.service
systemctl restart fb-vless-grpc.service
systemctl restart vmess-grpc.service
systemctl restart vless-grpc.service
service cron restart

clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                  \e[1;92mGRPC ACCOUNT CREATED\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97mRemarks:\e[0m \e[96m${user}\e[0m                                  \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mDomain:\e[0m \e[96m${domain}\e[0m                                 \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mVMess Port:\e[0m \e[96m${tls}\e[0m                                \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mVLess Port:\e[0m \e[96m${vl}\e[0m                                 \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mUUID:\e[0m \e[96m${uuid}\e[0m                                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mAlter ID:\e[0m \e[96m0\e[0m                                       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mMode:\e[0m \e[96mGun\e[0m                                         \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mSecurity:\e[0m \e[96mTLS\e[0m                                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mType:\e[0m \e[96mgRPC\e[0m                                        \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mService Name:\e[0m \e[96mGunService\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mSNI:\e[0m \e[96m${domain}\e[0m                                    \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[1;97mExpired On:\e[0m \e[96m$exp\e[0m                                \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[1;96mVMESS GRPC LINK:\e[0m                                          \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[90m${vmesslink1}\e[0m                    \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[1;96mVLESS GRPC LINK:\e[0m                                          \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[90m${vlesslink1}\e[0m                    \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ Services restarted successfully\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m✓ Cron service updated\e[0m                                      \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mOwner: \e[94mмαυт cσ∂єя (@maut_coder_bot)\e[0m              \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"