#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;96mChecking VPS Status\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                 \e[1;96mCREATE SSH ACCOUNT\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m│\e[0m               \e[97mmαυт cσ∂єя VPN Panel\e[0m                          \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97mPlease enter account details:\e[0m                            \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"

read -p "  ╰─➤ Username: " Login
read -p "  ╰─➤ Password: " Pass
read -p "  ╰─➤ Expired (days): " masaaktif

IP=$(curl -sS ifconfig.me);
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`

sleep 1
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

if [[ ! -z "${PID}" ]]; then
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m                  \e[1;92mSSH ACCOUNT CREATED\e[0m                        \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[97mUsername:\e[0m   \e[96m$Login\e[0m                              \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[97mPassword:\e[0m   \e[96m$Pass\e[0m                               \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[97mExpired On:\e[0m \e[96m$exp\e[0m                                \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[97mServer Information:\e[0m                                    \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90m● IP Address:\e[0m \e[96m$IP\e[0m                               \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90m● Domain:\e[0m \e[96m$domen\e[0m                                \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90m● OpenSSH:\e[0m \e[96m$opensh\e[0m                              \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90m● SSH WS:\e[0m \e[96m$portsshws\e[0m                            \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90m● SSH SSL WS:\e[0m \e[96m$wsssl\e[0m                            \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90m● SSL/TLS:\e[0m \e[96m$ssl\e[0m                                 \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90m● UDPGW:\e[0m \e[96m7100-7900\e[0m                              \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[1;97mPayload WSS:\e[0m                                        \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90mGET wss://isi_bug_disini HTTP/1.1[crlf]\e[0m              \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90mHost: ${domen}[crlf]Upgrade: websocket[crlf][crlf]\e[0m    \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[1;97mPayload WS:\e[0m                                         \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90mGET / HTTP/1.1[crlf]Host: $domen[crlf]\e[0m                \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90mUpgrade: websocket[crlf][crlf]\e[0m                        \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m" | tee -a /etc/log-create-ssh.log

else
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m                  \e[1;92mSSH ACCOUNT CREATED\e[0m                        \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[97mUsername:\e[0m   \e[96m$Login\e[0m                              \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[97mPassword:\e[0m   \e[96m$Pass\e[0m                               \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[97mExpired On:\e[0m \e[96m$exp\e[0m                                \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[97mServer Information:\e[0m                                    \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90m● IP Address:\e[0m \e[96m$IP\e[0m                               \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90m● Domain:\e[0m \e[96m$domen\e[0m                                \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90m● OpenSSH:\e[0m \e[96m$opensh\e[0m                              \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90m● SSH WS:\e[0m \e[96m$portsshws\e[0m                            \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90m● SSH SSL WS:\e[0m \e[96m$wsssl\e[0m                            \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90m● SSL/TLS:\e[0m \e[96m$ssl\e[0m                                 \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90m● UDPGW:\e[0m \e[96m7100-7900\e[0m                              \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[97mExpired On:\e[0m \e[96m$exp\e[0m                                \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[1;97mPayload WSS:\e[0m                                        \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90mGET wss://isi_bug_disini HTTP/1.1[crlf]\e[0m              \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90mHost: ${domen}[crlf]Upgrade: websocket[crlf][crlf]\e[0m    \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[1;97mPayload WS:\e[0m                                         \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90mGET / HTTP/1.1[crlf]Host: $domen[crlf]\e[0m                \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m│\e[0m  \e[90mUpgrade: websocket[crlf][crlf]\e[0m                        \e[36m│\e[0m" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m" | tee -a /etc/log-create-ssh.log
fi

echo "" | tee -a /etc/log-create-ssh.log
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mOwner: \e[94mмαυт cσ∂єя (@maut_coder_bot)\e[0m              \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

read -n 1 -s -r -p "  Press any key to back on menu"
m-sshovpn