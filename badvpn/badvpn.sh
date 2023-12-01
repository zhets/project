#!/bin/bash
REPO="https://raw.githubusercontent.com/zhets/project/main/"
mkdir -p /usr/local/zhee/
wget -q -O /usr/local/zhee/udp-mini "${REPO}badvpn/udp-mini"
chmod +x /usr/local/zhee/udp-mini
wget -q -O /etc/systemd/system/udp-mini-1.service "${REPO}badvpn/udp-mini-1.service"
wget -q -O /etc/systemd/system/udp-mini-2.service "${REPO}badvpn/udp-mini-2.service"
wget -q -O /etc/systemd/system/udp-mini-3.service "${REPO}badvpn/udp-mini-3.service"
wget -q -O /etc/systemd/system/udp-mini-4.service "${REPO}badvpn/udp-mini-4.service"
systemctl disable udp-mini-1
systemctl stop udp-mini-1
systemctl enable udp-mini-1
systemctl start udp-mini-1

systemctl disable udp-mini-2
systemctl stop udp-mini-2
systemctl enable udp-mini-2
systemctl start udp-mini-2

systemctl disable udp-mini-3
systemctl stop udp-mini-3
systemctl enable udp-mini-3
systemctl start udp-mini-3

systemctl disable udp-mini-4
systemctl stop udp-mini-4
systemctl enable udp-mini-4
systemctl start udp-mini-4