#!/bin/bash
#net_int=enp0s25
net_int=wlo1

IPTABLES="/sbin/iptables"
$IPTABLES -A FORWARD -o $net_int -i vboxnet0 -s 192.168.56.0/24 -m conntrack --ctstate NEW -j ACCEPT
$IPTABLES -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A POSTROUTING -t nat -s 192.168.56.0/24 -o $net_int -j MASQUERADE

#IP-Forwarding aktivieren
echo 1 > /proc/sys/net/ipv4/ip_forward
##iptables-save > /etc/iptables/rules.v4
exit 0

