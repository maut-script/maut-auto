domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "Vmess WS TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess WS none TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
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

# ┌───────────────────────────────────────────────────────────────────┐
# │                   TRIAL VMESS ACCOUNT                             │
# ├───────────────────────────────────────────────────────────────────┤
# │                    мαυт cσ∂єя VPN Panel                           │
# └───────────────────────────────────────────────────────────────────┘

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;96mTRIAL VMESS ACCOUNT\e[0m                            \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Remarks       \e[0m : ${user}                                      \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Domain        \e[0m : ${domain}                                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Wildcard      \e[0m : (bug.com).${domain}                          \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Port TLS      \e[0m : ${tls}                                       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Port none TLS \e[0m : ${none}                                      \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Port gRPC     \e[0m : ${tls}                                       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• UUID          \e[0m : ${uuid}                                      \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• AlterId       \e[0m : 0                                            \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Security      \e[0m : auto                                         \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Network       \e[0m : ws                                            \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Path          \e[0m : /vmess                                       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• ServiceName   \e[0m : vmess-grpc                                   \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m🔗 Link TLS\e[0m                                                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  ${vmesslink1}     \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m🔗 Link none TLS\e[0m                                                \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  ${vmesslink2}     \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m🔗 Link gRPC\e[0m                                                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  ${vmesslink3}     \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m⏰ Expired On    \e[0m : $exp                                         \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
echo ""

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mPress any key to return to menu...\e[0m                              \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
read -n 1 -s -r -p "  "

m-vmess