domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "Shadowsocks WS TLS" | cut -d: -f2|sed 's/ //g')"
ntls="$(cat ~/log-install.txt | grep -w "Shadowsocks WS none TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
cipher="aes-128-gcm"
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
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
shadowsockslink2="ss://${shadowsocks_base64e}@isi_bug_disini:$ntls?path=ss-ws&security=tls&host=${domain}&type=ws#${user}"
shadowsockslink1="ss://${shadowsocks_base64e}@${domain}:$tls?mode=gun&security=tls&type=grpc&serviceName=ss-grpc&sni=bug.com#${user}"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1
clear

# ┌───────────────────────────────────────────────────────────────────┐
# │                TRIAL SHADOWSOCKS ACCOUNT                          │
# ├───────────────────────────────────────────────────────────────────┤
# │                    мαυт cσ∂єя VPN Panel                           │
# └───────────────────────────────────────────────────────────────────┘

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                \e[1;96mTRIAL SHADOWSOCKS ACCOUNT\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя VPN Panel\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Remarks       \e[0m : ${user}                                      \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Domain        \e[0m : ${domain}                                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Wildcard      \e[0m : (bug.com).${domain}                          \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Port TLS      \e[0m : ${tls}                                       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Port none TLS \e[0m : ${ntls}                                      \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Port gRPC     \e[0m : ${tls}                                       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Password      \e[0m : ${uuid}                                      \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Cipher        \e[0m : ${cipher}                                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Network       \e[0m : ws/grpc                                      \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• Path          \e[0m : /ss-ws                                       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[92m• ServiceName   \e[0m : ss-grpc                                      \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m🔗 Link TLS\e[0m                                                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  ${shadowsockslink}          \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m🔗 Link none TLS\e[0m                                                \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  ${shadowsockslink2}         \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m🔗 Link gRPC\e[0m                                                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  ${shadowsockslink1}         \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m⏰ Expired On    \e[0m : $exp                                         \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
echo "" | tee -a /etc/log-create-user.log

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mPress any key to return to menu...\e[0m                              \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
read -n 1 -s -r -p "  "

m-ssws