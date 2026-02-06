#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com)
clear

echo -e "\e[36m┌─────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                  \e[1;96mUSER ACCOUNT RENEWAL\e[0m                  \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;97mмαυт cσ∂єя Panel\e[0m                    \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  IP Address: \e[1;93m$MYIP\e[0m                                \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────┘\e[0m"
echo ""

read -p "  ╰─➤ Username : " User
egrep "^$User" /etc/passwd >/dev/null

if [ $? -eq 0 ]; then
    read -p "  ╰─➤ Day Extend : " Days
    Today=`date +%s`
    Days_Detailed=$(( $Days * 86400 ))
    Expire_On=$(($Today + $Days_Detailed))
    Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
    Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
    
    passwd -u $User
    usermod -e $Expiration $User
    egrep "^$User" /etc/passwd >/dev/null
    echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
    
    clear
    echo -e "\e[36m┌─────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                  \e[1;92mRENEWAL SUCCESSFUL\e[0m                   \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Username    : \e[1;93m$User\e[0m                           \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Days Added  : \e[1;93m$Days Days\e[0m                       \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Expires on  : \e[1;93m$Expiration_Display\e[0m              \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Status      : \e[1;92mACTIVATED ✓\e[0m                     \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m        \e[94mOwner: мαυт cσ∂єя (@maut_coder_bot)\e[0m         \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────┘\e[0m"
else
    clear
    echo -e "\e[36m┌─────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                  \e[1;91mRENEWAL FAILED\e[0m                      \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m        \e[91m⚠️ Username '\e[1;93m$User\e[0m\e[91m' Does Not Exist\e[0m        \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m                                                    \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m        \e[97mPlease check the username and try again.\e[0m       \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m        \e[94mOwner: мαυт cσ∂єя (@maut_coder_bot)\e[0m         \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────┘\e[0m"
fi

echo ""
read -n 1 -s -r -p "  Press any key to return to menu..."
m-sshovpn