#!/bin/sh

dir=$(cd "$(dirname "$0")" && pwd)
file4="$dir/cn_ipv4.txt"
file6="$dir/cn_ipv6.txt"

# flush old set
nft flush set inet proxy_rules cn_ipv4
nft flush set inet proxy_rules cn_ipv6

# add ipv4
awk '{ print $1 }' "$file4" | xargs -n 1000 sh -c '
    subnets=$(echo "$@" | tr " " ",")
    nft add element inet proxy_rules cn_ipv4 { $subnets }
' sh

# add ipv6
awk '{ print $1 }' "$file6" | xargs -n 1000 sh -c '
    ipv6_addresses=$(echo "$@" | tr " " ",")
    nft add element inet proxy_rules cn_ipv6 { $ipv6_addresses }
' sh
