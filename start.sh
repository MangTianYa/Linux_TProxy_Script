#!/bin/sh

dir=$(cd "$(dirname "$0")" && pwd)

# Delete old rules
$dir/stop.sh

# add ipv4 route
ip rule add fwmark 0x1 lookup 233
ip route add local default dev lo table 233

# add ipv6 route
ip -6 rule add fwmark 0x1 lookup 233
ip -6 route add local default dev lo table 233

# Load rules
nft -f $dir/proxy.rules

# add cnip
$dir/cnip.sh