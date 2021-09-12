#!/bin/bash
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -t nat -F
iptables -t mangle -F
iptables -F
iptables -X
iptables -I INPUT -p udp --dport 53 -j ACCEPT 
iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 53
