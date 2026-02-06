#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com)
clear

hariini=`date +%d-%m-%Y`

echo -e "\e[36m┌───────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;96mAUTO CLEANUP SYSTEM\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                      \e[1;97mмαυт cσ∂єя Panel\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Server IP : \e[1;93m$MYIP\e[0m                                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  Date       : \e[1;93m$hariini\e[0m                                      \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────┘\e[0m"
echo ""
echo -e "\e[36m┌───────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                \e[1;97mPROCESSING EXPIRED ACCOUNTS\e[0m                  \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────┤\e[0m"

cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
totalaccounts=`cat /tmp/expirelist.txt | wc -l`
removed_count=0

for((i=1; i<=$totalaccounts; i++ ))
do
    tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
    username=`echo $tuserval | cut -f1 -d:`
    userexp=`echo $tuserval | cut -f2 -d:`
    userexpireinseconds=$(( $userexp * 86400 ))
    tglexp=`date -d @$userexpireinseconds`             
    tgl=`echo $tglexp |awk -F" " '{print $3}'`
    
    while [ ${#tgl} -lt 2 ]
    do
        tgl="0"$tgl
    done
    
    while [ ${#username} -lt 15 ]
    do
        username=$username" " 
    done
    
    bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
    echo "echo \"User: $username | Expires: $tgl $bulantahun\"" >> /usr/local/bin/alluser
    todaystime=`date +%s`
    
    if [ $userexpireinseconds -ge $todaystime ] ; then
        # Account still valid
        :
    else
        # Account expired - remove
        echo "echo \"EXPIRED - $username | Removed: $hariini\"" >> /usr/local/bin/deleteduser
        echo -e "\e[36m│\e[0m  \e[31m✗ REMOVED:\e[0m \e[1;93m$username\e[0m \e[97mexpired on\e[0m \e[93m$tgl $bulantahun\e[0m  \e[36m│\e[0m"
        userdel $username
        removed_count=$((removed_count + 1))
    fi
done

echo -e "\e[36m├───────────────────────────────────────────────────────────────┤\e[0m"

if [ $removed_count -eq 0 ]; then
    echo -e "\e[36m│\e[0m  \e[1;92m✓ CLEANUP COMPLETE:\e[0m No expired accounts found         \e[36m│\e[0m"
else
    echo -e "\e[36m│\e[0m  \e[1;92m✓ CLEANUP COMPLETE:\e[0m Removed \e[1;93m$removed_count\e[0m expired account(s)  \e[36m│\e[0m"
fi

echo -e "\e[36m├───────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m           \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────┘\e[0m"
echo ""
read -n 1 -s -r -p "  ╰─➤ Press any key to return to menu... "

m-sshovpn