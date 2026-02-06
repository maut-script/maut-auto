#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
clear

# ┌───────────────────────────────────────────────────────────────────┐
# │                   ADD VMESS ACCOUNT                               │
# ├───────────────────────────────────────────────────────────────────┤
# │                    мαυт cσ∂єя VPN Panel                           │
# └───────────────────────────────────────────────────────────────────┘

source /var/lib/ipvps.conf
if [[ "$IP" = "" ]]; then
    domain=$(cat /etc/xray/domain)
else
    domain=$IP
fi

tls="$(cat ~/log-install.txt | grep -w "Vmess WS TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess WS none TLS" | cut -d: -f2|sed 's/ //g')"

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
    clear
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                 \e[1;96mADD VMESS ACCOUNT\e[0m                            \e[36m│\e[0m"
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
        echo -e "\e[36m│\e[0m                 \e[1;96mADD VMESS ACCOUNT\e[0m                            \e[36m│\e[0m"
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
        m-vmess
    fi
done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "  ╰─➤ Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json

asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`

ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "none"
}
EOF`

grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`

vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1

clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m                 \e[1;96mVMESS ACCOUNT CREATED\e[0m                           \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                         \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[92m✓ Account successfully created!\e[0m                               \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m                                                              \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[97m• Remarks        : ${user}\e[0m                                   \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[97m• Domain         : ${domain}\e[0m                                 \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[97m• Wildcard       : (bug.com).${domain}\e[0m                       \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[97m• Port TLS       : ${tls}\e[0m                                    \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[97m• Port none TLS  : ${none}\e[0m                                   \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[97m• Port gRPC      : ${tls}\e[0m                                    \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[97m• UUID           : ${uuid}\e[0m                                   \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[97m• AlterId        : 0\e[0m                                         \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[97m• Security       : auto\e[0m                                      \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[97m• Network        : ws\e[0m                                        \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[97m• Path           : /vmess\e[0m                                    \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[97m• ServiceName    : vmess-grpc\e[0m                                \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[93m🔗 Link TLS:\e[0m                                                \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  ${vmesslink1}\e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[93m🔗 Link none TLS:\e[0m                                           \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  ${vmesslink2}\e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[93m🔗 Link gRPC:\e[0m                                               \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  ${vmesslink3}\e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m│\e[0m  \e[93m⏰ Expired On     : $exp\e[0m                                     \e[36m│\e[0m" | tee -a /etc/log-create-vmess.log
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m" | tee -a /etc/log-create-vmess.log
echo "" | tee -a /etc/log-create-vmess.log

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mPress any key to return to menu...\e[0m                              \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
read -n 1 -s -r -p "  "

m-vmess