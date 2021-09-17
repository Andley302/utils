#!/bin/bash
port=$1
while true
do
python /etc/CrashVPN/wsproxy.py $port
sleep 1
done
