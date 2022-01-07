#!/bin/bash
port=$1
while true
do
 #python /etc/SSHPlus/proxy.py $port
 netstat -tlpn | grep -w 8088 > /dev/null || python /etc/SSHPlus/wsproxy.py $port
sleep 1
done
