#!/bin/bash
#VPS Control Panel by мαυт cσ∂єя (@maut_coder_bot)

VERSIONNAME="мαυт ADS Blocker v"
VERSIONNUMBER="3.0"
GREEN="\e[1;32m"
RED="\e[1;31m"
WHITE="\e[1m"
NOCOLOR="\e[0m"

providers="/etc/dnsmasq/providers.txt"
dnsmasqHostFinalList="/etc/dnsmasq/adblock.hosts"
tempHostsList="/etc/dnsmasq/list.tmp"
publicIP=$(ip -4 addr | sed -ne 's|^.* inet \([^/]*\)/.* scope global.*$|\1|p' | awk '{print $1}' | head -1)

function header() {
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                   \e[1;96m$VERSIONNAME$VERSIONNUMBER\e[0m                   \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m                  \e[97mby мαυт cσ∂єя (@maut_coder_bot)\e[0m               \e[36m│\e[0m"
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
}

function isRoot() {
    if [ ${EUID} != 0 ]; then
        echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m  \e[1;31m⚠️  You need to run this script as root\e[0m                        \e[36m│\e[0m"
        echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
        exit 1
    fi
}

function checkVirt() {
    if [ "$(systemd-detect-virt)" == "openvz" ]; then
        echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m  \e[1;31m⚠️  OpenVZ is not supported\e[0m                                   \e[36m│\e[0m"
        echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
        exit 1
    fi
    if [ "$(systemd-detect-virt)" == "lxc" ]; then
        echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m  \e[1;31m⚠️  LXC is not supported (yet)\e[0m                              \e[36m│\e[0m"
        echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
        exit 1
    fi
}

function checkOS() {
    if [[ $(grep -w "ID" /etc/os-release | awk -F'=' '{print $2}') -ne "debian" ]] || [[ $(grep -w "ID" /etc/os-release | awk -F'=' '{print $2}') -ne "ubuntu" ]]; then
        clear
        header
        echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m  \e[1;31m⚠️  Your OS is not supported. Please use Debian/Ubuntu\e[0m       \e[36m│\e[0m"
        echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
        exit 1
    fi
}

function initialCheck() {
    isRoot
    checkVirt
    checkOS
}

function install() {
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mInstalling мαυт ADS Blocker...\e[0m                              \e[36m│\e[0m"
    [[ ! -e /etc/dnsmasq ]] && mkdir -p /etc/dnsmasq
    [[ ! -e /etc/resolv.conf.bak ]] && cp /etc/resolv.conf /etc/resolv.conf.bak
    if [[ $(lsof -i :53 | grep -w -c "systemd-r") -ge 1 ]]; then
        systemctl disable systemd-resolved
        systemctl stop systemd-resolved
        unlink /etc/resolv.conf
        echo "nameserver 1.1.1.1" >/etc/resolv.conf
    fi
    apt update && apt install -y dnsmasq dnsutils vnstat resolvconf bc
    systemctl enable dnsmasq
    mv /etc/dnsmasq.conf /etc/dnsmasq.conf.bak
    rm -rf /etc/dnsmasq.conf
    wget -q -O /etc/dnsmasq.conf "https://raw.githubusercontent.com/abidarwish/helium/main/dnsmasq.conf"
    sed -i "s/YourPublicIP/${publicIP}/" /etc/dnsmasq.conf
    rm -rf ${providers}
    wget -q -O ${providers} "https://raw.githubusercontent.com/abidarwish/helium/main/providers.txt"
    rm -rf /usr/local/sbin/helium_daily
    wget -q -O /usr/local/sbin/helium_daily "https://raw.githubusercontent.com/abidarwish/helium/main/helium_daily.sh"
    chmod 755 /usr/local/sbin/helium_daily
    sed -i '/helium_daily/d' /etc/crontab
    echo -e "0 4 * * * root helium_daily # мαυт ADS Blocker" >>/etc/crontab
    updateEngine
    echo "nameserver 127.0.0.1" >/etc/resolv.conf
    >/etc/resolvconf/resolv.conf.d/head
    sleep 1
    clear
    header
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                 \e[1;92m✓ Installation Completed\e[0m                     \e[36m│\e[0m"
    echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mType:\e[0m \e[1;32mhelium\e[0m to start the ADS Blocker               \e[36m│\e[0m"
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
    exit 0
}

function start() {
    clear
    header
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                    \e[97mStarting ADS Blocker\e[0m                        \e[36m│\e[0m"
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
    if [[ $(systemctl is-active dnsmasq) == "active" ]]; then
        echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m  \e[92m✓ ADS Blocker is already running\e[0m                           \e[36m│\e[0m"
        echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
        read -p $'  ╰─➤ Press Enter to continue...'
        mainMenu
    fi
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mStarting мαυт ADS Blocker service...\e[0m                      \e[36m│\e[0m"
    systemctl enable dnsmasq >/dev/null 2>&1
    systemctl restart dnsmasq
    echo "nameserver 127.0.0.1" >/etc/resolv.conf
    sleep 2
    echo -e "\e[36m│\e[0m  \e[92m✓ Service started successfully\e[0m                            \e[36m│\e[0m"
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
    read -p $'  ╰─➤ Press Enter to continue...'
    mainMenu
}

function stop() {
    clear
    header
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                    \e[97mStopping ADS Blocker\e[0m                        \e[36m│\e[0m"
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
    if [[ $(systemctl is-active dnsmasq) == "active" ]]; then
        read -p $'  ╰─➤ Do you want to stop ADS Blocker? [y/n]: ' STOP
        if [[ ${STOP,,} == "y" ]]; then
            systemctl disable dnsmasq >/dev/null 2>&1
            systemctl stop dnsmasq
            echo "nameserver 1.1.1.1" >/etc/resolv.conf
            echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
            echo -e "\e[36m│\e[0m  \e[92m✓ ADS Blocker stopped successfully\e[0m                       \e[36m│\e[0m"
            echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
            read -p $'  ╰─➤ Press Enter to continue...'
            mainMenu
        else
            mainMenu
        fi
    else
        echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
        echo -e "\e[36m│\e[0m  \e[91m✗ ADS Blocker is not running\e[0m                              \e[36m│\e[0m"
        echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
        read -p $'  ╰─➤ Press Enter to continue...'
        mainMenu
    fi
}

function heliumStatus() {
    HELIUM_NAMESERVER=$(grep -E "^server" /etc/dnsmasq.conf | head -1 | awk -F= '{print $2}')
    BLOCKED_HOSTNAME=$(cat ${dnsmasqHostFinalList} | wc -l)
    NAMESERVER=$(grep -E "^nameserver" /etc/resolv.conf | head -1 | awk '{print $2}')
    ACTIVE_SINCE=$(systemctl status dnsmasq.service | sed -ne 's|^.*active (running).*; \(.*\)$|\1|p')
    
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                    \e[1;97mADS Blocker Status\e[0m                         \e[36m│\e[0m"
    echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
    
    if [[ $(systemctl is-active dnsmasq) == active ]]; then
        echo -e "\e[36m│\e[0m  \e[97mDNSMasq:\e[0m          \e[1;32m● RUNNING\e[0m                         \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97mNameserver:\e[0m       \e[96m$HELIUM_NAMESERVER\e[0m                  \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97mBlocked Hostnames:\e[0m \e[92m$BLOCKED_HOSTNAME\e[0m                     \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97mActive Since:\e[0m     \e[96m$ACTIVE_SINCE\e[0m                    \e[36m│\e[0m"
    else
        echo -e "\e[36m│\e[0m  \e[97mDNSMasq:\e[0m          \e[1;31m● STOPPED\e[0m                         \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97mNameserver:\e[0m       \e[96m$NAMESERVER\e[0m                      \e[36m│\e[0m"
        echo -e "\e[36m│\e[0m  \e[97mBlocked Hostnames:\e[0m \e[91m0\e[0m                                   \e[36m│\e[0m"
    fi
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
}

function mainMenu() {
    clear
    header
    heliumStatus
    
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                    \e[1;97mVPS System Information\e[0m                     \e[36m│\e[0m"
    echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
    
    CPU=$(cat /proc/cpuinfo | grep "model\|Model" | tail -n 1 | awk -F: '{print $2}' | cut -d " " -f2-4)
    CPU_CORE=$(lscpu | grep "CPU(s)" | head -n 1 | awk '{print $2}')
    CPU_MHZ=$(lscpu | grep "MHz" | head -n 1 | sed 's/ //g' | awk -F: '{print $2}' | cut -d. -f1)
    OS=$(cat /etc/os-release | grep "PRETTY_NAME" | awk -F\" '{print $2}')
    KERNEL=$(uname -r)
    RAM_USED=$(free -m | grep Mem: | awk '{print $3}')
    TOTAL_RAM=$(free -m | grep Mem: | awk '{print $2}')
    RAM_USAGE=$(echo "scale=2; ($RAM_USED / $TOTAL_RAM) * 100" | bc | cut -d. -f1)
    UPTIME=$(uptime -p | sed 's/,//g' | awk '{print $2,$3", "$4,$5}')
    DAILY_USAGE=$(vnstat -d --oneline | awk -F\; '{print $6}' | sed 's/ //')
    MONTHLY_USAGE=$(vnstat -m --oneline | awk -F\; '{print $11}' | sed 's/ //')
    
    if [[ ${CPU_CORE} == 1 ]]; then
        echo -e "\e[36m│\e[0m  \e[97mCPU (single core):\e[0m \e[96m${CPU} @ ${CPU_MHZ}Mhz\e[0m         \e[36m│\e[0m"
    else
        echo -e "\e[36m│\e[0m  \e[97mCPU (${CPU_CORE} cores):\e[0m \e[96m${CPU} @ ${CPU_MHZ}Mhz\e[0m   \e[36m│\e[0m"
    fi
    echo -e "\e[36m│\e[0m  \e[97mOS Version:\e[0m        \e[96m${OS}\e[0m                  \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mKernel Version:\e[0m    \e[96m${KERNEL}\e[0m                  \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mRAM Usage:\e[0m         \e[96m${RAM_USED}MB / ${TOTAL_RAM}MB (${RAM_USAGE}%)\e[0m \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mUptime:\e[0m            \e[96m${UPTIME}\e[0m                \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mIP Address:\e[0m        \e[96m${publicIP}\e[0m                     \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mDaily Data Usage:\e[0m  \e[96m${DAILY_USAGE}\e[0m                     \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[97mMonthly Data Usage:\e[0m \e[96m${MONTHLY_USAGE}\e[0m                    \e[36m│\e[0m"
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
    
    echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
    echo -e "\e[36m│\e[0m                  \e[1;97mADS Blocker Control Panel\e[0m                    \e[36m│\e[0m"
    echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[96m[1]\e[0m \e[97mStart ADS Blocker\e[0m       \e[96m[6]\e[0m \e[97mWhitelist Host\e[0m          \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[96m[2]\e[0m \e[97mStop ADS Blocker\e[0m        \e[96m[7]\e[0m \e[97mChange DNS\e[0m              \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[96m[3]\e[0m \e[97mUpdate Database\e[0m         \e[96m[8]\e[0m \e[97mUpdate ADS Blocker\e[0m      \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[96m[4]\e[0m \e[97mActivate Provider\e[0m       \e[96m[9]\e[0m \e[97mClean Database\e[0m          \e[36m│\e[0m"
    echo -e "\e[36m│\e[0m  \e[96m[5]\e[0m \e[97mDeactivate Provider\e[0m     \e[96m[10]\e[0m \e[97mReinstall\e[0m              \e[36m│\e[0m"
    echo -e "\e[36m├───────────────────────────────────────────────────────────────────┤\e[0m"
    echo -e "\e[36m│\e[0m  \e[96m[0]\e[0m \e[97mUninstall\e[0m              \e[96m[x]\e[0m \e[97mExit\e[0m                   \e[36m│\e[0m"
    echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
    
    read -p $'  ╰─➤ Select option: ' SELECT
    
    case ${SELECT} in
        1) start ;;
        2) stop ;;
        3) listUpdate ;;
        4) activateProvider ;;
        5) deactivateProvider ;;
        6) whitelistHost ;;
        7) DNSOption ;;
        8) updateHelium ;;
        9) cleaner ;;
        10) reinstall ;;
        0) uninstall ;;
        x) exit 0 ;;
        *) echo -e "\e[36m┌───────────────────────────────────────────────────────────────────┐\e[0m"
           echo -e "\e[36m│\e[0m  \e[91m⚠️  Invalid option! Please try again.\e[0m                  \e[36m│\e[0m"
           echo -e "\e[36m└───────────────────────────────────────────────────────────────────┘\e[0m"
           sleep 1
           mainMenu ;;
    esac
}

initialCheck
mainMenu