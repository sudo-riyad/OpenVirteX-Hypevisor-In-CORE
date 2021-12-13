route add -net 10.0.0.254 netmask 255.255.255.255 dev eth1
route add -net 10.0.0.0 netmask 255.255.255.0 gw 10.0.0.254 