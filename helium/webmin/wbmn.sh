#!/bin/bash
# =========================================
# VPS Control Panel | Script Setup Manager
# Edition : Stable Edition 1.0
# Owner   : мαυт cσ∂єя (@maut_coder_bot)
# =========================================
clear
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[✓ Installed]${Font_color_suffix}"
Error="${Red_font_prefix}[✗ Not Installed]${Font_color_suffix}"
cek=$(netstat -ntlp | grep 10000 | awk '{print $7}' | cut -d'/' -f2)
function install () {
IP=$(wget -qO- ifconfig.co);
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mAdding Webmin Repository...\e[0m                                  \e[36m│\e[0m"
sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
apt install gnupg gnupg1 gnupg2 -y
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc
echo -e "\e[36m│\e[0m  \e[97mStarting Webmin Installation...\e[0m                              \e[36m│\e[0m"
clear
sleep 0.5
apt update > /dev/null 2>&1
apt install webmin -y
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
/etc/init.d/webmin restart
rm -f /root/jcameron-key.asc
clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;92mWebmin Installation Complete\e[0m                \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97mAccess URL:\e[0m \e[96m$IP:10000\e[0m                               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mUsername  :\e[0m \e[96mroot\e[0m                                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[97mPassword  :\e[0m \e[96mYour VPS Password\e[0m                        \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
}
function restart () {
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mRestarting Webmin Service...\e[0m                                \e[36m│\e[0m"
sleep 0.5
service webmin restart > /dev/null 2>&1
echo -e "\e[36m│\e[0m  \e[92m✓ Webmin Restart Complete\e[0m                                  \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
}
function uninstall () {
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[97mRemoving Webmin Repository...\e[0m                               \e[36m│\e[0m"
rm -f /etc/apt/sources.list.d/webmin.list
apt update > /dev/null 2>&1
echo -e "\e[36m│\e[0m  \e[97mStarting Webmin Uninstallation...\e[0m                          \e[36m│\e[0m"
clear
sleep 0.5
apt autoremove --purge webmin -y > /dev/null 2>&1
clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                  \e[1;92mWebmin Uninstallation Complete\e[0m               \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
}
if [[ "$cek" = "perl" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                      \e[1;96mWEBMIN CONTROL PANEL\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                       \e[97mmαυт cσ∂єя Edition\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[97mStatus:\e[0m $sts                                            \e[36m│\e[0m"
echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m                                                               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[96m[1]\e[0m \e[97mInstall Webmin\e[0m                                 \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[96m[2]\e[0m \e[97mRestart Webmin\e[0m                                 \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[96m[3]\e[0m \e[97mUninstall Webmin\e[0m                               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                                                               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[96m[0]\e[0m \e[97mBack to System Menu\e[0m                            \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                                                               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93mPress CTRL+C to return\e[0m                                \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
read -rp "  ╰─➤ Select option: " -e num
if [[ "$num" = "1" ]]; then
install
elif [[ "$num" = "2" ]]; then
restart
elif [[ "$num" = "3" ]]; then
uninstall
elif [[ "$num" = "0" ]]; then
m-system
else
clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m  \e[91m⚠️  Invalid option! Returning to Webmin Menu...\e[0m            \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
wbmn
fi