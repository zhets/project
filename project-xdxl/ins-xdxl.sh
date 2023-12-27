#!/bin/bash
REPO="https://raw.githubusercontent.com/zhets/project/main/"
wget -O /usr/bin/c-vl "${REPO}/project-xdxl/c-vl
chmod +x /usr/bin/c-vl
wget -O /etc/nginx/conf.d/xray.conf "${REPO}xray/xray.conf" >/dev/null 2>&1
wget -O /etc/xray/config.json "${REPO}xray/config.json" >/dev/null 2>&1
￼systemctl restart xray
ckrun
