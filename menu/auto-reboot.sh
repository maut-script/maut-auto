#!/bin/bash

# ┌─────────────────────────────────────────────────────────────────┐
# │                   мαυт cσ∂єя VPN Panel                          │
# ├─────────────────────────────────────────────────────────────────┤
# │  Telegram: @maut_coder_bot | Channel: https://t.me/maut_vpn     │
# └─────────────────────────────────────────────────────────────────┘

# Color Definitions
BRed='\e[1;31m'
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
BPurple='\e[1;35m'
NC='\e[0m'

MYIP=$(wget -qO- ipv4.icanhazip.com)
clear

# Create auto-reboot script if it doesn't exist
if [ ! -e /usr/local/bin/reboot_otomatis ]; then
    echo '#!/bin/bash' > /usr/local/bin/reboot_otomatis 
    echo 'date=$(date +"%m-%d-%Y")' >> /usr/local/bin/reboot_otomatis 
    echo 'time=$(date +"%T")' >> /usr/local/bin/reboot_otomatis 
    echo 'echo "Server successfully rebooted on the date of $date at $time." >> /root/log-reboot.txt' >> /usr/local/bin/reboot_otomatis 
    echo '/sbin/shutdown -r now' >> /usr/local/bin/reboot_otomatis 
    chmod +x /usr/local/bin/reboot_otomatis
fi

clear

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                   \e[1;96mAUTO-REBOOT SETTINGS\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;97mмαυт cσ∂єя Panel\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Server IP: \e[1;93m$MYIP\e[0m                                     \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;97mREBOOT SCHEDULE\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[1]\e[0m  Auto-Reboot Every 1 Hour                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[2]\e[0m  Auto-Reboot Every 6 Hours                         \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[3]\e[0m  Auto-Reboot Every 12 Hours                        \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[4]\e[0m  Auto-Reboot Every 1 Day                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[5]\e[0m  Auto-Reboot Every 1 Week                          \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[6]\e[0m  Auto-Reboot Every 1 Month                         \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[7]\e[0m  Disable Auto-Reboot                              \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[8]\e[0m  View Reboot Log                                   \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[9]\e[0m  Clear Reboot Log                                  \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[0]\e[0m  Back to System Menu                              \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Press 'x' or [Ctrl+C] to Exit                       \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

read -p "  ╰─➤ Select option: " x

if test $x -eq 1; then
    echo "10 * * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                  \e[1;92mAUTO-REBOOT CONFIGURED\e[0m                     \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Schedule: \e[1;93mEvery 1 Hour\e[0m                            \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Status: \e[1;92mACTIVATED ✓\e[0m                              \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    sleep 2
    auto-reboot
    
elif test $x -eq 2; then
    echo "10 */6 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                  \e[1;92mAUTO-REBOOT CONFIGURED\e[0m                     \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Schedule: \e[1;93mEvery 6 Hours\e[0m                           \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Status: \e[1;92mACTIVATED ✓\e[0m                              \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    sleep 2
    auto-reboot
    
elif test $x -eq 3; then
    echo "10 */12 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                  \e[1;92mAUTO-REBOOT CONFIGURED\e[0m                     \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Schedule: \e[1;93mEvery 12 Hours\e[0m                          \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Status: \e[1;92mACTIVATED ✓\e[0m                              \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    sleep 2
    auto-reboot
    
elif test $x -eq 4; then
    echo "10 0 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                  \e[1;92mAUTO-REBOOT CONFIGURED\e[0m                     \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Schedule: \e[1;93mEvery Day (Midnight)\e[0m                    \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Status: \e[1;92mACTIVATED ✓\e[0m                              \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    sleep 2
    auto-reboot
    
elif test $x -eq 5; then
    echo "10 0 */7 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                  \e[1;92mAUTO-REBOOT CONFIGURED\e[0m                     \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Schedule: \e[1;93mEvery Week\e[0m                              \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Status: \e[1;92mACTIVATED ✓\e[0m                              \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    sleep 2
    auto-reboot
    
elif test $x -eq 6; then
    echo "10 0 1 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                  \e[1;92mAUTO-REBOOT CONFIGURED\e[0m                     \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Schedule: \e[1;93mEvery Month (1st day)\e[0m                   \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Status: \e[1;92mACTIVATED ✓\e[0m                              \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    sleep 2
    auto-reboot
    
elif test $x -eq 7; then
    rm -f /etc/cron.d/reboot_otomatis
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                  \e[1;92mAUTO-REBOOT DISABLED\e[0m                       \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Schedule: \e[1;93mDISABLED\e[0m                               \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Status: \e[1;91mDEACTIVATED ✗\e[0m                            \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    sleep 2
    auto-reboot
    
elif test $x -eq 8; then
    if [ ! -e /root/log-reboot.txt ]; then
        clear
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;96mREBOOT LOG\e[0m                            \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• No reboot activity found\e[0m                            \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• Log file is empty\e[0m                                 \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        echo ""
        read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
        auto-reboot
    else
        clear
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;96mREBOOT HISTORY\e[0m                         \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        cat /root/log-reboot.txt
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        echo ""
        read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
        auto-reboot
    fi
    
elif test $x -eq 9; then
    clear
    echo "" > /root/log-reboot.txt
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                 \e[1;92mREBOOT LOG CLEARED\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Status: \e[1;92mREBOOT LOG SUCCESSFULLY CLEARED ✓\e[0m        \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• All reboot history has been removed\e[0m                    \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    echo ""
    read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
    auto-reboot
    
elif test $x -eq 0; then
    clear
    m-system
    
elif [[ "$x" == "x" ]] || [[ "$x" == "X" ]]; then
    exit
    
else
    clear
    echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                    \e[1;91mINVALID OPTION\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Please select a valid option (0-9 or x)\e[0m                \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Returning to Auto-Reboot menu...\e[0m                      \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
    echo ""
    read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
    auto-reboot
fi