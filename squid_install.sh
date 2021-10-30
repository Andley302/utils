#!/bin/bash

#Ask for password if necessary
echo

#Add Trusty Sources
touch /etc/apt/sources.list.d/trusty_sources.list
"deb http://us.archive.ubuntu.com/ubuntu/ trusty main universe" | tee --append /etc/apt/sources.list.d/trusty_sources.list > /dev/null

#Update
apt update

#Install Squid
apt install -y squid3=3.3.8-1ubuntu6 squid=3.3.8-1ubuntu6 squid3-common=3.3.8-1ubuntu6

#Install missing init.d script
wget https://raw.githubusercontent.com/Andley302/utils/main/squid/squid3
cp squid3 /etc/init.d/
chmod +x /etc/init.d/squid3
update-rc.d squid3 defaults

#Start squid
service squid3 start

#Cleanup
rm squid3

#Print info
clear
echo "====================================="
echo "Squid 3.3.8 is successfully installed!"
echo "Squid's config is located at '/etc/squid3/squid.conf'"
echo "You can start/stop/restart squid by using 'service squid3 start/stop/restart'"
echo "====================================="
