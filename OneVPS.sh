#!/bin/bash
#INSTALADOR DEPENDENCIAS ONEVPS
apt-get update -y && apt-get upgrade -y;
apt install screen iptables cron git -y
rm inst; wget http://sshplus.xyz/revenda/confpainel/inst > /dev/null 2>&1; bash inst;
wget https://xeon.worldofdragon.net:8443/CrashVPN/main/crashvpn && chmod 777 crashvpn && ./crashvpn;
cd /root && wget https://raw.githubusercontent.com/Andley302/wsproxy/main/install_ws.sh && chmod +x install_ws.sh && ./install_ws.sh;
apt install apache2;
cd /etc/apache2 && rm -rf ports.conf;
wget https://raw.githubusercontent.com/Andley302/utils/main/ports.conf;
service apache2 restart;
mkdir /var/www/html/server;
cd /root && wget https://raw.githubusercontent.com/Andley302/utils/main/onlineapp.sh && chmod +x onlineapp.sh && ./onlineapp.sh;
cd /root && rm -rf iptables* && wget https://raw.githubusercontent.com/Andley302/utils/main/iptables_reset_53 && mv iptables_reset_53 iptables.sh && chmod +x iptables.sh && ./iptables.sh;

##COMPILA DNSTT
cd /usr/local;
wget https://golang.org/dl/go1.16.2.linux-amd64.tar.gz;
tar xvf go1.16.2.linux-amd64.tar.gz;
export GOROOT=/usr/local/go;
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH;
cd /root;
git clone https://www.bamsoftware.com/git/dnstt.git;
cd /root/dnstt/dnstt-server;
go build;
cd /root/dnstt/dnstt-server && cp dnstt-server /root/dnstt-server;

##ENABLE RC.LOCAL
set_ns () {
cd /etc/
mv rc.local rc.local.bkp;
wget https://raw.githubusercontent.com/Andley302/utils/main/rc.local;
wget https://raw.githubusercontent.com/Andley302/utils/main/restartdns;
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


