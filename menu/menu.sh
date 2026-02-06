#!/bin/bash

# ┌─────────────────────────────────────────────────────────────────┐
# │                   мαυт cσ∂єя VPN Panel                          │
# ├─────────────────────────────────────────────────────────────────┤
# │  Telegram: @maut_coder_bot | Channel: https://t.me/maut_vpn     │
# └─────────────────────────────────────────────────────────────────┘

# Function to fetch RAM information
get_ram_info() {
    ram_info=$(free -m | awk 'NR==2{print $2,$3}')
    tram=$(echo "$ram_info" | awk '{print $1}')
    uram=$(echo "$ram_info" | awk '{print $2}')
}

# Function to fetch CPU usage information
get_cpu_usage() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    cpu_usage=$(echo "$cpu_usage" | awk '{printf "%.2f", $1}')
    cpu_usage+=" %"
}

# Function to display VPS information
show_vps_info() {
    clear
    domain=$(cat /etc/xray/domain)
    uptime=$(uptime -p | cut -d " " -f 2-10)
    DATE2=$(date -R | cut -d " " -f -5)
    IPVPS=$(curl -s ifconfig.me)
    LOC=$(curl -sS "https://api.country.is/${IPVPS}" | jq -r '.country')
    if [ -z "$LOC" ]; then
        LOC="Unknown"
    fi

    echo -e "\e[36m┌─────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                    \e[1;96mVPS INFORMATION\e[0m                           \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m                     \e[1;97mмαυт cσ∂єя Panel\e[0m                       \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Operating System : \e[1;93m$(hostnamectl | grep "Operating System" | cut -d ' ' -f5-)\e[0m \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Uptime           : \e[1;93m$uptime\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Public IP        : \e[1;93m$IPVPS\e[0m                          \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Country          : \e[1;93m$LOC\e[0m                            \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Domain           : \e[1;93m$domain\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Date & Time      : \e[1;93m$DATE2\e[0m                          \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────────┘\e[0m"
}

# Function to display CPU and RAM information
show_cpu_ram_info() {
    get_ram_info
    get_cpu_usage

    echo -e "\e[36m┌─────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                   \e[1;96mSYSTEM RESOURCES\e[0m                          \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• CPU Usage        : \e[1;93m$cpu_usage\e[0m                      \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• RAM Used         : \e[1;93m${uram} MB\e[0m                      \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• RAM Total        : \e[1;93m${tram} MB\e[0m                      \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────────┘\e[0m"
}

# Function to display menu and handle user input
show_menu() {
    clear
    show_vps_info
    show_cpu_ram_info

    echo -e "\e[36m┌─────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                      \e[1;96mMAIN MENU\e[0m                              \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[93m[1]\e[0m  SSH Management                                   \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[93m[2]\e[0m  Vmess Management                                 \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[93m[3]\e[0m  Trojan Management                                \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[93m[4]\e[0m  Shadowsocks Management                           \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[93m[5]\e[0m  System Settings                                  \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[93m[6]\e[0m  Service Status                                   \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[93m[7]\e[0m  Clear RAM Cache                                  \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[93m[8]\e[0m  Reboot VPS                                       \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[93m[x]\e[0m  Exit Script                                      \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Client Name : \e[1;93ммαυт cσ∂єя VPN\e[0m                        \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Owner       : \e[94mмαυт cσ∂єя\e[0m                              \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97m• Telegram    : \e[94m@maut_coder_bot\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m├─────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[94mChannel: https://t.me/maut_vpn\e[0m                           \e[36m│\e[0m"
    echo -e "\e[36m└─────────────────────────────────────────────────────────────────┘\e[0m"
    echo ""
    read -p "  ╰─➤ Select menu:  " opt
    echo ""
    
    case $opt in
        1) clear ; m-sshovpn ;;
        2) clear ; m-vmess ;;
        3) clear ; m-trojan ;;
        4) clear ; m-ssws ;;
        5) clear ; m-system ;;
        6) clear ; running ;;
        7) clear ; clearcache ;;
        8) clear ; /sbin/reboot ;;
        x) 
            echo -e "\e[36m┌─────────────────────────────────────────────────────────────────┐\e[0m"
            echo -e "\e[36m│\e[0m                    \e[1;92mTHANK YOU!\e[0m                             \e[36m│\e[0m"
            echo -e "\e[36m│\e[0m  \e[97m• Exiting мαυт cσ∂єя VPN Panel\e[0m                       \e[36m│\e[0m"
            echo -e "\e[36m│\e[0m  \e[97m• Goodbye!\e[0m                                          \e[36m│\e[0m"
            echo -e "\e[36m└─────────────────────────────────────────────────────────────────┘\e[0m"
            exit ;;
        *) 
            echo -e "\e[36m┌─────────────────────────────────────────────────────────────────┐\e[0m"
            echo -e "\e[36m│\e[0m                    \e[1;91mINVALID OPTION\e[0m                         \e[36m│\e[0m"
            echo -e "\e[36m│\e[0m  \e[97m• Please select a valid option (1-8 or x)\e[0m             \e[36m│\e[0m"
            echo -e "\e[36m│\e[0m  \e[97m• Returning to main menu...\e[0m                          \e[36m│\e[0m"
            echo -e "\e[36m└─────────────────────────────────────────────────────────────────┘\e[0m"
            sleep 2 ;;
    esac
}

# Initial setup
domain=$(cat /etc/xray/domain)
Name="мαυт cσ∂єя VPN"
Owner="мαυт cσ∂єя"
Telegram="@maut_coder_bot"
Channel="https://t.me/maut_vpn"

# Main loop to display menu continuously
while true; do
    show_menu
done