#!/bin/sh

# del ipv4 route
ip rule del fwmark 0x1 lookup 233 2>/dev/null
ip route del local default dev lo table 233 2>/dev/null

# del ipv6 route
ip -6 rule del fwmark 0x1 lookup 233 2>/dev/null
ip -6 route del local default dev lo table 233 2>/dev/null

# del table
nft delete table inet proxy_rules 2>/dev/null