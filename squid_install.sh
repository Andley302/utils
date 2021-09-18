#!/bin/bash
clear
echo "Preparing...";
apt-get remove squid -y >/dev/null 2>&1
apt-get purge squid -y >/dev/null 2>&1
rm -rf /etc/squid >/dev/null 2>&1
apt-get remove squid3 -y >/dev/null 2>&1
apt-get purge squid3 -y >/dev/null 2>&1
rm -rf /etc/squid3 >/dev/null 2>&1
apt autoremove -y >/dev/null 2>&1
clear
echo "Squid 3.3.8 Installer";
sleep 3;
[[ ! -e /etc/apt/sources.list.d/trusty_sources.list ]] && {
touch /etc/apt/sources.list.d/trusty_sources.list >/dev/null 2>&1
echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty main universe" | tee --append /etc/apt/sources.list.d/trusty_sources.list >/dev/null 2>&1
}
[[ $(grep -wc 'Debian' /etc/issue.net) != '0' ]] && {
apt install dirmngr -y >/dev/null 2>&1
[[ $(apt-key list 2>/dev/null | grep -c 'Ubuntu') == '0' ]] && {
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 >/dev/null 2>&1
}
}
apt update -y >/dev/null 2>&1
apt install squid3=3.3.8-1ubuntu6 squid=3.3.8-1ubuntu6 squid3-common=3.3.8-1ubuntu6 -y >/dev/null 2>&1
wget -qO- https://raw.githubusercontent.com/Andley302/utils/main/squid/squid3 >/etc/init.d/squid3
chmod +x /etc/init.d/squid3 >/dev/null 2>&1
update-rc.d squid3 defaults >/dev/null 2>&1
cd /etc/squid3;
rm -rf squid.conf;
wget https://raw.githubusercontent.com/Andley302/utils/main/squid/payload.txt
service squid3 restart;
echo "Done";


