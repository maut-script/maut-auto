#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com)
clear

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[✓ INSTALLED]${Font_color_suffix}"
Error="${Red_font_prefix}[✗ NOT INSTALLED]${Font_color_suffix}"
cek=$(netstat -ntlp | grep 10000 | awk '{print $7}' | cut -d'/' -f2)

function install () {
    IP=$(wget -qO- ifconfig.me/ip)
    clear
    
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                    \e[1;96mINSTALLING WEBMIN\e[0m                        \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m                     \e[1;97mмαυт cσ∂єя Panel\e[0m                      \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Adding Webmin Repository...\e[0m                              \e[36m│\e[0m"
    
    sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
    apt install gnupg gnupg1 gnupg2 -y > /dev/null 2>&1
    wget http://www.webmin.com/jcameron-key.asc > /dev/null 2>&1
    apt-key add jcameron-key.asc > /dev/null 2>&1
    
    echo -e "\e[36m│\e[0m  \e[97m• Installing Webmin Packages...\e[0m                            \e[36m│\e[0m"
    apt update > /dev/null 2>&1
    apt install webmin -y > /dev/null 2>&1
    
    echo -e "\e[36m│\e[0m  \e[97m• Configuring Webmin...\e[0m                                  \e[36m│\e[0m"
    sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
    
    echo -e "\e[36m│\e[0m  \e[97m• Starting Webmin Service...\e[0m                              \e[36m│\e[0m"
    /etc/init.d/webmin restart > /dev/null 2>&1
    rm -f /root/jcameron-key.asc > /dev/null 2>&1
    
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m                    \e[1;92mINSTALLATION COMPLETE\e[0m                     \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Access URL: \e[1;93mhttp://$IP:10000\e[0m                      \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Status: \e[1;92mWEBMIN INSTALLED SUCCESSFULLY ✓\e[0m           \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    echo ""
    read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
    m-webmin
}

function restart () {
    clear
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                   \e[1;96mRESTARTING WEBMIN\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Restarting Webmin Service...\e[0m                              \e[36m│\e[0m"
    service webmin restart > /dev/null 2>&1
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m                    \e[1;92mRESTART COMPLETE\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Status: \e[1;92mWEBMIN RESTARTED SUCCESSFULLY ✓\e[0m           \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    echo ""
    read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
    m-webmin
}

function uninstall () {
    clear
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                  \e[1;96mUNINSTALLING WEBMIN\e[0m                        \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Removing Webmin Repository...\e[0m                             \e[36m│\e[0m"
    rm -f /etc/apt/sources.list.d/webmin.list
    apt update > /dev/null 2>&1
    
    echo -e "\e[36m│\e[0m  \e[97m• Uninstalling Webmin Packages...\e[0m                           \e[36m│\e[0m"
    apt autoremove --purge webmin -y > /dev/null 2>&1
    
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m                  \e[1;92mUNINSTALL COMPLETE\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Status: \e[1;92mWEBMIN REMOVED SUCCESSFULLY ✓\e[0m             \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    echo ""
    read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
    m-webmin
}

if [[ "$cek" = "perl" ]]; then
    sts="${Info}"
else
    sts="${Error}"
fi

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;96mWEBMIN MANAGEMENT\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;97mмαυт cσ∂єя Panel\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Server IP: \e[1;93m$MYIP\e[0m                                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  Webmin Status: $sts                                \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[1]\e[0m  Install Webmin                                   \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[2]\e[0m  Restart Webmin                                   \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[3]\e[0m  Uninstall Webmin                                 \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[0]\e[0m  Back to Main Menu                                \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Press 'x' or [Ctrl+C] to Exit                      \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""
read -rp "  ╰─➤ Select option: " -e num

if [[ "$num" = "1" ]]; then
    install
elif [[ "$num" = "2" ]]; then
    restart
elif [[ "$num" = "3" ]]; then
    uninstall
elif [[ "$num" = "0" ]]; then
    menu
elif [[ "$num" = "x" ]]; then
    exit
else
    clear
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                    \e[1;91mINVALID OPTION\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Please select a valid option (0-3 or x)\e[0m                \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Returning to Webmin menu...\e[0m                           \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    sleep 2
    m-webmin
fi