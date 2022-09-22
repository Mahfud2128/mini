#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/Mahfud2128/access/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/Mahfud2128/access/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/Mahfud2128/access/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}

x="ok"

cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
rekk='XRAY'
bec='xray'
else
rekk='V2RAY'
bec='v2ray'
fi

PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/Mahfud2128/access/main/ip | grep $MYIP | awk '{print $3}')
fi
clear
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e "\033[1;37m                 INFO SERVER                "
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
IPVPS=$(curl -s ipinfo.io/ip )
serverV=$( curl -sS https://raw.githubusercontent.com/Mahfud2128/access/main/versi)

if [ "$cekup" = "day" ]; then
echo    -e   "System Uptime   :  $uphours $upminutes $uptimecek"
else
echo -e   "System Uptime   :  $uphours $upminutes"
fi
echo -e "Use Core        :  $rekk"
echo -e "Current Domain  :  $(cat /var/lib/scrz-prem/ipvps.conf | cut -d'=' -f2)"
echo -e "IP-VPS          :  $IPVPS"
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e "\033[1;37m               SERVICE RUNNING               "
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
status="$(systemctl show cron.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " \033[1;36m~\033[0m Cron				: "$green"Running"$NC""
else
echo -e " \033[1;36m~\033[0m Cron				: "$red"Not Running (Error)"$NC""
fi
status="$(systemctl show fail2ban.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " \033[1;36m~\033[0m Fail2ban	        	: "$green"Running"$NC""
else
echo -e " \033[1;36m~\033[0m Fail2ban				: "$red"Not Running (Error)"$NC""
fi
status="$(systemctl show xray.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " \033[1;36m~\033[0m Xray				: "$green"Running"$NC""
else
echo -e " \033[1;36m~\033[0m Xray				: "$red"Not Running (Error)"$NC""
fi
status="$(systemctl show ws-dropbear.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " \033[1;36m~\033[0m WS-Dropbear			: "$green"Running"$NC""
else
echo -e " \033[1;36m~\033[0m WS-Dropbear			: "$red"Not Running (Error)"$NC""
fi
status="$(systemctl show ws-stunnel.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " \033[1;36m~\033[0m WS-Stunnel			: "$green"Running"$NC""
else
echo -e " \033[1;36m~\033[0m WS-Stunnel			: "$red"Not Running (Error)"$NC""
fi
status="$(systemctl show nginx.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " \033[1;36m~\033[0m Nginx			: "$green"Running"$NC""
else
echo -e " \033[1;36m~\033[0m Nginx			: "$red"Not Running (Error)"$NC""
fi
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e "\033[1;37m                  SSH MENU                   "
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
echo -e " [\033[1;36m01\033[0m]  Add User SSH
 [\033[1;36m02\033[0m]  Cek User SSH
 [\033[1;36m03\033[0m]  Del User SSH
 [\033[1;36m04\033[0m]  Renew SSH
 [\033[1;36m05\033[0m]  Member
 [\033[1;36m06\033[0m]  autokill SSH
 [\033[1;36m07\033[0m]  Limit Speed All Service
\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e "\033[1;37m                  XRAY MENU                  "
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m
 [\033[1;36m08\033[0m]  Add Vmess Account
 [\033[1;36m09\033[0m]  Add Vless Account
 [\033[1;36m10\033[0m]  Addd Trojan Account
 [\033[1;36m11\033[0m]  Add Sodosok Account
 [\033[1;36m12\033[0m]  Cek User Xray
 [\033[1;36m13\033[0m]  Del User Vmess / Sodosok
 [\033[1;36m14\033[0m]  Del User Trojan
 [\033[1;36m15\033[0m]  Del User Vless
 [\033[1;36m16\033[0m]  Renew User Vmess / Sodosok
 [\033[1;36m17\033[0m]  Renew User Trojan
 [\033[1;36m18\033[0m]  Renew User Vless"
echo -e  "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e "\033[1;37m                Settings MENU                "
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m
 [\033[1;36m19\033[0m]  Add-host
 [\033[1;36m20\033[0m]  Gen SSL 
 [\033[1;36m21\033[0m]  Backup 
 [\033[1;36m22\033[0m]  Restore
 [\033[1;36m23\033[0m]  Webmin
"
if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
echo -ne
else
echo -e "[\033[1;32m999\033[0m] • \033[0;31mUpdate Available ! Go choice 69 to update\033[0m"
echo ""
fi
echo -e "\033[1;37mPress [ Ctrl+C ] • To-Exit-Script\033[0m"
echo ""
#echo -e "\e[36m╘════════════════════════════════════════════════════╛\033[0m"
echo -e "\e[36m╒═════════════════════════════════════════════╕\033[0m"
if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
echo -e "Version       :\033[1;36m $(cat /opt/.ver) Latest Version\e[0m"
echo -e "Client Name   : $Name"
echo -e "Expiry script : $Exp"
rm -f /home/needupdate > /dev/null 2>&1
else
rm /dev/.permiss > /dev/null 2>&1
touch /home/needupdate > /dev/null 2>&1
echo -e "\033[0;33mVersion : $(cat /opt/.ver) Update available to $serverV\e[0m"
echo -e "\e[36m╒═════════════════════════════════════════════╕\033[0m"
echo ""
echo -e "[ \033[0;31mPesan\033[0m ]"
curl -sS https://raw.githubusercontent.com/Mahfud2128/access/main/pesan
echo -e "
"
fi
echo -e "\e[36m╘═════════════════════════════════════════════╛\033[0m"
echo
echo -ne "Select menu : "; read x
if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
    if [[ $x -eq 1 ]]; then
       usernew
    elif [[ $x -eq 2 ]]; then
       cek
    elif [[ $x -eq 3 ]]; then
       hapus
    elif [[ $x -eq 4 ]]; then
       renew
    elif [[ $x -eq 5 ]]; then
       member
    elif [[ $x -eq 6 ]]; then
       autokill
    elif [[ $x -eq 7 ]]; then
       limit-speed
    elif [[ $x -eq 8 ]]; then
       add-ws
    elif [[ $x -eq 9 ]]; then
       add-vless
    elif [[ $x -eq 10 ]]; then
       add-tr
    elif [[ $x -eq 11 ]]; then
       add-ssws
    elif [[ $x -eq 12 ]]; then
       cek-ws
    elif [[ $x -eq 13 ]]; then
       del-user
    elif [[ $x -eq 14 ]]; then
       del-tr
    elif [[ $x -eq 15 ]]; then
       del-vless
    elif [[ $x -eq 16 ]]; then
       renew-xray
    elif [[ $x -eq 17 ]]; then
       renew-tr
    elif [[ $x -eq 18 ]]; then
       renew-vless
    elif [[ $x -eq 19 ]]; then
       add-host
    elif [[ $x -eq 20 ]]; then
       crtv2ray
    elif [[ $x -eq 21 ]]; then
       backup
    elif [[ $x -eq 22 ]]; then
       restore
    elif [[ $x -eq 23 ]]; then
       webmin
    else
       menu
    fi
else
    if [[ $x -eq 69 ]]; then
       wget -q -O /usr/bin/update-script "https://raw.githubusercontent.com/Mahfud2128/access/main/update-script.sh" && chmod +x /usr/bin/update-script
       screen -S upds update-script
       menu
    elif [[ $x -eq 1 ]]; then
       usernew
    elif [[ $x -eq 2 ]]; then
       cek
    elif [[ $x -eq 3 ]]; then
       hapus
    elif [[ $x -eq 4 ]]; then
       renew
    elif [[ $x -eq 5 ]]; then
       member
    elif [[ $x -eq 6 ]]; then
       autokill
    elif [[ $x -eq 7 ]]; then
       limit-speed
    elif [[ $x -eq 8 ]]; then
       add-ws
    elif [[ $x -eq 9 ]]; then
       add-vless
    elif [[ $x -eq 10 ]]; then
       add-tr
    elif [[ $x -eq 11 ]]; then
       add-ssws
    elif [[ $x -eq 12 ]]; then
       cek-ws
    elif [[ $x -eq 13 ]]; then
       del-user
    elif [[ $x -eq 14 ]]; then
       del-tr
    elif [[ $x -eq 15 ]]; then
       del-vless
    elif [[ $x -eq 16 ]]; then
       renew-xray
    elif [[ $x -eq 17 ]]; then
       renew-tr
    elif [[ $x -eq 18 ]]; then
       renew-vless
    elif [[ $x -eq 19 ]]; then
       add-host
    elif [[ $x -eq 20 ]]; then
       crtv2ray
    elif [[ $x -eq 21 ]]; then
       backup
    elif [[ $x -eq 22 ]]; then
       restore
    elif [[ $x -eq 23 ]]; then
       webmin
    else
       menu
    fi
fi
