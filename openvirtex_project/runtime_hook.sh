#!/bin/sh
# session hook script; write commands here to execute on the host at the
# specified state
BRIFNAME=$(find /sys/devices/virtual/net -name 'enp0s9' | awk -F '[/:]' '{print $6}')
ip addr add 10.0.0.254/24 dev $BRIFNAME
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o enp0s8 -j MASQUERADE