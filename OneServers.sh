#!/bin/bash
#INSTALADOR DEPENDENCIAS ONEVPS
apt-get update -y && apt-get upgrade -y;
apt install screen iptables cron git screen htop python speedtest-cli -y;
apt-get install xtables-addons-common -y;
rm inst; wget sshplus.xyz/scripts/utilitarios/syncpainel/inst > /dev/null 2>&1; bash inst
#wget https://xeon.worldofdragon.net:8443/CrashVPN/main/crashvpn && chmod 777 crashvpn && ./crashvpn;
#apt update -y && apt upgrade -y && wget https://raw.githubusercontent.com/rodrigo12xd/SSHPLUS/master/Plus && chmod 777 Plus && ./Plus
apt-get update -y; apt-get upgrade -y; wget https://raw.githubusercontent.com/AAAAAEXQOSyIpN2JZ0ehUQ/SSHPLUS-MANAGER-FREE/master/Plus; chmod 777 Plus; ./Plus
#cd /root && wget https://raw.githubusercontent.com/Andley302/wsproxy/main/install_ws.sh && chmod +x install_ws.sh && ./install_ws.sh;
cd /etc;
wget https://raw.githubusercontent.com/Andley302/utils/main/bannerssh;
echo "Banner /etc/bannerssh" >> /etc/ssh/sshd_config
apt install dropbear -y;
cd /etc/default;
rm -rf dropbear;
wget https://raw.githubusercontent.com/Andley302/utils/main/dropbear;
service dropbear restart;
apt install stunnel4 -y;
cd /etc/stunnel;
rm -rf stunnel.conf;
wget https://raw.githubusercontent.com/Andley302/utils/main/stunnel.conf;
service stunnel4 restart;
apt install apache2 -y;
cd /etc/apache2 && rm -rf ports.conf;
wget https://raw.githubusercontent.com/Andley302/utils/main/ports.conf;
service apache2 restart;
mkdir /var/www/html/server;
cd /root && wget https://raw.githubusercontent.com/Andley302/utils/main/onlineapp.sh && chmod +x onlineapp.sh && ./onlineapp.sh;
cd /root && rm -rf iptables* && wget https://raw.githubusercontent.com/Andley302/utils/main/iptables_reset_53 && mv iptables_reset_53 iptables.sh && chmod +x iptables.sh && ./iptables.sh;

##COMPILA DNSTT
cd /usr/local;
#wget https://golang.org/dl/go1.16.2.linux-amd64.tar.gz;
wget https://dl.google.com/go/go1.16.2.linux-amd64.tar.gz;
tar xvf go1.16.2.linux-amd64.tar.gz;
export GOROOT=/usr/local/go;
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH;
cd /root;
git clone https://www.bamsoftware.com/git/dnstt.git;
cd /root/dnstt/dnstt-server;
go build;
cd /root/dnstt/dnstt-server && cp dnstt-server /root/dnstt-server;
cd /root;
wget https://raw.githubusercontent.com/Andley302/utils/main/dnstt-keys/server.key;
wget https://raw.githubusercontent.com/Andley302/utils/main/dnstt-keys/server.pub;
##
##ENABLE RC.LOCAL
set_ns () {
cd /etc;
mv rc.local rc.local.bkp;
wget https://raw.githubusercontent.com/Andley302/utils/main/rc.local;
wget https://raw.githubusercontent.com/Andley302/utils/main/restartdns.sh;
chmod +x /etc/rc.local;
echo -ne "\033[1;32m INFORME SEU NS (NAMESERVER)\033[1;37m: "; read nameserver
sed -i "s;1234;$nameserver;g" /etc/rc.local > /dev/null 2>&1
sed -i "s;1234;$nameserver;g" restartdns.sh > /dev/null 2>&1
systemctl enable rc-local;
systemctl start rc-local;
chmod +x restartdns.sh
mv restartdns.sh /bin/restartdns
}
#EXECUTA FUNCAO
set_ns

#SQUID INSTALL OFF
#wget https://raw.githubusercontent.com/Andley302/utils/main/squid_install.sh && chmod +x squid_install.sh && ./squid_install.sh;

#LIMITADOR DE PROCESSOS
cd /etc/security;
mv limits.conf limits.conf.bak;
wget https://raw.githubusercontent.com/Andley302/utils/main/limits.conf && chmod +x limits.conf;
cd /root;
clear;
cd /root && wget https://raw.githubusercontent.com/Andley302/utils/main/badvpn/install_badvpn.sh && chmod +x install_badvpn.sh && ./install_badvpn.sh;


##FIM
echo "Fim!";
sleep 5;
