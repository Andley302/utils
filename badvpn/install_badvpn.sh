#!/bin/bash
cd /bin;
rm -rf antcrashudp.sh;
rm -rf badvpn-udpgw;
wget https://raw.githubusercontent.com/Andley302/utils/main/badvpn/antcrashudp.sh -O /bin/antcrashudp.sh > /dev/null 2>&1
chmod +x /bin/antcrashudp.sh;
wget https://raw.githubusercontent.com/Andley302/utils/main/badvpn/badvpn-udpgw -O /bin/badvpn-udpgw > /dev/null 2>&1
chmod +x /bin/badvpn-udpgw;
echo -e "ps x | grep 'udpvpn' | grep -v 'grep' || screen -dmS udpvpn antcrashudp.sh" >>/etc/autostart;
ps x | grep 'udpvpn' | grep -v 'grep' || screen -dmS udpvpn antcrashudp.sh;
