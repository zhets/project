#!/bin/bash

user="$2"
function ssh(){
	getent passwd ${user}  >/dev/null 2>&1
	userdel -f ${user}  >/dev/null 2>&1
	systemctl restart sshd >/dev/null 2>&1
	systemctl restart ws >/dev/null 2>&1
}
function vmess(){
    exp=$(grep -wE "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
	sed -i "/^### $user $exp/,/^},{/d" /etc/vmess/.vmess.db
	sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
	sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
	rm -f /etc/vmess/quota-asli/$user
	rm -f /etc/vmess/quota-hasil/$user
	rm -f /etc/vmess/limit/$user
	rm -f /home/vps/public_html/$user-VMESSTLS.yaml
        rm -f /home/vps/public_html/$user-VmessNTLS.yaml
        rm -f /home/vps/public_html/$user-VmessWsCDN.yaml
        rm -f /home/vps/public_html/$user-VmessNWsCDN.yaml
        rm -f /home/vps/public_html/$user-VmessGCDN.yaml 
        rm -f /var/www/html/vmess-$user.txt
}
function vless(){
    exp=$(grep -wE "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
	sed -i "/^#& $user $exp/,/^},{/d" /etc/vless/.vless.db
	sed -i "/^#& $user $exp/,/^},{/d" /etc/xray/config.json
	sed -i "/^#& $user $exp/,/^},{/d" /etc/xray/config.json
	rm -f /etc/vless/quota-asli/$user
	rm -f /etc/vless/quota-hasil/$user
	rm -f /etc/vless/limit/$user
	rm -f /home/vps/public_html/$user-VMESSTLS.yaml
        rm -f /home/vps/public_html/$user-VlessNTLS.yaml
        rm -f /home/vps/public_html/$user-VlessTLSCDN.yaml
        rm -f /home/vps/public_html/$user-VlessNTLSCDN.yaml
        rm -f /home/vps/public_html/$user-VlessGrpcCDN.yaml
        rm -f /var/www/html/vless-$user.txt
}
function trojan(){
    exp=$(grep -wE "^#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
	sed -i "/^#! $user $exp/,/^},{/d" /etc/trojan/.trojan.db
	sed -i "/^#! $user $exp/,/^},{/d" /etc/xray/config.json
	sed -i "/^#! $user $exp/,/^},{/d" /etc/xray/config.json
	rm -f /etc/trojan/quota-asli/$user
	rm -f /etc/trojan/quota-hasil/$user
	rm -f /etc/trojan/limit/$user
	rm -f /home/vps/public_html/$user-TRTLS.yaml
        rm -f /home/vps/public_html/$user-TRTLSCDN.yaml
        rm -f /home/vps/public_html/$user-TRNOTLSCDN.yaml
        rm -f /home/vps/public_html/$user-TRGrpcCDN.yaml
        rm -f /var/www/html/trojan-$user.txt
}
function ssws(){
    exp=$(grep -wE "^##@ $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
	sed -i "/^##@ $user $exp/,/^},{/d" /etc/shadowsocks/.shadowsocks.db
	sed -i "/^##@ $user $exp/,/^},{/d" /etc/xray/config.json
	sed -i "/^##@ $user $exp/,/^},{/d" /etc/xray/config.json
	rm -f /etc/shadowsocks/quota-asli/$user
	rm -f /etc/shadowsocks/quota-hasil/$user
	rm -f /etc/shadowsocks/limit/$user
}
if [[ ${1} == "vmess" ]]; then
vmess
elif [[ ${1} == "vless" ]]; then
vless
elif [[ ${1} == "trojan" ]]; then
trojan
elif [[ ${1} == "ssh" ]]; then
ssh
elif [[ ${1} == "ssws" ]]; then
ssws
fi
