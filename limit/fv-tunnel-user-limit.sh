#!/bin/bash
REPO="https://raw.githubusercontent.com/zhets/project/main/"
wget -q -O /etc/xray/limit.vmess "${REPO}limit/vmess" >/dev/null 2>&1
wget -q -O /etc/xray/limit.vless "${REPO}limit/vless" >/dev/null 2>&1
wget -q -O /etc/xray/limit.trojan "${REPO}limit/trojan" >/dev/null 2>&1
wget -q -O /etc/xray/limit.shadowsocks "${REPO}limit/shadowsocks" >/dev/null 2>&1
chmod +x /etc/xray/limit.vmess
chmod +x /etc/xray/limit.vless
chmod +x /etc/xray/limit.trojan
chmod +x /etc/xray/limit.shadowsocks

# // QUOTA VMESS
cat >/etc/systemd/system/limitvmess.service << EOF
[Unit]
Description=Limit Usage Xray Service
Documentation=https://github.com/fv-store
After=syslog.target network-online.target

[Service]
User=root
NoNewPrivileges=true
ExecStart=/etc/xray/limit.vmess

[Install]
WantedBy=multi-user.target
EOF

# // QUOTA VLESS
cat >/etc/systemd/system/limitvless.service << EOF
[Unit]
Description=Limit Usage Xray Service
Documentation=https://github.com/fv-store
After=syslog.target network-online.target

[Service]
User=root
NoNewPrivileges=true
ExecStart=/etc/xray/limit.vless

[Install]
WantedBy=multi-user.target
EOF

# // QUOTA TROJAN
cat >/etc/systemd/system/limittrojan.service << EOF
[Unit]
Description=Limit Usage Xray Service
Documentation=https://github.com/fv-store
After=syslog.target network-online.target

[Service]
User=root
NoNewPrivileges=true
ExecStart=/etc/xray/limit.trojan

[Install]
WantedBy=multi-user.target
EOF

# // QUOTA SHADOWSOCK
cat >/etc/systemd/system/limitshadowsocks.service << EOF
[Unit]
Description=Limit Usage Xray Service
Documentation=https://github.com/fv-store
After=syslog.target network-online.target

[Service]
User=root
NoNewPrivileges=true
ExecStart=/etc/xray/limit.shadowsocks

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now limitvmess
systemctl enable --now limitvless
systemctl enable --now limittrojan
systemctl enable --now limitshadowsocks

cd
wget -q -O /usr/local/bin/limit-ip-ssh "${REPO}limit/limit-ip-ssh"
chmod +x /usr/local/bin/*
cd /usr/local/bin
sed -i 's/\r//' limit-ip-ssh
cd
clear

cd
wget -q -O /usr/bin/limit-ip "${REPO}limit/limit-ip"
chmod +x /usr/bin/*
cd /usr/bin
sed -i 's/\r//' limit-ip
cd
clear
# // SERVICE LIMIT IP VMESS
cat >/etc/systemd/system/vmip.service << EOF
[Unit]
Description=https://github.com/fv-store
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/limit-ip vmip
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# // SERVICE LIMIT IP VLESS
cat >/etc/systemd/system/vlip.service << EOF
[Unit]
Description=https://github.com/fv-store
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/limit-ip vlip
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# // SERVICE LIMIT TROJAN
cat >/etc/systemd/system/trip.service << EOF
[Unit]
Description=https://github.com/fv-store
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/limit-ip trip
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# // SERVICE LIMIT SSH
cat >/etc/systemd/system/sship.service << EOF
[Unit]
Description=https://github.com/fv-store
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/local/bin/limit-ip-ssh
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl restart sship
systemctl enable sship
systemctl restart vmip
systemctl enable vmip
systemctl restart vlip
systemctl enable vlip
systemctl restart trip
systemctl enable trip

rm -rf /root/fv-tunnel-user-limit.sh
