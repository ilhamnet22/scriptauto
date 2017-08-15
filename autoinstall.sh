#!/bin/bash

# go to root
cd
# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local
# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=`curl icanhazip.com`;
MYIP2="s/xxxxxxxxx/$MYIP/g";
source="http://128.199.219.83/ccs/";
#banner
wget -O /etc/baner http://128.199.219.83/ccs/baner.txt
#keperluan1
apt-get -y install unzip 
sudo apt-get -y install figlet 
sudo apt-get -y install fortune cowsay
apt-get -y install lsb-release scrot
apt-get -y install sudo
apt-get -y update
apt-get -y upgrade
apt-get -y install nano  
apt-get -y install vim
apt-get -y install wondershaper
sudo apt-get -y install fail2ban
apt-get -y -f install libxml-parser-perl
# install webserver
apt-get -y install nginx php5-fpm php5-cli
# Web Server
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf $source/nginx.conf
mkdir -p /home/vps/public_html
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
wget -O /home/vps/public_html/index.html $source/index.txt
wget -O /etc/nginx/conf.d/vps.conf $source/vps.conf
sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf
service php5-fpm restart
service nginx restart
# ovpn
wget http://128.199.219.83/ccs/ovpn.sh && bash ovpn.sh
# keperluan
apt-get -y install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python;
wget "http://prdownloads.sourceforge.net/webadmin/webmin_1.850_all.deb"
dpkg --install webmin_1.850_all.deb;  
apt-get -y install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python;
apt-get -y -f install;
# keperluan 2
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
# dropbear
apt-get -y install dropbear 
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear 
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=443/g' /etc/default/dropbear 
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 80 -p 110 -p 1945 -p 109"/g' /etc/default/dropbear
# banner
sed -i 's/#Banner/Banner/g' /etc/ssh/sshd_config
echo "Banner /etc/baner" >> /etc/ssh/sshd_config
sed -i 's/DROPBEAR_BANNER=""/DROPBEAR_BANNER="\/etc\/baner"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells 
# port
sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 90' /etc/ssh/sshd_config
sed -i '/Banner/Banner/g' /etc/ssh/sshd_config
echo "Banner /etc/baner" >> /etc/ssh/sshd_config
echo "Banner /etc/baner" >> /etc/ssh/sshd_config
# restart
service ssh restart 
service dropbear restart
wondershaper eth0 1024 1024
/sbin/chkconfig dropbear on
/etc/init.d/webmin restart
# wget
# create
wget https://raw.githubusercontent.com/ilhamnet22/script/master/create-user.sh
cp /root/create-user.sh /usr/bin/1
chmod +x /usr/bin/1
# mantau
wget https://raw.githubusercontent.com/ilhamnet22/script/master/mantau.sh
cp /root/mantau.sh /usr/bin/2
chmod +x /usr/bin/2
# list
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/list.sh
cp /root/list.sh /usr/bin/3
chmod +x /usr/bin/3
# trial
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/trial.sh
cp /root/trial.sh /usr/bin/4
chmod +x /usr/bin/4
# exp
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/exp.sh
cp /root/exp.sh /usr/bin/5
chmod +x /usr/bin/5
# menu
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/menu.sh
cp /root/menu.sh /usr/bin/menu
chmod +x /usr/bin/menu
# speedtest
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/speedtest.py
chmod +x speedtest.py
# tendang
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/tendang.sh
cp /root/tendang.sh /usr/bin/6
chmod +x /usr/bin/6
# renew
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/renew.sh
cp /root/renew.sh /usr/bin/11
chmod +x /usr/bin/11
# info
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/info.sh
cp /root/info.sh /usr/bin/7
chmod +x /usr/bin/7
# pass
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/pass.sh
cp /root/pass.sh /usr/bin/pass
chmod +x /usr/bin/pass
# other fiture
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/usedata.sh
cp /root/usedata.sh /usr/bin/17
chmod +x /usr/bin/17
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/swap.sh
cp /root/swap.sh /usr/bin/18
chmod +x /usr/bin/18
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/restwebmin.sh
cp /root/restwebmin.sh /usr/bin/25
chmod +x /usr/bin/25
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/restsquid.sh
cp /root/restsquid.sh /usr/bin/22
chmod +x /usr/bin/22
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/restov.sh
cp /root/restov.sh /usr/bin/24
chmod +x /usr/bin/24
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/passwd.sh
cp /root/passwd.sh /usr/bin/29
chmod +x /usr/bin/29
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/mon.sh
cp /root/mon.sh /usr/bin/19
chmod +x /usr/bin/19
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/gantiudp.sh
cp /root/gantiudp.sh /usr/bin/20
chmod +x /usr/bin/20
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/gantitcp.sh
cp /root/gantitcp.sh /usr/bin/28
chmod +x /usr/bin/28
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/gantisquid.sh
cp /root/gantisquid.sh /usr/bin/22
chmod +x /usr/bin/22
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/drop.sh
cp /root/drop.sh /usr/bin/21
chmod +x /usr/bin/21
wget https://raw.githubusercontent.com/ilhamnet22/scriptauto/master/reboot.sh
cp /root/reboot.sh /usr/bin/10
chmod +x /usr/bin/25
wget http://128.199.219.83/ccs/new/test.sh
cp /root/test.sh /usr/bin/8
chmod +x /usr/bin/8
# squid3
apt-get -y install squid3
wget -O /etc/squid3/squid.conf $source/squid.conf
sed -i $MYIP2 /etc/squid3/squid.conf;
service squid3 restart
# autoreboot
echo "0 */24 * * * root /sbin/reboot" > /etc/cron.d/reboot
echo "0 */12 * * * root /bin/bash /usr/bin/exp" > /etc/cron.d/exp
# ip tables
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -d 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 21 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 109 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 10000 -j ACCEPT
iptables -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp -m udp --dport 109 -j ACCEPT
iptables -A OUTPUT -p udp -m udp -j DROP
iptables -A OUTPUT -p tcp -m tcp -j DROP
iptables -A FORWARD -m string --string "BitTorrent" --algo bm --to 65535 -j DROP 
iptables -A FORWARD -m string --string "BitTorrent protocol" --algo bm --to 65535 -j DROP 
iptables -A FORWARD -m string --string "peer_id=" --algo bm --to 65535 -j DROP 
iptables -A FORWARD -m string --string ".torrent" --algo bm --to 65535 -j DROP 
iptables -A FORWARD -m string --string "announce.php?passkey=" --algo bm --to 65535 -j DROP 
iptables -A FORWARD -m string --string "torrent" --algo bm --to 65535 -j DROP 
iptables -A FORWARD -m string --string "announce" --algo bm --to 65535 -j DROP 
iptables -A FORWARD -m string --string "info_hash" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -d vps-termurah.net -j DROP
iptables -A OUTPUT -d account.sonyentertainmentnetwork.com -j DROP
iptables -A OUTPUT -d auth.np.ac.playstation.net -j DROP
iptables -A OUTPUT -d auth.api.sonyentertainmentnetwork.com -j DROP
iptables -A OUTPUT -d auth.api.np.ac.playstation.net -j DROP
# kill 
cd /usr/bin/
wget https://raw.githubusercontent.com/galihrezah/kill/master/killmultilogindropbear –no-check-certificate -O kill
chmod +x /usr/bin/kill
echo “* * * * * root /usr/bin/kill” >> /etc/crontab
cd /
echo "0 * * * * root /usr/bin/reboot" > /etc/cron.d/reboot
wget http://www.inetbase.com/ccripts/ccos/install.sh
chmod 0700 install.sh
./install.sh
:q
# finishing
chown -R www-data:www-data /home/vps/public_html
service cron restart
service nginx start
service php-fpm start
service vnstat restart
service snmpd restart
service ssh restart
service openvpn restart
service dropbear restart
service fail2ban restart
service squid3 restart
service webmin restart
# hapus
rm -rf ~/.bash_history && history -c
echo "unset HISTFILE" >> /etc/profile
rm autoinstall.sh
rm create-user.sh
rm mantau.sh
rm list.sh
rm trial.sh
rm exp.sh
rm menu.sh
rm speedtest.py
rm tendang.sh
rm renew.sh
rm info.sh
rm webmin_1.850_all.deb
rm root/testspeed.py
rm baner.txt
rm pass.sh
rm ovpn.sh
rm speedtest.py.1
rm speedtest.py
rm menu2.sh
rm usedata.sh
rm swap.sh
rm restwebmin.sh
rm restsquid.sh
rm restov.sh
rm passwd.sh
rm mon.sh
rm gantiudp.sh
rm gantitcp.sh
rm gantisquid.sh
rm drop.sh
rm test.sh
rm ban.sh
# hapus
rm /root/autoinstall.sh
rm /root/create-user.sh
rm /root/mantau.sh
rm /root/list.sh
rm /root/trial.sh
rm /root/exp.sh
rm /root/menu.sh
rm /root/speedtest.py
rm /root/tendang.sh
rm /root/renew.sh
rm /root/info.sh
rm /root/webmin_1.850_all.deb
rm /root/testspeed.py
rm /root/baner.txt
rm /root/pass.sh
rm /root/ovpn.sh
rm /root/speedtest.py.1
rm /root/speedtest.py
rm /root/menu2.sh
rm /root/usedata.sh
rm /root/swap.sh
rm /root/restwebmin.sh
rm /root/restsquid.sh
rm /root/restov.sh
rm /root/passwd.sh
rm /root/mon.sh
rm /root/gantiudp.sh
rm /root/gantitcp.sh
rm /root/gantisquid.sh
rm /root/drop.sh
rm /root/test.sh
rm /root/ban.sh
history -c
# fliget
figlet -f smslant "Welcome To My Server"
# OCSPANEL
apt-get update && apt-get -y install mysql-server
chown -R mysql:mysql /var/lib/mysql/ && chmod -R 755 /var/lib/mysql/
# sss
apt-get -y install nginx php5 php5-fpm php5-cli php5-mysql php5-mcrypt
# ss
rm /etc/nginx/sites-enabled/default && rm /etc/nginx/sites-available/default
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup
mv /etc/nginx/conf.d/vps.conf /etc/nginx/conf.d/vps.conf.backup
wget -O /etc/nginx/nginx.conf "http://script.hostingtermurah.net/repo/blog/ocspanel-debian7/nginx.conf"
wget -O /etc/nginx/conf.d/vps.conf "http://script.hostingtermurah.net/repo/blog/ocspanel-debian7/vps.conf"
sed -i 's/cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php5/fpm/php.ini
sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf
# ssjnjn
useradd -m vps && mkdir -p /home/vps/public_html
rm /home/vps/public_html/index.html && echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html && chmod -R g+rw /home/vps/public_html
service php5-fpm restart && service nginx restart
# oke
cd /home/vps/public_html
wget http://128.199.219.83/ccs/OCS.zip
unzip OCS.zip
rm OCS.zip
rm index.html
chmod 777 /home/vps/public_html/config
chmod 777 /home/vps/public_html/config/config.ini
chmod 777 /home/vps/public_html/config/route.ini
clear
# sss
mysql -u root -p
# ssss
CREATE DATABASE IF NOT EXISTS OCSPANEL;EXIT;
# sssssd
apt-get -y install git
clear
service php5-fpm restart && service nginx restart
# OCSPASSWORD
mysqld_safe --skip-grant-tables &
# login mysql
mysql -u root mysql
# update pass
UPDATE user SET password=PASSWORD('harnet@11') WHERE user='root';
FLUSH PRIVILEGES;
# restart yok
service mysql restart
# login again 
mysql -u root mysql
service mysql restart
# c
clear
# OCS
cd /home/vps/public_html
wget http://128.199.219.83/ccs/OCS.zip




