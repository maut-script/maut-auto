#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com)
clear

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;96mACTIVE CONNECTIONS\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя Panel\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Server IP: \e[1;93m$MYIP\e[0m                                    \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

# Determine log file
if [ -e "/var/log/auth.log" ]; then
    LOG="/var/log/auth.log"
fi
if [ -e "/var/log/secure" ]; then
    LOG="/var/log/secure"
fi

data=( `ps aux | grep -i dropbear | awk '{print $2}'`)

# ┌─────────────────────────────────────────────────────────────┐
# │                   DROPBEAR CONNECTIONS                      │
# └─────────────────────────────────────────────────────────────┘
echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                 \e[1;97mDROPBEAR CONNECTIONS\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97mPID     USERNAME          IP ADDRESS\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"

cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt
for PID in "${data[@]}"
do
    cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt
    NUM=`cat /tmp/login-db-pid.txt | wc -l`
    USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`
    IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`
    if [ $NUM -eq 1 ]; then
        printf "\e[36m│\e[0m  \e[93m%-6s\e[0m  \e[1;97m%-15s\e[0m  \e[94m%-15s\e[0m        \e[36m│\e[0m\n" "$PID" "$USER" "$IP"
    fi
done

echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

# ┌─────────────────────────────────────────────────────────────┐
# │                   OPENSSH CONNECTIONS                       │
# └─────────────────────────────────────────────────────────────┘
echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                 \e[1;97mOPENSSH CONNECTIONS\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97mPID     USERNAME          IP ADDRESS\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"

cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/login-db.txt
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`)

for PID in "${data[@]}"
do
    cat /tmp/login-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt
    NUM=`cat /tmp/login-db-pid.txt | wc -l`
    USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'`
    IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'`
    if [ $NUM -eq 1 ]; then
        printf "\e[36m│\e[0m  \e[93m%-6s\e[0m  \e[1;97m%-15s\e[0m  \e[94m%-15s\e[0m        \e[36m│\e[0m\n" "$PID" "$USER" "$IP"
    fi
done

echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

# ┌─────────────────────────────────────────────────────────────┐
# │                   OPENVPN TCP CONNECTIONS                   │
# └─────────────────────────────────────────────────────────────┘
if [ -f "/etc/openvpn/server/openvpn-tcp.log" ]; then
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m               \e[1;97mOPENVPN TCP CONNECTIONS\e[0m                    \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mUSERNAME          IP ADDRESS      CONNECTED SINCE\e[0m        \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    
    cat /etc/openvpn/server/openvpn-tcp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-tcp.txt
    while IFS= read -r line; do
        user=$(echo "$line" | awk '{print $1}')
        ip=$(echo "$line" | awk '{print $2}')
        time=$(echo "$line" | awk '{print $3}')
        printf "\e[36m│\e[0m  \e[1;97m%-15s\e[0m  \e[94m%-15s\e[0m  \e[93m%-15s\e[0m  \e[36m│\e[0m\n" "$user" "$ip" "$time"
    done < /tmp/vpn-login-tcp.txt
    
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    echo ""
fi

# ┌─────────────────────────────────────────────────────────────┐
# │                   OPENVPN UDP CONNECTIONS                   │
# └─────────────────────────────────────────────────────────────┘
if [ -f "/etc/openvpn/server/openvpn-udp.log" ]; then
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m               \e[1;97mOPENVPN UDP CONNECTIONS\e[0m                    \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mUSERNAME          IP ADDRESS      CONNECTED SINCE\e[0m        \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    
    cat /etc/openvpn/server/openvpn-udp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-udp.txt
    while IFS= read -r line; do
        user=$(echo "$line" | awk '{print $1}')
        ip=$(echo "$line" | awk '{print $2}')
        time=$(echo "$line" | awk '{print $3}')
        printf "\e[36m│\e[0m  \e[1;97m%-15s\e[0m  \e[94m%-15s\e[0m  \e[93m%-15s\e[0m  \e[36m│\e[0m\n" "$user" "$ip" "$time"
    done < /tmp/vpn-login-udp.txt
    
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
fi

# Cleanup
rm -f /tmp/login-db-pid.txt
rm -f /tmp/login-db.txt
rm -f /tmp/vpn-login-tcp.txt
rm -f /tmp/vpn-login-udp.txt

echo ""
echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""
read -n 1 -s -r -p "  ╰─➤ Press any key to return to menu... "

m-sshovpn