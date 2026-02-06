#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com)
clear

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                    \e[1;96mSERVICE RESTART MENU\e[0m                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;97mмαυт cσ∂єя Panel\e[0m                      \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Server IP: \e[1;93m$MYIP\e[0m                                    \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[36m│\e[0m                     \e[1;97mRESTART OPTIONS\e[0m                         \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[1]\e[0m  Restart All Services                                \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[2]\e[0m  Restart OpenSSH                                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[3]\e[0m  Restart Dropbear                                   \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[4]\e[0m  Restart Stunnel4                                   \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[5]\e[0m  Restart OpenVPN                                    \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[6]\e[0m  Restart Squid                                      \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[7]\e[0m  Restart Nginx                                      \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[8]\e[0m  Restart Badvpn                                     \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[9]\e[0m  Restart XRAY                                       \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[10]\e[0m Restart WEBSOCKET                                 \e[36m│\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[11]\e[0m Restart Trojan Go                                 \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  \e[93m[0]\e[0m  \e[31mBack to Main Menu\e[0m                               \e[36m│\e[0m"
echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
echo -e "\e[36m│\e[0m  Press 'x' or [Ctrl+C] to Exit                         \e[36m│\e[0m"
echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
echo ""

read -p "  ╰─➤ Select option: " Restart
echo ""
sleep 1
clear

case $Restart in
    1)
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                   \e[1;96mRESTARTING ALL SERVICES\e[0m                   \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[97m• Restarting OpenSSH...\e[0m                                   \e[36m│\e[0m"
        /etc/init.d/ssh restart
        echo -e "\e[36m│\e[0m  \e[97m• Restarting Dropbear...\e[0m                                  \e[36m│\e[0m"
        /etc/init.d/dropbear restart
        echo -e "\e[36m│\e[0m  \e[97m• Restarting Stunnel4...\e[0m                                  \e[36m│\e[0m"
        /etc/init.d/stunnel4 restart
        echo -e "\e[36m│\e[0m  \e[97m• Restarting OpenVPN...\e[0m                                   \e[36m│\e[0m"
        /etc/init.d/openvpn restart
        echo -e "\e[36m│\e[0m  \e[97m• Restarting Fail2Ban...\e[0m                                  \e[36m│\e[0m"
        /etc/init.d/fail2ban restart
        echo -e "\e[36m│\e[0m  \e[97m• Restarting Cron Jobs...\e[0m                                 \e[36m│\e[0m"
        /etc/init.d/cron restart
        echo -e "\e[36m│\e[0m  \e[97m• Restarting Nginx...\e[0m                                     \e[36m│\e[0m"
        /etc/init.d/nginx restart
        echo -e "\e[36m│\e[0m  \e[97m• Restarting Squid...\e[0m                                     \e[36m│\e[0m"
        /etc/init.d/squid restart
        echo -e "\e[36m│\e[0m  \e[97m• Restarting XRAY...\e[0m                                      \e[36m│\e[0m"
        systemctl restart xray
        systemctl restart xray.service
        echo -e "\e[36m│\e[0m  \e[97m• Restarting Badvpn...\e[0m                                    \e[36m│\e[0m"
        screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
        screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
        screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
        echo -e "\e[36m│\e[0m  \e[97m• Restarting Websocket...\e[0m                                 \e[36m│\e[0m"
        systemctl restart sshws.service
        systemctl restart ws-dropbear.service
        systemctl restart ws-stunnel.service
        echo -e "\e[36m│\e[0m  \e[97m• Restarting Trojan Go...\e[0m                                 \e[36m│\e[0m"
        systemctl restart trojan-go.service
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[1;92m✓ ALL SERVICES RESTARTED SUCCESSFULLY\e[0m                     \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        echo ""
        read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
        restart
        ;;
    2)
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;96mRESTARTING OPENSSH\e[0m                       \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        /etc/init.d/ssh restart
        echo -e "\e[36m│\e[0m  \e[1;92m✓ OPENSSH SERVICE RESTARTED\e[0m                              \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        echo ""
        read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
        restart
        ;;
    3)
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;96mRESTARTING DROPBEAR\e[0m                      \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        /etc/init.d/dropbear restart
        echo -e "\e[36m│\e[0m  \e[1;92m✓ DROPBEAR SERVICE RESTARTED\e[0m                             \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        echo ""
        read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
        restart
        ;;
    4)
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                   \e[1;96mRESTARTING STUNNEL4\e[0m                      \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        /etc/init.d/stunnel4 restart
        echo -e "\e[36m│\e[0m  \e[1;92m✓ STUNNEL4 SERVICE RESTARTED\e[0m                             \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        echo ""
        read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
        restart
        ;;
    5)
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                   \e[1;96mRESTARTING OPENVPN\e[0m                        \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        /etc/init.d/openvpn restart
        echo -e "\e[36m│\e[0m  \e[1;92m✓ OPENVPN SERVICE RESTARTED\e[0m                              \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        echo ""
        read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
        restart
        ;;
    6)
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;96mRESTARTING SQUID\e[0m                         \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        /etc/init.d/squid restart
        echo -e "\e[36m│\e[0m  \e[1;92m✓ SQUID SERVICE RESTARTED\e[0m                               \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        echo ""
        read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
        restart
        ;;
    7)
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;96mRESTARTING NGINX\e[0m                         \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        /etc/init.d/nginx restart
        echo -e "\e[36m│\e[0m  \e[1;92m✓ NGINX SERVICE RESTARTED\e[0m                               \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        echo ""
        read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
        restart
        ;;
    8)
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                   \e[1;96mRESTARTING BADVPN\e[0m                         \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
        echo -e "\e[36m│\e[0m  \e[1;92m✓ BADVPN SERVICE RESTARTED\e[0m                              \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        echo ""
        read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
        restart
        ;;
    9)
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;96mRESTARTING XRAY\e[0m                          \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        systemctl restart xray
        systemctl restart xray.service
        echo -e "\e[36m│\e[0m  \e[1;92m✓ XRAY SERVICE RESTARTED\e[0m                                \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        echo ""
        read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
        restart
        ;;
    10)
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                  \e[1;96mRESTARTING WEBSOCKET\e[0m                       \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        systemctl restart sshws.service
        systemctl restart ws-dropbear.service
        systemctl restart ws-stunnel.service
        echo -e "\e[36m│\e[0m  \e[1;92m✓ WEBSOCKET SERVICE RESTARTED\e[0m                           \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        echo ""
        read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
        restart
        ;;
    11)
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                 \e[1;96mRESTARTING TROJAN GO\e[0m                        \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        systemctl restart trojan-go.service
        echo -e "\e[36m│\e[0m  \e[1;92m✓ TROJAN GO SERVICE RESTARTED\e[0m                           \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        echo ""
        read -n 1 -s -r -p "  ╰─➤ Press any key to continue... "
        restart
        ;;
    0)
        m-system
        exit
        ;;
    x)
        clear
        exit
        ;;
    *)
        echo -e "\e[36m┌─────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m                    \e[1;91mINVALID OPTION\e[0m                          \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[97mPlease select a valid option (0-11)\e[0m                       \e[36m│\e[0m"
        echo -e "\e[36m├─────────────────────────────────────────────────────────────┤\e[0m"
        echo -e "\e[36m│\e[0m  \e[94mOwner: мαυт cσ∂єя | Telegram: @maut_coder_bot\e[0m         \e[36m│\e[0m"
        echo -e "\e[36m└─────────────────────────────────────────────────────────────┘\e[0m"
        sleep 2
        restart
        ;;
esac