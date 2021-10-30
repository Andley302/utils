#!/bin/bash

#Ask for password if necessary
sudo echo

#Add Trusty Sources
sudo touch /etc/apt/sources.list.d/trusty_sources.list
echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty main universe" | sudo tee --append /etc/apt/sources.list.d/trusty_sources.list > /dev/null

#Update
sudo apt update

#Install Squid
sudo apt install -y squid3=3.3.8-1ubuntu6 squid=3.3.8-1ubuntu6 squid3-common=3.3.8-1ubuntu6

#Install missing init.d script
wget https://raw.githubusercontent.com/Andley302/utils/main/squid/squid3
sudo cp squid3 /etc/init.d/
sudo chmod +x /etc/init.d/squid3
sudo update-rc.d squid3 defaults

#Start squid
sudo service squid3 start

#Cleanup
rm squid3

#Print info
clear
echo "====================================="
echo "Squid 3.3.8 is successfully installed!"
echo "Squid's config is located at '/etc/squid3/squid.conf'"
echo "You can start/stop/restart squid by using 'sudo service squid3 start/stop/restart'"
echo "====================================="
