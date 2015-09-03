#!/bin/bash
#
# Script to startup USB modem
# Could no doubt be rewritten to use EXPECT or something similar
# Also could do with a trap to cleanup for when its interrupted
# Signal strength is reported asynchronusly on ttyUSB2
#
# Ref: http://forums.freebsd.org/showthread.php?t=15952
# Ref: http://www.draisberghof.de/usb_modeswitch/bb/viewtopic.php?t=734
#
APN="internet"
TTY=/dev/ttyUSB0
# set -x # Uncomment to debug scripts
set -e # Exit on fault in script
 
ifdown wwan0 && true > /dev/null 2>&1
 
 
# Report signal strength while working
# 0-31 where 31 is best but I get about 7 in the study
cat /dev/ttyUSB2 | grep RSSI &
PID=$!
cat /dev/ttyUSB0 | sed -e 's/^/LOG: /' &
PID2=$!
 
trap "kill $PID $PID2 ; exit 0" INT TERM EXIT
 
stty -F $TTY ispeed 406800 ospeed 406800 -echo
 
# Reset
echo -ne 'ATZ\r\n' > $TTY
sleep 1
echo -ne 'AT&F\r\n' > $TTY
sleep 1
# Prepare to work
echo -ne 'AT+CFUN=1\r\n' > $TTY
sleep 1
echo -ne 'AT+CMEE=2\r\n' > $TTY
sleep 1
echo -ne 'AT+CSQ\r\n' > $TTY
sleep 1
 
# Print out available networks - 50502 is optus
# Should see: +COPS: 0,2,"50502",2
echo -ne 'AT+COPS?\r\n' > $TTY
sleep 1
 
# Enable wwan0 for DHCP - connects to the service
# At this point the blue led finally stops flashing and turns on solid
echo -ne 'AT^NDISDUP=1,1,"'$APN'"\r\n' > $TTY
sleep 1
##ifconfig wwan0 hw ether 00:01:02:03:04:05
ifup wwan0
ifconfig | grep -A1 wwan0
kill $PID $PID2
exit 0