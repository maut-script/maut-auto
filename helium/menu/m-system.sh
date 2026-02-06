#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                        \e[1;96mChecking VPS Status\e[0m                       \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
clear
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;96m• VPS SYSTEM CONTROL PANEL •\e[0m                 \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                                                               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[96m•1•\e[0m \e[97mPanel Domain Management\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[96m•2•\e[0m \e[97mVPS Speedtest\e[0m                                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[96m•3•\e[0m \e[97mSet Auto Reboot Schedule\e[0m                          \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[96m•4•\e[0m \e[97mRestart All Services\e[0m                             \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[96m•5•\e[0m \e[97mCheck Bandwidth Usage\e[0m                            \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[96m•6•\e[0m \e[97mInstall TCP BBR Optimization\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[96m•7•\e[0m \e[97mDNS Changer\e[0m                                      \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[96m•8•\e[0m \e[97mADS Block Panel\e[0m                                  \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[96m•9•\e[0m \e[97mWebmin Panel\e[0m                                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                                                               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[91m•0•\e[0m \e[91mBack to Main Menu\e[0m                                \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                                                               \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93mPress [x] or [Ctrl+C] to Exit\e[0m                           \e[36m│\e[0m"
echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
echo -e ""
read -p "  ╰─➤ Select menu option: " opt
echo -e ""
case $opt in
1) clear ; m-domain ; exit ;;
2) clear ; speedtest ; exit ;;
3) clear ; auto-reboot ; exit ;;
4) clear ; restart ; exit ;;
5) clear ; bw ; exit ;;
6) clear ; m-tcp ; exit ;;
7) clear ; m-dns ; exit ;;
8) clear ; helium ; exit ;;
9) clear ; wbmn ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m" ; echo -e "\e[36m│\e[0m  \e[91m⚠️  Invalid option! Returning to System Menu...\e[0m  \e[36m│\e[0m" ; echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m" ; sleep 1 ; m-system ;;
esac