#!/bin/bash
port=$1
while true
do
 #python /etc/SSHPlus/proxy.py $port
 netstat -tlpn | grep -w 8080 > /dev/null || python /etc/SSHPlus/proxy.py $port
sleep 1
done
