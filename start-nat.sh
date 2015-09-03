#!/bin/bash 

echo "Making NAT configuration..."

#sudo -s

if [ "$(id -u)" -ne "0" ]; then 
	echo "Run this script with root priviliges"
	echo "$(id -u)"
	exit
fi

iptables --table nat --append POSTROUTING --out-interface wlan0 -j MASQUERADE

iptables --append FORWARD --in-interface eth0 -j ACCEPT

echo 1 > /proc/sys/net/ipv4/ip_forward

/etc/init.d/networking restart
