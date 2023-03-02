#!/usr/bin/env bash

#give some time for wifi to connect
sleep 30
#if wifi is not connected
ip link show dev wlan0 | grep -q "state UP"
check=$?
if [ "$check" -ne 0 ]
then
        /usr/bin/create_ap --config /etc/create_ap.conf
fi