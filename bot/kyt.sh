#!/bin/bash
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)
########## COLOR ##########
grenbo="\e[92;1m"
NC='\e[0m'

apt update && apt upgrade
apt install python3 python3-pip git
cd /usr/bin
wget https://raw.githubusercontent.com/zhets/project/main/bot/bot.zip
unzip bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
clear
wget https://raw.githubusercontent.com/zhets/project/main/bot/fvstore.zip
unzip fvstore.zip
pip3 install -r kyt/requirements.txt

clear
echo ""
echo -e "\033[1;36m════════════════════════════════════\033[0m"
echo -e " \e[1;97;101m          ADD BOT PANEL          \e[0m"
echo -e "\033[1;36m════════════════════════════════════\033[0m"
echo -e "${grenbo}Tutorial Create Bot and ID Telegram${NC}"
echo -e "${grenbo}[*] Create Bot and Token Bot : @BotFather${NC}"
echo -e "${grenbo}[*] Info Id Telegram : @MissRose_bot , perintah /info${NC}"
echo -e "\033[1;36m════════════════════════════════════\033[0m"
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram : " admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/kyt/var.txt
echo -e ADMIN='"'$admin'"' >> /usr/bin/kyt/var.txt
echo -e DOMAIN='"'$domain'"' >> /usr/bin/kyt/var.txt
echo -e PUB='"'$PUB'"' >> /usr/bin/kyt/var.txt
echo -e HOST='"'$NS'"' >> /usr/bin/kyt/var.txt
clear

cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Simple kyt - @kyt
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start kyt 
systemctl enable kyt
systemctl restart kyt
cd /root
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo -e "Token Bot : $bottoken"
echo -e "Admin     : $admin"
echo -e "Domain    : $domain"
echo -e "Pub       : $PUB"
echo -e "Host      : $NS"
echo -e "==============================="
echo "Setting done"
sleep 3
clear
echo " Installations complete, type /menu on your bot"
rm -rf kyt.sh
rm -rf bot.zip
read " Klik [ Enter ] Kembali ke menu "
menu
