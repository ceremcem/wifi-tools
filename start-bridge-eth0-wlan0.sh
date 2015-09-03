#!/bin/bash 

echo "Making NAT configuration..."

#sudo -s

if [ "$(id -u)" -ne "0" ]; then 
	echo "Run this script with root priviliges"
	sudo "$0"
	exit
fi

echo "Stopping network manager"
/etc/init.d/network-manager stop
ifconfig eth0 10.0.10.50/24
/etc/init.d/dnsmasq restart

echo "connecting to wifi 3gconnect"
wpa_supplicant -c/etc/wpa_supplicant.conf -Dwext -iwlan0 &
sleep 5
dhclient wlan0


echo "Clearing iptables"
iptables --table nat --flush 
iptables --flush 

iptables --table nat --append POSTROUTING --out-interface wlan0 -j MASQUERADE

iptables --append FORWARD --in-interface eth0 -j ACCEPT

echo 1 > /proc/sys/net/ipv4/ip_forward

#/etc/init.d/networking reload

echo "All settings are done..."


