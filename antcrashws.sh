#!/bin/bash
port=80
while true
do
python /etc/CrashVPN/wsproxy.py $port
sleep 1
done