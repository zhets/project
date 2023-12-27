#!/bin/bash
# // VLESS with PATH /xdxl-vpn
# // VLESS with manual input uuid ( Can be filled in freely )

REPO="https://raw.githubusercontent.com/zhets/project/main/project-xdxl/"
wget -O /usr/bin/c-vl "${REPO}c-vl"
chmod +x /usr/bin/c-vl
wget -O /etc/nginx/conf.d/xray.conf "${REPO}xray.conf" >/dev/null 2>&1
wget -O /etc/xray/config.json "${REPO}config.json" >/dev/null 2>&1

systemctl restart xray
systemctl restart nginx
c-vl
