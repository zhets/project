#!/bin/bash
cd
rm -rf /etc/udp
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
chmod 644 /etc/udp/config.json

if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team

[Service]
User=root
Type=simple
ExecStart=/etc/udp/udp-custom server
WorkingDirectory=/etc/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team

[Service]
User=root
Type=simple
ExecStart=/etc/udp/udp-custom server -exclude $1
WorkingDirectory=/etc/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
fi

echo start service udp-custom
systemctl start udp-custom &>/dev/null

echo enable service udp-custom
systemctl enable udp-custom &>/dev/null

echo restart service udp-custom
systemctl restart udp-custom &>/dev/null
