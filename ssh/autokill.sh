#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com)
clear

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ACTIVE]${Font_color_suffix}"
Error="${Red_font_prefix}[INACTIVE]${Font_color_suffix}"
cek=$(grep -c -E "^# Autokill" /etc/cron.d/tendang)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;96mAUTOKILL MANAGER\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя Panel\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Server IP: \e[1;93m$MYIP\e[0m                                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  Autokill Status: $sts                                     \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;97mCONFIGURATION MENU\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[1]\e[0m  AutoKill After \e[1;92m5 Minutes\e[0m                              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[2]\e[0m  AutoKill After \e[1;92m10 Minutes\e[0m                             \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[3]\e[0m  AutoKill After \e[1;92m15 Minutes\e[0m                             \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[4]\e[0m  Turn Off AutoKill System                           \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97mPress 'Ctrl+C' to exit configuration\e[0m                   \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

read -p "  ╰─➤ Select option [1-4] : " AutoKill
if [ -z $AutoKill ]; then
    autokill
fi
read -p "  ╰─➤ Maximum allowed multilogin connections: " max
echo ""

case $AutoKill in
    1)
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;92mCONFIGURATION APPLIED\e[0m                     \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo > /etc/cron.d/tendang
        echo "# Autokill" >/etc/cron.d/tendang
        echo "*/5 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
        
        echo -e "\e[36m│\e[0m  \e[97m• Maximum Connections : \e[1;93m$max\e[0m                           \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• AutoKill Interval   : \e[1;92mEvery 5 Minutes\e[0m                \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• Status              : \e[1;92mACTIVATED ✓\e[0m                          \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        
        service cron restart >/dev/null 2>&1
        service cron reload >/dev/null 2>&1
        ;;
    2)
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;92mCONFIGURATION APPLIED\e[0m                     \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo > /etc/cron.d/tendang
        echo "# Autokill" >/etc/cron.d/tendang
        echo "*/10 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
        
        echo -e "\e[36m│\e[0m  \e[97m• Maximum Connections : \e[1;93m$max\e[0m                           \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• AutoKill Interval   : \e[1;92mEvery 10 Minutes\e[0m               \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• Status              : \e[1;92mACTIVATED ✓\e[0m                          \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        
        service cron restart >/dev/null 2>&1
        service cron reload >/dev/null 2>&1
        ;;
    3)
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;92mCONFIGURATION APPLIED\e[0m                     \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo > /etc/cron.d/tendang
        echo "# Autokill" >/etc/cron.d/tendang
        echo "*/15 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
        
        echo -e "\e[36m│\e[0m  \e[97m• Maximum Connections : \e[1;93m$max\e[0m                           \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• AutoKill Interval   : \e[1;92mEvery 15 Minutes\e[0m               \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• Status              : \e[1;92mACTIVATED ✓\e[0m                          \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        
        service cron restart >/dev/null 2>&1
        service cron reload >/dev/null 2>&1
        ;;
    4)
        clear
        rm /etc/cron.d/tendang
        
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;92mCONFIGURATION APPLIED\e[0m                     \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• AutoKill System    : \e[1;91mDEACTIVATED ✗\e[0m                        \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• Status             : \e[1;93mMULTILOGIN MONITORING DISABLED\e[0m    \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• Action             : \e[1;92mCron job removed successfully\e[0m     \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        
        service cron restart >/dev/null 2>&1
        service cron reload >/dev/null 2>&1
        ;;
    x)
        clear
        exit
        ;;
esac