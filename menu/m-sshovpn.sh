#!/bin/bash
MYIP=$(wget -qO  -ipv4.icanhazip.com)
clear

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;96mSSH MANAGEMENT\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                      \e[1;97mмαυт cσ∂єя Panel\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Server IP: \e[1;93m$MYIP\e[0m                                     \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;97mMANAGEMENT OPTIONS\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[1]\e[0m  Create SSH & WS Account                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[2]\e[0m  Trial SSH & WS Account                            \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[3]\e[0m  Renew SSH & WS Account                            \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[4]\e[0m  Delete SSH & WS Account                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[5]\e[0m  Check User Login SSH & WS                        \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[6]\e[0m  List All SSH & WS Members                        \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[7]\e[0m  Delete Expired SSH & WS Accounts                 \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[8]\e[0m  Configure Autokill SSH                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[9]\e[0m  Check Multi-Login Users                          \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[10]\e[0m View All Created Accounts                        \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[11]\e[0m Change SSH Banner                               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[12]\e[0m Lock User Account                               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[13]\e[0m Unlock User Account                             \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[0]\e[0m  \e[31mBack to Main Menu\e[0m                               \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Press 'x' or [Ctrl+C] to Exit                         \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

read -p "  ╰─➤ Select option:  "  opt
echo ""

case $opt in
    1) clear ; usernew ; exit ;;
    2) clear ; trial ; exit ;;
    3) clear ; renew ; exit ;;
    4) clear ; hapus ; exit ;;
    5) clear ; cek ; exit ;;
    6) clear ; member ; exit ;;
    7) clear ; delete ; exit ;;
    8) clear ; autokill ; exit ;;
    9) clear ; ceklim ; exit ;;
    10) clear ; cat /etc/log-create-ssh.log ; exit ;;
    11) clear ; nano /etc/issue.net ; exit ;;
    12) clear ; user-lock ; exit ;;
    13) clear ; user-unlock ; exit ;;
    0) clear ; menu ; exit ;;
    x) exit ;;
    *) 
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;91mINVALID OPTION\e[0m                         \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• Please select a valid option (0-13 or x)\e[0m               \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• Returning to SSH menu...\e[0m                             \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        sleep 1
        m-sshovpn
        ;;
esac