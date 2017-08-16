#!/bin/bash
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`
#
#
# ========================

# Modifikasi Terminal

blue='\e[134m'
green='\e[023m'
purple='\e[135m'
cyan='\e[136m'
red='\e[131m'
echo -e $green'================================================================================'
echo -e $red[+] $cyan"$HOSTNAME uptime is "$red[+]$cyanuptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
uname -r
uname -v -s
echo -e $red[+]$cyan Today :$red[+]$cyan 
date
echo -e $green'================================================================================'
#Figlet nama
echo -e $green 
figlet -f slant "# HARNET SERVER #"
echo -e $cyan     '_________________<? WELCOME USER VPS ?>_________________'
echo "  ----------------------"
echo "Perintah / Command VPS Harnet"
echo "MOD/SELLER ILHAM MUHAMMAD"
echo "IP SERVER : $myip"
echo "--------------- Ketikan Sesuai Angka ---------------"
echo "1. Membuat Akun Baru"
echo "2. Memantau Yang Login"
echo "3. Mengetahui List Akun SSH" 
echo "4. Membuat Akun trial SSH 1 Days" 
echo "5. Auto Kill / Deleted untuk Akun yang EXP" 
echo "6. Untuk user yang nakal / multi login" 
echo "7. Jika ingin mengetahui Info VPS"  
echo "8. Untuk Test Speed"
echo "9. Untuk Menghapus Akun = userdel username"
echo "10. Untuk reboot vps"
echo "11. Cara menambah Akun Yang Exp
"===++Fitur Lain++==="
"12. Mengganti Banner"
"13. Mengganti Password Akun SSH  = pass [username] [newpassword]"
"14. Config OVPN UDP : http://IP:85/udp.ovpn "
"15. Config OVPN TCP : http://IP:85/tcp.ovpn "
"16. OCS Panel Reseller : http://IP:85/ "
"17.Used data by User"
"18.Swap RAM"
"19.MON SSH"
"20.Change UDP openvpn port"
"21.Change Dropbear port"
"22.Change Squid Port"
"23.Restart Dropbear"
"24.Restart OVPN"
"25.Restart Webmin
echo "26.Restart Squid"
echo "27.Restart Nginx"
echo "28.Change TCP openvpn port"
echo "29.Ganti Password VPS"
echo -e $red "Thanks For Purchase :) "
echo -e $red "Regards Admin Harnet "
echo -e $red "#Haris Priambodo = Facebook"
echo -e $red "#ILHAM MUHAMMAD = Facebook"



                


