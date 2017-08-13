#!/bin/bash

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " mumetndase
ip=`curl icanhazip.com`
useradd -e `date -d "$mumetndase days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Informasi SSH"
echo -e "=========-account-=========="
echo -e "IP Host  : $ip: "
echo -e "Port     : 443,109,80,1945,110 (Dropbear)"
echo -e "Port     : 22,143,80,90 (OpenSSH)"
echo -e "Squid    : 8080,8000,3128 (Squid Proxy)"
echo -e "Username : $Login"
echo -e "Password : $Pass"
echo -e "----------------------------"
echo -e "Aktif Sampai: $exp "
echo -e "==========================="
echo -e "     Powered By ILHAMNET      "
echo -e ""
