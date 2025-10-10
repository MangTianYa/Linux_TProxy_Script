#!/bin/sh

dir=$(cd "$(dirname "$0")" && pwd)
cn_ipv4="$dir/cn_ipv4.txt"
cn_ipv6="$dir/cn_ipv6.txt"

# flush old set
nft flush set inet proxy_rules cn_ipv4
nft flush set inet proxy_rules cn_ipv6

# add ipv4
awk '{ print $1 }' "$cn_ipv4" | xargs -n 1000 sh -c '
    ipv4_addresses$(echo "$@" | tr " " ",")
    nft add element inet proxy_rules cn_ipv4 { $ipv4_addresses }
' sh

# add ipv6
awk '{ print $1 }' "$cn_ipv6" | xargs -n 1000 sh -c '
    ipv6_addresses=$(echo "$@" | tr " " ",")
    nft add element inet proxy_rules cn_ipv6 { $ipv6_addresses }
' sh
