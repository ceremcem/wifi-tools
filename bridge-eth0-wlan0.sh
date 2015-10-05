#!/bin/bash 

CONF=$1

if [[ "$CONF" == "" ]]; then
	echo "You need to supply a config name!"
	echo "exiting..."
	exit 1
fi 



if [ "$(id -u)" -ne "0" ]; then 
        echo "Run this script with root priviliges"
        sudo bash -c "$0 $1 $2"
        exit
fi

echo "Making NAT configuration..."

echo "Stopping network manager"
/etc/init.d/network-manager stop
killall wpa_supplicant 

ifconfig eth0 10.0.10.50/24
/etc/init.d/dnsmasq restart

echo "connecting to wifi 3gconnect"
wpa_supplicant -c"/home/$SUDO_USER/.cca/wifi-conf.d/$CONF.conf" -Dwext -iwlan0 &
sleep 5
dhclient wlan0


echo "Clearing iptables"
iptables --table nat --flush 
iptables --flush 

iptables --table nat --append POSTROUTING --out-interface wlan0 -j MASQUERADE

iptables --append FORWARD --in-interface eth0 -j ACCEPT

echo 1 > /proc/sys/net/ipv4/ip_forward

#/etc/init.d/networking reload

echo "List of dhcp clients: "
echo "----------------------"
cat /var/lib/misc/dnsmasq.leases

echo "All settings are done..."


