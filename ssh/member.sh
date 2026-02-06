#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com)
clear

echo -e "\e[36m┌─────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;96mSSH USER MANAGEMENT\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;97mмαυт cσ∂єя Panel\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Server IP: \e[1;93m$MYIP\e[0m                                      \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────────┘\e[0m"
echo ""

echo -e "\e[36m┌─────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mACTIVE USER ACCOUNTS\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97mUSERNAME            EXPIRES          STATUS\e[0m                   \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────────┤\e[0m"

while read expired
do
    AKUN="$(echo $expired | cut -d: -f1)"
    ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
    exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
    status="$(passwd -S $AKUN | awk '{print $2}' )"
    
    if [[ $ID -ge 1000 ]]; then
        if [[ "$status" = "L" ]]; then
            printf "\e[36m│\e[0m  \e[1;97m%-18s\e[0m \e[93m%-15s\e[0m   \e[31m🔒 LOCKED\e[0m          \e[36m│\e[0m\n" "$AKUN" "$exp"
        else
            printf "\e[36m│\e[0m  \e[1;97m%-18s\e[0m \e[93m%-15s\e[0m   \e[32m🔓 UNLOCKED\e[0m        \e[36m│\e[0m\n" "$AKUN" "$exp"
        fi
    fi
done < /etc/passwd

JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

echo -e "\e[36m├─────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97mTotal Accounts: \e[1;93m$JUMLAH users\e[0m                                 \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m             \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────────┘\e[0m"
echo ""
read -n 1 -s -r -p "  ╰─➤ Press any key to return to menu... "

m-sshovpn