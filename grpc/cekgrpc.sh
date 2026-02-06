#!/bin/bash
# Color Definitions
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

# Getting IP
MYIP=$(wget -qO- ipv4.icanhazip.com);

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;96mChecking VPS Status\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

clear
echo -n > /tmp/other.txt
data=( `cat /etc/xray/vmessgrpc.json | grep '^###' | cut -d ' ' -f 2`);

echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m               \e[1;96mXRAY GRPC VMESS USER LOGIN\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m               \e[97mmαυт cσ∂єя VPN Panel\e[0m                             \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"

for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="No active users"
fi
echo -n > /tmp/ipvmess.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvmess.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvmess.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvmess.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvmess.txt | nl)
echo -e "\e[36m│\e[0m  \e[97mUser:\e[0m \e[96m$akun\e[0m"
echo -e "\e[36m│\e[0m  \e[92m● Connected IP Addresses:\e[0m"
while read -r line; do
    echo -e "\e[36m│\e[0m     \e[96m$line\e[0m"
done <<< "$jum2"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
fi
rm -rf /tmp/ipvmess.txt
done

oth=$(cat /tmp/other.txt | sort | uniq | nl)
if [[ ! -z "$oth" ]]; then
echo -e "\e[36m│\e[0m  \e[97mOther Connected IPs:\e[0m"
while read -r line; do
    echo -e "\e[36m│\e[0m     \e[93m$line\e[0m"
done <<< "$oth"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
fi

dt=( `cat /etc/xray/vlessgrpc.json | grep '^###' | cut -d ' ' -f 2`);

echo -e "\e[36m│\e[0m               \e[1;96mXRAY GRPC VLESS USER LOGIN\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"

for akun in "${dt[@]}"
do
if [[ -z "$akun" ]]; then
acc="No active users"
fi
echo -n > /tmp/ipvmess.txt
dt2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${dt2[@]}"
do
jum1=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum1" = "$ip" ]]; then
echo "$jum1" >> /tmp/ipvmess.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum3=$(cat /tmp/ipvmess.txt)
sed -i "/$jum3/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvmess.txt)
if [[ -z "$jum1" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvmess.txt | nl)
echo -e "\e[36m│\e[0m  \e[97mUser:\e[0m \e[96m$akun\e[0m"
echo -e "\e[36m│\e[0m  \e[92m● Connected IP Addresses:\e[0m"
while read -r line; do
    echo -e "\e[36m│\e[0m     \e[96m$line\e[0m"
done <<< "$jum2"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
fi
rm -rf /tmp/ipvmess.txt
done

ot=$(cat /tmp/other.txt | sort | uniq | nl)
if [[ ! -z "$ot" ]]; then
echo -e "\e[36m│\e[0m  \e[97mOther Connected IPs:\e[0m"
while read -r line; do
    echo -e "\e[36m│\e[0m     \e[93m$line\e[0m"
done <<< "$ot"
fi

echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mOwner: \e[94mмαυт cσ∂єя (@maut_coder_bot)\e[0m              \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"

rm -rf /tmp/other.txt