#!/bin/bash

rm -rf fv-dropbear.sh
apt -y remove dropbear
sleep 0.5
apt -y purge dropbear
sleep 0.5
apt-get -y --purge remove dropbear
sleep 0.5
apt-get install dropbear -y > /dev/null 2>&1
wget -q -O /etc/default/dropbear "https://raw.githubusercontent.com/zhets/project/ssh/dropbear.conf"
chmod +x /etc/default/dropbear
/etc/init.d/dropbear restart
systemctl restart dropbear
rm -rf zhee-dropbear.sh
