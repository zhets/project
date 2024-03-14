#!/bin/bash

cd
if [ -d /etc/udp ];then
rm -rf /etc/udp
fi
mkdir -p /etc/udp

# change to time GMT+7
echo "change to time GMT+7"
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# install udp-custom
echo downloading udp-custom
wget -q -O /etc/udp/udp-custom "https://raw.githubusercontent.com/zhets/project/main/ssh/udp-custom-linux-amd64"
chmod +x /etc/udp/udp-custom
echo downloading default config
wget -q -O /etc/udp/config.json "https://raw.githubusercontent.com/zhets/project/main/ssh/config.json"
chmod 777 /etc/udp/config.json

cat> /etc/systemd/system/udp-custom.service <<-END
[Unit]
Description=SSH UDP Custom Service
Documentation=https://t.me/xd_tunnel
After=network.target nss-lookup.target

[Service]
User=root
Type=simple
ExecStart=/etc/udp/udp-custom server -exclude 1,54,55,1000,65535
WorkingDirectory=/etc/udp/
Restart=always
RestartSec=5s

[Install]
WantedBy=default.target
END


echo start service udp-custom
systemctl start udp-custom &>/dev/null

echo enable service udp-custom
systemctl enable udp-custom &>/dev/null

echo restart service udp-custom
systemctl restart udp-custom &>/dev/null
